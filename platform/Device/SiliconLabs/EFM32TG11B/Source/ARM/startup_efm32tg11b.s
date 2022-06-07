;/**************************************************************************//**
; * @file
; * @brief    CMSIS Core Device Startup File for
; *           Silicon Labs EFM32TG11B Device Series
; ******************************************************************************
; * # License
; *
; * The licensor of this software is Silicon Laboratories Inc. Your use of this
; * software is governed by the terms of Silicon Labs Master Software License
; * Agreement (MSLA) available at
; * www.silabs.com/about-us/legal/master-software-license-agreement. This
; * software is Third Party Software licensed by Silicon Labs from a third party
; * and is governed by the sections of the MSLA applicable to Third Party
; * Software and the additional terms set forth below.
; *
; *****************************************************************************/
;/*
; ****************************************************************************/
;/*
; * Copyright (c) 2009-2021 Arm Limited. All rights reserved.
; *
; * SPDX-License-Identifier: Apache-2.0
; *
; * Licensed under the Apache License, Version 2.0 (the License); you may
; * not use this file except in compliance with the License.
; * You may obtain a copy of the License at
; *
; * www.apache.org/licenses/LICENSE-2.0
; *
; * Unless required by applicable law or agreed to in writing, software
; * distributed under the License is distributed on an AS IS BASIS, WITHOUT
; * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; * See the License for the specific language governing permissions and
; * limitations under the License.
; */


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA     RESET, DATA, READONLY

                AREA     RESET, DATA, READONLY, ALIGN=8
                EXPORT   __Vectors
                EXPORT   __Vectors_End
                EXPORT   __Vectors_Size

__Vectors       DCD      __initial_sp                        ;     Top of Stack
                DCD      Reset_Handler                       ; Reset Handler
                DCD      NMI_Handler                         ; -14 NMI Handler
                DCD      HardFault_Handler                   ; -13 Hard Fault Handler
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      0                                   ; Reserved
                DCD      SVC_Handler                         ; -5 SVCall Handler
                DCD      0                                   ; Reserved
                DCD      sl_app_properties                   ; Application properties
                DCD      PendSV_Handler                      ; PendSV Handler
                DCD      SysTick_Handler                     ; SysTick Handler

                ; External Interrupts


                DCD      EMU_IRQHandler                      ; 0: EMU Interrupt
                DCD      WDOG0_IRQHandler                    ; 1: WDOG0 Interrupt
                DCD      LDMA_IRQHandler                     ; 2: LDMA Interrupt
                DCD      GPIO_EVEN_IRQHandler                ; 3: GPIO_EVEN Interrupt
                DCD      SMU_IRQHandler                      ; 4: SMU Interrupt
                DCD      TIMER0_IRQHandler                   ; 5: TIMER0 Interrupt
                DCD      USART0_IRQHandler                   ; 6: USART0 Interrupt
                DCD      ACMP0_IRQHandler                    ; 7: ACMP0 Interrupt
                DCD      ADC0_IRQHandler                     ; 8: ADC0 Interrupt
                DCD      I2C0_IRQHandler                     ; 9: I2C0 Interrupt
                DCD      I2C1_IRQHandler                     ; 10: I2C1 Interrupt
                DCD      GPIO_ODD_IRQHandler                 ; 11: GPIO_ODD Interrupt
                DCD      TIMER1_IRQHandler                   ; 12: TIMER1 Interrupt
                DCD      USART1_IRQHandler                   ; 13: USART1 Interrupt
                DCD      USART2_IRQHandler                   ; 14: USART2 Interrupt
                DCD      UART0_IRQHandler                    ; 15: UART0 Interrupt
                DCD      LEUART0_IRQHandler                  ; 16: LEUART0 Interrupt
                DCD      LETIMER0_IRQHandler                 ; 17: LETIMER0 Interrupt
                DCD      PCNT0_IRQHandler                    ; 18: PCNT0 Interrupt
                DCD      RTCC_IRQHandler                     ; 19: RTCC Interrupt
                DCD      CMU_IRQHandler                      ; 20: CMU Interrupt
                DCD      MSC_IRQHandler                      ; 21: MSC Interrupt
                DCD      CRYPTO0_IRQHandler                  ; 22: CRYPTO0 Interrupt
                DCD      CRYOTIMER_IRQHandler                ; 23: CRYOTIMER Interrupt
                DCD      USART3_IRQHandler                   ; 24: USART3 Interrupt
                DCD      WTIMER0_IRQHandler                  ; 25: WTIMER0 Interrupt
                DCD      WTIMER1_IRQHandler                  ; 26: WTIMER1 Interrupt
                DCD      VDAC0_IRQHandler                    ; 27: VDAC0 Interrupt
                DCD      CSEN_IRQHandler                     ; 28: CSEN Interrupt
                DCD      LESENSE_IRQHandler                  ; 29: LESENSE Interrupt
                DCD      LCD_IRQHandler                      ; 30: LCD Interrupt
                DCD      CAN0_IRQHandler                     ; 31: CAN0 Interrupt

                SPACE   (0 * 4)          ; Remaining Interrupts are left out


__Vectors_End
__Vectors_Size  EQU      __Vectors_End - __Vectors


                AREA     |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT   SystemInit
                IMPORT   __main

                LDR      R0, =SystemInit
                BLX      R0
                LDR      R0, =__main
                BX       R0
                ENDP

; The default macro is not used for HardFault_Handler
; because this results in a poor debug illusion.
HardFault_Handler PROC
                EXPORT  HardFault_Handler         [WEAK]
                B        .
                ENDP

; Macro to define default exception/interrupt handlers.
; Default handler are weak symbols with an endless loop.
; They can be overwritten by real handlers.
                MACRO
                Set_Default_Handler  $Handler_Name
$Handler_Name   PROC
                EXPORT  $Handler_Name             [WEAK]
                B        .
                ENDP
                MEND


; Default exception/interrupt handler

                Set_Default_Handler  NMI_Handler
                Set_Default_Handler  SVC_Handler
                Set_Default_Handler  PendSV_Handler
                Set_Default_Handler  SysTick_Handler



                Set_Default_Handler  EMU_IRQHandler

                Set_Default_Handler  WDOG0_IRQHandler

                Set_Default_Handler  LDMA_IRQHandler

                Set_Default_Handler  GPIO_EVEN_IRQHandler

                Set_Default_Handler  SMU_IRQHandler

                Set_Default_Handler  TIMER0_IRQHandler

                Set_Default_Handler  USART0_IRQHandler

                Set_Default_Handler  ACMP0_IRQHandler

                Set_Default_Handler  ADC0_IRQHandler

                Set_Default_Handler  I2C0_IRQHandler

                Set_Default_Handler  I2C1_IRQHandler

                Set_Default_Handler  GPIO_ODD_IRQHandler

                Set_Default_Handler  TIMER1_IRQHandler

                Set_Default_Handler  USART1_IRQHandler

                Set_Default_Handler  USART2_IRQHandler

                Set_Default_Handler  UART0_IRQHandler

                Set_Default_Handler  LEUART0_IRQHandler

                Set_Default_Handler  LETIMER0_IRQHandler

                Set_Default_Handler  PCNT0_IRQHandler

                Set_Default_Handler  RTCC_IRQHandler

                Set_Default_Handler  CMU_IRQHandler

                Set_Default_Handler  MSC_IRQHandler

                Set_Default_Handler  CRYPTO0_IRQHandler

                Set_Default_Handler  CRYOTIMER_IRQHandler

                Set_Default_Handler  USART3_IRQHandler

                Set_Default_Handler  WTIMER0_IRQHandler

                Set_Default_Handler  WTIMER1_IRQHandler

                Set_Default_Handler  VDAC0_IRQHandler

                Set_Default_Handler  CSEN_IRQHandler

                Set_Default_Handler  LESENSE_IRQHandler

                Set_Default_Handler  LCD_IRQHandler

                Set_Default_Handler  CAN0_IRQHandler

                ALIGN


; User setup Stack & Heap

                IF       :LNOT::DEF:__MICROLIB
                IMPORT   __use_two_region_memory
                ENDIF

                EXPORT   __stack_limit
                EXPORT   __initial_sp
                IF       Heap_Size != 0                      ; Heap is provided
                EXPORT   __heap_base
                EXPORT   __heap_limit
                ENDIF

                END
