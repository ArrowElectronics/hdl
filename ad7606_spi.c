// SPDX-License-Identifier: GPL-2.0
/*
 * AD7606 SPI ADC driver
 *
 * Copyright 2011 Analog Devices Inc.
 */

#include <linux/module.h>
#include <linux/spi/spi.h>
#include <linux/types.h>
#include <linux/err.h>

//#include <linux/dma-mapping.h>
//#include <linux/dmaengine.h>
#include <linux/spi/spi-engine.h>
#include <linux/iio/iio.h>
#include "ad7606.h"

#define MAX_SPI_FREQ_HZ		23500000	/* VDRIVE above 4.75 V */

#define AD7616_CONFIGURATION_REGISTER	0x02
#define AD7616_OS_MASK			GENMASK(4,  2)
#define AD7616_BURST_MODE		BIT(6)
#define AD7616_SEQEN_MODE		BIT(5)
#define AD7616_RANGE_CH_ADDR_OFF	0x04
#define AD7616_RANGE_CH_ADDR(ch)	((((ch) & 0x1) << 1) + ((ch) >> 3))
#define AD7616_RANGE_CH_MSK(ch)		(GENMASK(1, 0) << ((ch) & 0x6))
#define AD7616_RANGE_CH_MODE(ch, mode)	((mode) << (ch & GENMASK(2, 1)))

#define AD7606_CONFIGURATION_REGISTER	0x02
#define AD7606_SINGLE_DOUT		0x0
#define AD7606_QUAD_DOUT		0x10

/* AD7606_RANGE_CH_X_Y */
#define AD7606_RANGE_CH_MSK(ch)		(GENMASK(3, 0) << (4 * ((ch) % 2)))
#define AD7606_RANGE_CH_MODE(ch, mode)	\
	((GENMASK(3, 0) & mode) << (4 * ((ch) % 2)))
#define AD7606_RANGE_CH_ADDR(ch)	(0x03 + ((ch) >> 1))
#define AD7606_OS_MODE			0x08

static const unsigned int ad7606B_oversampling_avail[9] = {
	1, 2, 4, 8, 16, 32, 64, 128, 256
};

static const struct iio_chan_spec ad7606B_soft_channels[] = {
	IIO_CHAN_SOFT_TIMESTAMP(8),
	AD7606B_CHANNEL(0),
	AD7606B_CHANNEL(1),
	AD7606B_CHANNEL(2),
	AD7606B_CHANNEL(3),
	AD7606B_CHANNEL(4),
	AD7606B_CHANNEL(5),
	AD7606B_CHANNEL(6),
	AD7606B_CHANNEL(7),
};

static const struct iio_chan_spec ad7616_soft_channels[] = {
	IIO_CHAN_SOFT_TIMESTAMP(16),
	AD7606B_CHANNEL(0),
	AD7606B_CHANNEL(1),
	AD7606B_CHANNEL(2),
	AD7606B_CHANNEL(3),
	AD7606B_CHANNEL(4),
	AD7606B_CHANNEL(5),
	AD7606B_CHANNEL(6),
	AD7606B_CHANNEL(7),
	AD7606B_CHANNEL(8),
	AD7606B_CHANNEL(9),
	AD7606B_CHANNEL(10),
	AD7606B_CHANNEL(11),
	AD7606B_CHANNEL(12),
	AD7606B_CHANNEL(13),
	AD7606B_CHANNEL(14),
	AD7606B_CHANNEL(15),
};

static u16 ad7606B_spi_rd_wr_cmd(int addr, char isWriteOp)
{
	return (addr & 0x3F) | (((~isWriteOp) & 0x1) << 6);
}

static u16 ad7616_spi_rd_wr_cmd(int addr, char isWriteOp)
{
	return ((addr & 0x7F) << 1) | ((isWriteOp & 0x1) << 7);
}

static int ad7606_spi_read_block(struct device *dev,
				 int count, void *buf)
{
	 printk(KERN_DEBUG "In ad7606_spi_read_block function\n");
	struct spi_device *spi = to_spi_device(dev);
	int i, ret;
	unsigned short *data = buf;
	__be16 *bdata = buf;

	ret = spi_read(spi, buf, count * 2);
	if (ret < 0) {
		dev_err(&spi->dev, "SPI read error\n");
		return ret;
	}

	for (i = 0; i < count; i++)
		data[i] = be16_to_cpu(bdata[i]);

	return 0;
}


static int ad7606_spi_reg_read(struct ad7606_state *st, unsigned int addr)
{
	printk(KERN_DEBUG "In ad7606_spi_reg_read function\n");
	struct spi_device *spi = to_spi_device(st->dev);

	struct spi_transfer t[] = {
		{
			.tx_buf = &st->data[0],
			.len = 2,
			.cs_change = 0,
		}, {
			.rx_buf = &st->data[1],
			.len = 2,
		},
	};
	int ret;

	st->data[0] = cpu_to_be16(st->bops->rd_wr_cmd(addr, 0) << 8);
	ret = spi_sync_transfer(spi, t, ARRAY_SIZE(t));
	if (ret < 0)
		return ret;

	return be16_to_cpu(st->data[1]);
}

static int ad7606_spi_reg_write(struct ad7606_state *st,
				unsigned int addr,
				unsigned int val)
{
	printk(KERN_DEBUG "In ad7606_spi_reg_write function-1 \n");
	struct spi_device *spi = to_spi_device(st->dev);

	st->data[0] = cpu_to_be16((st->bops->rd_wr_cmd(addr, 1) << 8) |
				  (val & 0x1FF));

	return spi_write(spi, &st->data[0], sizeof(st->data[0]));
}


static int ad7606_spi_offload_enable(struct ad7606_state *st)
{
	printk(KERN_DEBUG "In ad7606_spi_off_read function\n");
	struct spi_device *spi = to_spi_device(st->dev);
	struct spi_message msg;
	int ret;
	unsigned int rx_data[8];
	
	struct spi_transfer xfer[] = {
			{
			.rx_buf = rx_data,
			.len = 16,
			.bits_per_word = 32,
			}
		};	

	spi_engine_write_reg(spi,0x111,0xFA);//to configure up_cnv rate
	spi_engine_write_reg(spi,0x110,0x03);//to enable cnvst and reset high

	if (1) {
		printk(KERN_DEBUG "In ad7606_spi_off_read function entry\n");
		spi_bus_lock(spi->master);
		spi_message_init_with_transfers(&msg, xfer, ARRAY_SIZE(xfer));
		ret = spi_engine_offload_load_msg(spi, &msg);
		if (ret < 0)
			return ret;
		spi_engine_offload_enable(spi, true);   
		
	}

	return ret;
}

static int ad7606_spi_offload_disable(struct ad7606_state *st)
{
	printk(KERN_DEBUG "In ad7606_spi_off_write function\n");
	struct spi_device *spi = to_spi_device(st->dev);
	spi_engine_write_reg(spi,0x110,0x00);//to disable cnvst and reset low
	if (1) {
		printk(KERN_DEBUG "In ad7606_spi_off_write function entry\n");
		spi_engine_offload_enable(spi, false);
		spi_bus_unlock(spi->master);
	}

	return 0;
}

static int ad7606_spi_write_mask(struct ad7606_state *st,
				 unsigned int addr,
				 unsigned long mask,
				 unsigned int val)
{
	printk(KERN_DEBUG "In ad7606_spi_write_mask  function \n");
	int readval;

	readval = ad7606_spi_reg_read(st, addr);
	if (readval < 0)
		return readval;

	readval &= ~mask;
	readval |= val;

	return ad7606_spi_reg_write(st, addr, readval);
}

static int ad7616_write_scale_sw(struct iio_dev *indio_dev, int ch, int val)
{
	printk(KERN_DEBUG "In ad7616_write_scale_sw  function \n");
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int ch_addr, mode;

	ch_addr = AD7616_RANGE_CH_ADDR_OFF + AD7616_RANGE_CH_ADDR(ch);
	mode = AD7616_RANGE_CH_MODE(ch, ((val + 1) & 0x3));

	return ad7606_spi_write_mask(st, ch_addr, AD7616_RANGE_CH_MSK(ch),
				     mode);
}

static int ad7616_write_os_sw(struct iio_dev *indio_dev, int val)
{
	struct ad7606_state *st = iio_priv(indio_dev);

	return ad7606_spi_write_mask(st, AD7616_CONFIGURATION_REGISTER,
				     AD7616_OS_MASK, val << 2);
}

static int ad7606_write_scale_sw(struct iio_dev *indio_dev, int ch, int val)
{
	struct ad7606_state *st = iio_priv(indio_dev);

	return ad7606_spi_write_mask(st,
				     AD7606_RANGE_CH_ADDR(ch),
				     AD7606_RANGE_CH_MSK(ch),
				     AD7606_RANGE_CH_MODE(ch, val));
}

static int ad7606_write_os_sw(struct iio_dev *indio_dev, int val)
{
	struct ad7606_state *st = iio_priv(indio_dev);

	return ad7606_spi_reg_write(st, AD7606_OS_MODE, val);
}

static int ad7606B_sw_mode_config(struct iio_dev *indio_dev)
{
	printk(KERN_DEBUG "In ad7606B_sw_mode_config  function \n");
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int buf[3];

	/*
	 * Software mode is enabled when all three oversampling
	 * pins are set to high. If oversampling gpios are defined
	 * in the device tree, then they need to be set to high,
	 * otherwise, they must be hardwired to VDD
	 */
	if (st->gpio_os) {
		memset32(buf, 1, ARRAY_SIZE(buf));
		gpiod_set_array_value(ARRAY_SIZE(buf),
				      st->gpio_os->desc, buf);
	}
	/* OS of 128 and 256 are available only in softwar(spi, false);
		spi_bus_unlock(spi->master);e mode */
	st->oversampling_avail = ad7606B_oversampling_avail;
	st->num_os_ratios = ARRAY_SIZE(ad7606B_oversampling_avail);

	st->write_scale = ad7606_write_scale_sw;
	st->write_os = &ad7606_write_os_sw;

	/* Configure device spi to output on a single channel */
	st->bops->reg_write(st,
			    AD7606_CONFIGURATION_REGISTER,
			   // AD7606_SINGLE_DOUT);
			   AD7606_QUAD_DOUT); //converted to the quad Dout by user
	/*
	 * Scale can be configured individually for each channel
	 * in software mode.
	 */
	indio_dev->channels = ad7606B_soft_channels;

	return 0;
}

static int ad7616_sw_mode_config(struct iio_dev *indio_dev)
{
	struct ad7606_state *st = iio_priv(indio_dev);

	/*
	 * Scale can be configured individually for each channel
	 * in software mode.
	 */
	indio_dev->channels = ad7616_soft_channels;

	st->write_scale = ad7616_write_scale_sw;
	st->write_os = &ad7616_write_os_sw;

	/* Activate Burst mode and SEQEN MODE */
	return st->bops->write_mask(st,
			      AD7616_CONFIGURATION_REGISTER,
			      AD7616_BURST_MODE | AD7616_SEQEN_MODE,
			      AD7616_BURST_MODE | AD7616_SEQEN_MODE);
}



static const struct ad7606_bus_ops ad7606_spi_bops = {
	.read_block = ad7606_spi_read_block,
};

static const struct ad7606_bus_ops ad7616_spi_bops = {
	.read_block = ad7606_spi_read_block,
	.reg_read = ad7606_spi_reg_read,
	.reg_write = ad7606_spi_reg_write,
	.write_mask = ad7606_spi_write_mask,
	.rd_wr_cmd = ad7616_spi_rd_wr_cmd,
	.sw_mode_config = ad7616_sw_mode_config,
};

static const struct ad7606_bus_ops ad7606B_spi_bops = {
	.read_block = ad7606_spi_read_block,
	.offload_enable = ad7606_spi_offload_enable,
	.offload_disable = ad7606_spi_offload_disable,
	.reg_read = ad7606_spi_reg_read,
	.reg_write = ad7606_spi_reg_write,
	.write_mask = ad7606_spi_write_mask,
	.rd_wr_cmd = ad7606B_spi_rd_wr_cmd,
	.sw_mode_config = ad7606B_sw_mode_config,
};

static int ad7606_spi_probe(struct spi_device *spi)
{
	printk(KERN_DEBUG "In ad7606_spi  probe function\n");
	const struct spi_device_id *id = spi_get_device_id(spi);
	const struct ad7606_bus_ops *bops;

	switch (id->driver_data) {
	case ID_AD7616:
		bops = &ad7616_spi_bops;
		break;
	case ID_AD7606B:
		bops = &ad7606B_spi_bops;
		break;
	default:
		bops = &ad7606_spi_bops;
		break;
	}


	return ad7606_probe(&spi->dev, spi->irq, NULL,
			    id->name, id->driver_data,
			    bops);
}

static const struct spi_device_id ad7606_id_table[] = {
	{ "ad7605-4", ID_AD7605_4 },
	{ "ad7606-4", ID_AD7606_4 },
	{ "ad7606-6", ID_AD7606_6 },
	{ "ad7606-8", ID_AD7606_8 },
	{ "ad7606b",  ID_AD7606B },
	{ "ad7616",   ID_AD7616 },
	{}
};
MODULE_DEVICE_TABLE(spi, ad7606_id_table);

static const struct of_device_id ad7606_of_match[] = {
	{ .compatible = "adi,ad7605-4" },
	{ .compatible = "adi,ad7606-4" },
	{ .compatible = "adi,ad7606-6" },
	{ .compatible = "adi,ad7606-8" },
	{ .compatible = "adi,ad7606b" },
	{ .compatible = "adi,ad7616" },
	{ },
};
MODULE_DEVICE_TABLE(of, ad7606_of_match);

static struct spi_driver ad7606_driver = {
	.driver = {
		.name = "ad7606",
		.of_match_table = ad7606_of_match,
		.pm = AD7606_PM_OPS,
	},
	.probe = ad7606_spi_probe,
	.id_table = ad7606_id_table,
};
module_spi_driver(ad7606_driver);

MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
MODULE_LICENSE("GPL v2");
