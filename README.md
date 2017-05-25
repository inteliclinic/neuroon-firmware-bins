# neuroon-firmware-bins
This script is valid only for Linux/MacOS

## Requiremets

+ **openOCD** - we are using 0.10.0 version
+ **make**
+ **ST-Link** - standalone or any compatible one. In time we will add other debuggers

## Usage

```make flash_app_classic``` - burn classic firmware

```make flash_app_open``` - burn new alpha firmware

```make flash_soft_device``` - burn Nordic Software device

```make flash_dfu``` - burn DFU

```make flash_bootloader``` - burn bootloader

```make flash_all_classic``` - burn classic firmware with bootloader, DFU and Nordic Software device

```make flash_all_open``` - burn new alpha firmware with bootloader, DFU and Nordic Software device

