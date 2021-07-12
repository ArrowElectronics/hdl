/*
 * SPI-Engine SPI controller driver
 * Copyright 2015 Analog Devices Inc.
 *  Author: Lars-Peter Clausen <lars@metafoo.de>
 *
 * Licensed under the GPL-2.
 */

#ifndef _INCLUDE_LINUX_SPI_SPI_ENGINE_H_
#define _INCLUDE_LINUX_SPI_SPI_ENGINE_H_

#ifdef CONFIG_SPI_AXI_SPI_ENGINE

bool spi_engine_offload_supported(struct spi_device *spi);
void spi_engine_offload_enable(struct spi_device *spi, bool enable);
int spi_engine_offload_load_msg(struct spi_device *spi,
	struct spi_message *msg);
int spi_engine_write_reg(struct spi_device *spi,unsigned int addr,unsigned int val);

#else

static inline bool spi_engine_offload_supported(struct spi_device *spi)
{
	return false;
}

static inline void spi_engine_offload_enable(struct spi_device *spi, bool enable)
{
}

static inline int spi_engine_offload_load_msg(struct spi_device *spi,
	struct spi_message *msg)
{
	return -ENODEV;
}

static inline int spi_engine_write_reg(struct spi_device *spi,unsigned int addr,unsigned int val)
{
}

#endif

#endif
