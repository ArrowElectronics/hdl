// SPDX-License-Identifier: GPL-2.0
/*
 * AD7606 Parallel Interface ADC driver
 *
 * Copyright 2011 Analog Devices Inc.
 */

#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/types.h>
#include <linux/err.h>
#include <linux/io.h>

#include <linux/iio/iio.h>
#include "ad7606.h"

#define burst_length_reg	((0x112)<<2)	
#define data_write_reg  	((0x114)<<2)
#define data_read_reg   	((0x113)<<2)
#define cnvst_en_reg    	((0x110)<<2)
#define up_cnv_rate_reg   	((0x111)<<2)

static int ad7606_par16_read_block(struct device *dev,
				   int count, void *buf)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);

	insw((unsigned long)st->base_address, buf, count);

	return 0;
}

static void ad7606_par_burst_length(struct device *dev,
				   int count)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);
	writel(count , (unsigned long)st->base_address + burst_length_reg);
}


static void ad7606_par_reg_write(struct device *dev,
				  unsigned int addr, unsigned int val)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int temp;
	ad7606_par_burst_length(dev,1);
	temp= ((addr & 0x7f)<<8) + (val & 0xff);
	writel( temp , (unsigned long)st->base_address + data_write_reg);
}

static char ad7606_par_reg_read(struct device *dev,
				  unsigned int addr)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int temp;
	ad7606_par_burst_length(dev,1);
	temp= (0x10 + (addr & 0x7f))<<8;
	writel( temp , (unsigned long)st->base_address + data_write_reg);

	return (char)(readl((unsigned long)st->base_address + data_read_reg););
}

static int aad7606_par_data_read(struct device *dev)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int reg;ddfdd
	writel(0x190,(unsigned long)st->base_address + up_cnv_rate_reg);// to configure convst rate
	writel(0x03,(unsigned long)st->base_address + cnvst_en_reg);// to enable convst signal
	ad7606_par_burst_length(dev,8);iiiiiiii
	reg=readl((unsigned long)st->base_address + data_read_reg);

	return 0;
}

static int ad7606_spi_off_write(struct ad7606_state *st)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);
	unsigned int reg;
	writel(0x00,(unsigned long)st->base_address + cnvst_en_reg);// to disable convst signal
	ad7606_par_burst_length(dev,1);
	return 0;
}


static const struct ad7606_bus_ops ad7606_par16_bops = {
	.read_block = ad7606_par16_read_block,
};

static int ad7606_par8_read_block(struct device *dev,
				  int count, void *buf)
{
	struct iio_dev *indio_dev = dev_get_drvdata(dev);
	struct ad7606_state *st = iio_priv(indio_dev);

	insb((unsigned long)st->base_address, buf, count * 2);

	return 0;
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
	/* OS of 128 and 256 are available only in software mode */
	st->oversampling_avail = ad7606B_oversampling_avail;
	st->num_os_ratios = ARRAY_SIZE(ad7606B_oversampling_avail);

	st->write_scale = ad7606_write_scale_sw;
	st->write_os = &ad7606_write_os_sw;

	/*
	 * Scale can be configured individually for each channel
	 * in software mode.
	 */
	indio_dev->channels = ad7606B_soft_channels;

	return 0;
}

static const struct ad7606_bus_ops ad7606_par8_bops = {
	.read_block = ad7606_par8_read_block,
};

static const struct ad7606_bus_ops ad7606B_par_bops = {
	//.read_block = ad7606_spi_read_block,
	.off_read = ad7606_par_data_read,
	.off_write = ad7606_par_data_write,
	.reg_read = ad7606_par_reg_read,
	.reg_write = ad7606_par_reg_write,
	//.write_mask = ad7606_spi_write_mask,
	//.rd_wr_cmd = ad7606B_spi_rd_wr_cmd,
	.sw_mode_config = ad7606B_sw_mode_config,
};


static int ad7606_par_probe(struct platform_device *pdev)
{
	const struct platform_device_id *id = platform_get_device_id(pdev);
	struct resource *res;
	void __iomem *addr;
	resource_size_t remap_size;
	int irq;
	
	const struct ad7606_bus_ops *bops;
	switch (id->name) {
	case ID_AD7605_4:
		bops = &ad7616_spi_bops;
		break;
	case ID_AD7606b:
		bops = &ad7606B_par_bops;
		break;
	default:
		bops = &ad7606_spi_bops;
		break;
	}

	irq = platform_get_irq(pdev, 0);
	if (irq < 0) {
		dev_err(&pdev->dev, "no irq: %d\n", irq);
		return irq;
	}

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	addr = devm_ioremap_resource(&pdev->dev, res);
	if (IS_ERR(addr))
		return PTR_ERR(addr);

	remap_size = resource_size(res);

	return ad7606_probe(&pdev->dev, irq, addr,
			    id->name, id->driver_data,
			    bops);
}

static const struct platform_device_id ad7606_driver_ids[] = {
	{ .name	= "ad7605-4", .driver_data = ID_AD7605_4, },
	{ .name	= "ad7606-4", .driver_data = ID_AD7606_4, },
	{ .name	= "ad7606-6", .driver_data = ID_AD7606_6, },
	{ .name	= "ad7606-8", .driver_data = ID_AD7606_8, },
	{ .name	= "ad7606b", .driver_data = ID_AD7606b, },
	{ }
};
MODULE_DEVICE_TABLE(platform, ad7606_driver_ids);

static const struct of_device_id ad7606_of_match[] = {
	{ .compatible = "adi,ad7605-4" },
	{ .compatible = "adi,ad7606-4" },
	{ .compatible = "adi,ad7606-6" },
	{ .compatible = "adi,ad7606-8" },
	{ .compatible = "adi,ad7606b" },
	{ },
};
MODULE_DEVICE_TABLE(of, ad7606_of_match);

static struct platform_driver ad7606_driver = {
	.probe = ad7606_par_probe,
	.id_table = ad7606_driver_ids,
	.driver = {
		.name = "ad7606",
		.pm = AD7606_PM_OPS,
		.of_match_table = ad7606_of_match,
	},
};
module_platform_driver(ad7606_driver);

MODULE_AUTHOR("Michael Hennerich <hennerich@blackfin.uclinux.org>");
MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
MODULE_LICENSE("GPL v2");
