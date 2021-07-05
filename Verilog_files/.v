`timescale 1ns / 1ps

/*********************************************************************************
* Create Date: 01/19/2021 08:53:06 PM                                            *
* Module Name: FP_Multiplier                                                     *
* N : Number of bits 16 - 32 - 64                                                *
* E : Exponent Width 5  - 8  - 11                                                *
* M : Mantissa Width 10 - 23 - 52                                                *
* Bias: 2**(E-1)-1                                                               *
**********************************************************************************/


module 
  #(parameter
	DATA_WIDTH = 23
