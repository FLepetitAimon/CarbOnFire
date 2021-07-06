EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 60E42BF5
P 1800 2300
F 0 "SW1" H 1800 2567 50  0000 C CNN
F 1 "SW_DIP_x01" H 1800 2476 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 1800 2300 50  0001 C CNN
F 3 "~" H 1800 2300 50  0001 C CNN
	1    1800 2300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 60E441AA
P 5650 1350
F 0 "SW2" H 5650 1617 50  0000 C CNN
F 1 "SW_DIP_x01" H 5650 1526 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 5650 1350 50  0001 C CNN
F 3 "~" H 5650 1350 50  0001 C CNN
	1    5650 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 60E448EE
P 7150 1950
F 0 "D2" H 7143 1695 50  0000 C CNN
F 1 "LED" H 7143 1786 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm_IRGrey" H 7150 1950 50  0001 C CNN
F 3 "~" H 7150 1950 50  0001 C CNN
	1    7150 1950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 60E44EF6
P 1050 1900
F 0 "D1" V 997 1980 50  0000 L CNN
F 1 "LED" V 1088 1980 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm_IRGrey" H 1050 1900 50  0001 C CNN
F 3 "~" H 1050 1900 50  0001 C CNN
	1    1050 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 60E45EAD
P 1050 2450
F 0 "R1" H 980 2404 50  0000 R CNN
F 1 "500" H 980 2495 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 980 2450 50  0001 C CNN
F 3 "~" H 1050 2450 50  0001 C CNN
	1    1050 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 60E46AE4
P 6600 1950
F 0 "R2" V 6807 1950 50  0000 C CNN
F 1 "500" V 6716 1950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6530 1950 50  0001 C CNN
F 3 "~" H 6600 1950 50  0001 C CNN
	1    6600 1950
	0    -1   -1   0   
$EndComp
$Comp
L LibrairieCarbonEye:molex2pin UFusible1
U 1 1 60E4AA02
P 1550 850
F 0 "UFusible1" H 1928 451 50  0000 L CNN
F 1 "molex2pin" H 1928 360 50  0000 L CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 1550 850 50  0001 C CNN
F 3 "" H 1550 850 50  0001 C CNN
	1    1550 850 
	1    0    0    -1  
$EndComp
$Comp
L LibrairieCarbonEye:molex2pin Uarduino1
U 1 1 60E4B8DB
P 1050 4050
F 0 "Uarduino1" H 672 3558 50  0000 R CNN
F 1 "molex2pin" H 672 3649 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 1050 4050 50  0001 C CNN
F 3 "" H 1050 4050 50  0001 C CNN
	1    1050 4050
	-1   0    0    1   
$EndComp
$Comp
L LibrairieCarbonEye:molex2pin Ualphasense1
U 1 1 60E4BD88
P 2600 4000
F 0 "Ualphasense1" H 2222 3508 50  0000 R CNN
F 1 "molex2pin" H 2222 3599 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 2600 4000 50  0001 C CNN
F 3 "" H 2600 4000 50  0001 C CNN
	1    2600 4000
	-1   0    0    1   
$EndComp
$Comp
L LibrairieCarbonEye:connecteurCC12V UIn1
U 1 1 60E4C6A5
P 2850 900
F 0 "UIn1" H 2900 1006 50  0000 C CNN
F 1 "connecteurCC12V" H 2900 915 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 2850 900 50  0001 C CNN
F 3 "" H 2850 900 50  0001 C CNN
	1    2850 900 
	1    0    0    -1  
$EndComp
$Comp
L LibrairieCarbonEye:connecteurCC12V Uout1
U 1 1 60E4D0FD
P 6650 850
F 0 "Uout1" H 6700 956 50  0000 C CNN
F 1 "connecteurCC12V" H 6700 865 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx01_Slide_9.78x4.72mm_W7.62mm_P2.54mm" H 6650 850 50  0001 C CNN
F 3 "" H 6650 850 50  0001 C CNN
	1    6650 850 
	1    0    0    -1  
$EndComp
$Comp
L pspice:DIODE DRoueLibre1
U 1 1 60E4D7B0
P 7900 1800
F 0 "DRoueLibre1" V 7854 1928 50  0000 L CNN
F 1 "DIODE" V 7945 1928 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 7900 1800 50  0001 C CNN
F 3 "~" H 7900 1800 50  0001 C CNN
	1    7900 1800
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 60E4E535
P 8400 1850
F 0 "C1" H 8285 1804 50  0000 R CNN
F 1 "100n" H 8285 1895 50  0000 R CNN
F 2 "Capacitor_THT:C_Rect_L9.0mm_W2.6mm_P7.50mm_MKT" H 8438 1700 50  0001 C CNN
F 3 "~" H 8400 1850 50  0001 C CNN
	1    8400 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1050 2050 1050 2300
Wire Wire Line
	7000 1950 6750 1950
Wire Wire Line
	2750 1350 2750 1600
Wire Wire Line
	2750 1600 2150 1600
Wire Wire Line
	1050 2900 1050 2600
Wire Wire Line
	5950 1350 6250 1350
Wire Wire Line
	6550 1350 6550 1300
Wire Wire Line
	4750 1250 4750 950 
Wire Wire Line
	4750 950  6650 950 
Wire Wire Line
	6650 950  6650 1200
Wire Wire Line
	6250 1350 6250 1950
Wire Wire Line
	6250 1950 6450 1950
Connection ~ 6250 1350
Wire Wire Line
	6250 1350 6550 1350
Connection ~ 6650 950 
Wire Wire Line
	6250 1950 6250 2350
Wire Wire Line
	6250 2350 7900 2350
Wire Wire Line
	7900 2350 7900 2100
Connection ~ 6250 1950
Wire Wire Line
	7900 1600 7900 1400
Wire Wire Line
	8400 1700 8400 1400
Wire Wire Line
	8400 1400 7900 1400
Connection ~ 7900 1400
Wire Wire Line
	7900 1400 7900 950 
Wire Wire Line
	7900 2100 8400 2100
Wire Wire Line
	8400 2100 8400 2000
Connection ~ 7900 2100
Wire Wire Line
	7900 2100 7900 2000
Connection ~ 2850 1250
Wire Wire Line
	1750 1350 2300 1350
Wire Wire Line
	2300 1350 2300 1250
Wire Wire Line
	2300 1250 2850 1250
Wire Wire Line
	2150 1600 2150 2300
Wire Wire Line
	2150 2300 2100 2300
Wire Wire Line
	1050 2900 1250 2900
Wire Wire Line
	1450 2900 1450 2300
Wire Wire Line
	1450 2300 1500 2300
Wire Wire Line
	1050 1750 1350 1750
Wire Wire Line
	1350 1750 1350 1500
Wire Wire Line
	850  3550 850  3200
Wire Wire Line
	850  1500 1350 1500
Connection ~ 1350 1500
Wire Wire Line
	1350 1500 1350 1350
Wire Wire Line
	1250 3550 1250 3100
Connection ~ 1250 2900
Wire Wire Line
	1250 2900 1450 2900
Wire Wire Line
	2400 3500 2400 3200
Wire Wire Line
	2400 3200 850  3200
Connection ~ 850  3200
Wire Wire Line
	850  3200 850  1500
Wire Wire Line
	2800 3500 2800 3100
Wire Wire Line
	2800 3100 1250 3100
Connection ~ 1250 3100
Wire Wire Line
	1250 3100 1250 2900
Wire Wire Line
	2850 1250 4750 1250
Wire Wire Line
	2750 1600 5350 1600
Wire Wire Line
	5350 1600 5350 1350
Connection ~ 2750 1600
Wire Wire Line
	7300 950  7900 950 
Wire Wire Line
	6650 950  7300 950 
Connection ~ 7300 950 
Wire Wire Line
	7300 950  7300 1950
$EndSCHEMATC
