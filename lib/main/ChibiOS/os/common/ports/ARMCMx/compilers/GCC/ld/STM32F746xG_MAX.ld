/*
    ChibiOS - Copyright (C) 2006..2015 Giovanni Di Sirio

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

/*
 * ST32F746xG maximum RAM setup.
 * 
 * RAM0 - Data, BSS, Heap.
 * RAM3 - Main Stack, Process Stack, NOCACHE, ETH.
 *
 * Notes:
 * BSS is placed in cached RAM, DMA buffers management is delegated to the
 * application code. This setup maximizes the linear RAM available to BSS and
 * Heap.
 */
MEMORY
{
    flash       : org = 0x08000000, len = 1M
    flash_itcm  : org = 0x00200000, len = 1M
    ram0        : org = 0x20010000, len = 256k    /* SRAM1 + SRAM2 */
    ram1        : org = 0x20010000, len = 240k    /* SRAM1 */
    ram2        : org = 0x2004C000, len = 16k     /* SRAM2 */
    ram3        : org = 0x20000000, len = 64k     /* DTCM-RAM */
    ram4        : org = 0x00000000, len = 16k     /* ITCM-RAM */
    ram5        : org = 0x40024000, len = 4k      /* BCKP SRAM */
    ram6        : org = 0x00000000, len = 0
    ram7        : org = 0x00000000, len = 0
}

/* RAM region to be used for Main stack. This stack accommodates the processing
   of all exceptions and interrupts*/
REGION_ALIAS("MAIN_STACK_RAM", ram3);

/* RAM region to be used for the process stack. This is the stack used by
   the main() function.*/
REGION_ALIAS("PROCESS_STACK_RAM", ram3);

/* RAM region to be used for data segment.*/
REGION_ALIAS("DATA_RAM", ram0);

/* RAM region to be used for BSS segment.*/
REGION_ALIAS("BSS_RAM", ram0);

/* RAM region to be used for the default heap.*/
REGION_ALIAS("HEAP_RAM", ram0);

/* RAM region to be used for nocache segment.*/
REGION_ALIAS("NOCACHE_RAM", ram3);

/* RAM region to be used for eth segment.*/
REGION_ALIAS("ETH_RAM", ram3);

INCLUDE ld/rules_STM32F7xx.ld
