# Neuroon Firmware Binaries #

Neuroon firmware binaries and tools to flash them in a hardware.

## Getting Started ##

This script is valid only for Linux/MacOS.

### Requiremets ###

- __openOCD__ - we are using 0.10.0 version.
- __make__
- __ST-Link__ - standalone or any compatible one. In time we will add other debuggers.

## Usage ##

If you would like to flash Neuroon's firmware you should connect your hardware to the SWD debugger (photo-instruction in _wired\_connection\_manual.pdf_).

Neuroon's firmware consists of bootloader, DFU (Device Firmware Upgrade module), NRF51 SoftDevice and application firmware. Application firmware
is in two versions:
- _neuroon\_classic.bin_
- _neuroon\_open.bin_ (new alpha firmware).

It is possible to flash Neuroon's firmware part by part (_Makefile Commands_ below), but the fastest and the simplest way is to flash all the firmware in one command ```make flash_all_classic``` or ```make flash_all_open```. You may also change only one part of firmware without changing the rest e. g. after flashing bootloader, DFU and SoftDevice, you can only swap application firmware version from classic to new alpha using ```make flash_app_open```.

### Makefile Commands ###

```make flash_app_classic``` - burn classic firmware

```make flash_app_open``` - burn new alpha firmware

```make flash_soft_device``` - burn Nordic SoftDevice

```make flash_dfu``` - burn DFU

```make flash_bootloader``` - burn bootloader

```make flash_all_classic``` - burn classic firmware with bootloader, DFU and Nordic SoftDevice

```make flash_all_open``` - burn new alpha firmware with bootloader, DFU and Nordic SoftDevice

```make jlink_all_classic``` - burn classic firmware with bootloader, DFU and Nordic SoftDevice using JLink

```make jlink_all_open_deprecated``` - burn deprecated firmware with bootloader, DFU and Nordic SoftDevice using JLink

```make jlink_all_open``` - burn new alpha firmware with bootloader, DFU and Nordic SoftDevice using JLink
## Contributing ##

Soon...

## Authors ##

- Paweł Kaźmierzewski _p.kazmierzewski@inteliclinic.com_
- Wojtek Węclewski    _w.weclewski@inteliclinic.com_

## License ##

This project is licensed under the MIT License - see the LICENSE file for details.
