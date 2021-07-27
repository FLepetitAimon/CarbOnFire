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
L circuitPanneauCarbOnFire-rescue:molex2pin-LibrairieCarbonEye UalimArduino1
U 1 1 60E4B8DB
P 1050 4050
F 0 "UalimArduino1" H 672 3558 50  0000 R CNN
F 1 "molex2pin" H 672 3649 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 1050 4050 50  0001 C CNN
F 3 "" H 1050 4050 50  0001 C CNN
	1    1050 4050
	-1   0    0    1   
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
	1050 2900 1050 2600
Wire Wire Line
	4750 1250 4750 950 
Wire Wire Line
	6250 1350 6250 1950
Wire Wire Line
	6250 1950 6450 1950
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
Wire Wire Line
	1050 2900 1250 2900
Wire Wire Line
	1450 2900 1450 2300
Wire Wire Line
	1450 2300 1500 2300
Wire Wire Line
	1350 1750 1350 1500
Wire Wire Line
	850  1500 1350 1500
Connection ~ 1250 2900
Wire Wire Line
	1250 2900 1450 2900
$Comp
L power:GND #PWR0101
U 1 1 60E6BC39
P 3450 1250
F 0 "#PWR0101" H 3450 1000 50  0001 C CNN
F 1 "GND" H 3455 1077 50  0000 C CNN
F 2 "" H 3450 1250 50  0001 C CNN
F 3 "" H 3450 1250 50  0001 C CNN
	1    3450 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 1250 4750 1250
$Comp
L Connector:Screw_Terminal_01x14 J1
U 1 1 60E6D455
P 5050 2400
F 0 "J1" V 5175 2346 50  0000 C CNN
F 1 "Screw_Terminal_01x14" V 5266 2346 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-14-5.0-H_1x14_P5.00mm_Horizontal" H 5050 2400 50  0001 C CNN
F 3 "~" H 5050 2400 50  0001 C CNN
	1    5050 2400
	0    -1   -1   0   
$EndComp
Text GLabel 2000 2000 0    50   Input ~ 0
SwitchIn1
Text GLabel 2700 2300 2    50   Input ~ 0
SwitchIn2
Wire Wire Line
	2000 2000 2150 2000
Text GLabel 1350 1750 2    50   Input ~ 0
AnoLedIn
Text GLabel 1050 2050 1    50   Input ~ 0
CatLedIn
Text GLabel 3450 1250 3    50   Input ~ 0
gndIn
Text GLabel 6250 1350 0    50   Input ~ 0
SwitchOut2
Text GLabel 6250 1350 2    50   Input ~ 0
VccOut
Text GLabel 6750 950  1    50   Input ~ 0
gndOut
Text GLabel 7000 1950 2    50   Input ~ 0
CatLedOut
Text GLabel 7400 950  1    50   Input ~ 0
AnoLedOut
Text GLabel 2450 2300 0    50   Input ~ 0
Fusible2
Wire Wire Line
	4750 950  7900 950 
$Comp
L power:GND #PWR0102
U 1 1 60E7B783
P 2400 1000
F 0 "#PWR0102" H 2400 750 50  0001 C CNN
F 1 "GND" H 2405 827 50  0000 C CNN
F 2 "" H 2400 1000 50  0001 C CNN
F 3 "" H 2400 1000 50  0001 C CNN
	1    2400 1000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60E7C0D7
P 2400 850
F 0 "#FLG0101" H 2400 925 50  0001 C CNN
F 1 "PWR_FLAG" H 2400 1023 50  0000 C CNN
F 2 "" H 2400 850 50  0001 C CNN
F 3 "~" H 2400 850 50  0001 C CNN
	1    2400 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 850  2400 1000
$Comp
L Connector:Conn_01x10_Male J4
U 1 1 60E936C7
P 9900 3000
F 0 "J4" V 9827 2928 50  0000 C CNN
F 1 "Conn_01x10_Male" V 9736 2928 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 9900 3000 50  0001 C CNN
F 3 "~" H 9900 3000 50  0001 C CNN
	1    9900 3000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:4P4C J2
U 1 1 60E96BCA
P 8300 3500
F 0 "J2" H 8357 3967 50  0000 C CNN
F 1 "4P4C" H 8357 3876 50  0000 C CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" V 8300 3550 50  0001 C CNN
F 3 "~" V 8300 3550 50  0001 C CNN
	1    8300 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:4P4C J3
U 1 1 60E97CCE
P 8300 4300
F 0 "J3" H 8357 4767 50  0000 C CNN
F 1 "4P4C" H 8357 4676 50  0000 C CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" V 8300 4350 50  0001 C CNN
F 3 "~" V 8300 4350 50  0001 C CNN
	1    8300 4300
	1    0    0    -1  
$EndComp
Text GLabel 10200 2800 1    50   Input ~ 0
A1
Text GLabel 10100 2800 1    50   Input ~ 0
A0
$Comp
L power:GND #PWR0103
U 1 1 60EA57CA
P 8700 3600
F 0 "#PWR0103" H 8700 3350 50  0001 C CNN
F 1 "GND" H 8705 3427 50  0000 C CNN
F 2 "" H 8700 3600 50  0001 C CNN
F 3 "" H 8700 3600 50  0001 C CNN
	1    8700 3600
	1    0    0    -1  
$EndComp
Text GLabel 9500 2800 1    50   Input ~ 0
Vdd
Text GLabel 9600 2800 1    50   Input ~ 0
Gndgrove
Text GLabel 9700 2800 1    50   Input ~ 0
SCL
Text GLabel 9800 2800 1    50   Input ~ 0
SDA
Text GLabel 8700 3500 2    50   Input ~ 0
Vdd
Text GLabel 8700 3600 2    50   Input ~ 0
Gndgrove
Text GLabel 8700 3300 2    50   Input ~ 0
SCL
Text GLabel 8700 3400 2    50   Input ~ 0
SDA
Text GLabel 8700 4100 2    50   Input ~ 0
SCL
Text GLabel 8700 4200 2    50   Input ~ 0
SDA
Text GLabel 8700 4300 2    50   Input ~ 0
Vdd
Text GLabel 8700 4400 2    50   Input ~ 0
Gndgrove
NoConn ~ 9900 2800
NoConn ~ 10000 2800
NoConn ~ 10300 2800
NoConn ~ 10400 2800
$Comp
L Connector:4P4C J6
U 1 1 60EBE65B
P 4500 4000
F 0 "J6" H 4557 4467 50  0000 C CNN
F 1 "4P4C" H 4557 4376 50  0000 C CNN
F 2 "Connector_Molex:Molex_SL_171971-0004_1x04_P2.54mm_Vertical" V 4500 4050 50  0001 C CNN
F 3 "~" V 4500 4050 50  0001 C CNN
	1    4500 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 60EBF1B5
P 4450 4600
F 0 "J5" H 4558 4781 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4558 4690 50  0000 C CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-02A_1x02_P2.54mm_Vertical" H 4450 4600 50  0001 C CNN
F 3 "~" H 4450 4600 50  0001 C CNN
	1    4450 4600
	1    0    0    -1  
$EndComp
Text GLabel 4900 3800 2    50   Input ~ 0
Fusible1
Wire Wire Line
	850  1500 850  3550
Wire Wire Line
	1250 2900 1250 3550
$Comp
L Device:R R3
U 1 1 60EC06F8
P 5650 4000
F 0 "R3" H 5580 3954 50  0000 R CNN
F 1 "220" H 5580 4045 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5580 4000 50  0001 C CNN
F 3 "~" H 5650 4000 50  0001 C CNN
	1    5650 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 4000 5450 4000
Wire Wire Line
	5450 4000 5450 3850
Wire Wire Line
	5450 3850 5650 3850
Wire Wire Line
	5650 4150 4900 4150
Wire Wire Line
	4900 4150 4900 4100
Text GLabel 5550 4150 3    50   Input ~ 0
A1
$Comp
L Device:R R4
U 1 1 60EC1C19
P 5350 4850
F 0 "R4" H 5280 4804 50  0000 R CNN
F 1 "100" H 5280 4895 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5280 4850 50  0001 C CNN
F 3 "~" H 5350 4850 50  0001 C CNN
	1    5350 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 4700 5200 4700
Wire Wire Line
	5200 4700 5200 4850
Wire Wire Line
	5500 4850 5800 4850
Text GLabel 4650 4600 2    50   Input ~ 0
Fusible1
Text GLabel 5200 4700 2    50   Input ~ 0
A0
Text GLabel 1350 1500 2    50   Input ~ 0
gndIn
Text GLabel 1500 2300 2    50   Input ~ 0
Fusible1
Text GLabel 2150 1600 2    50   Input ~ 0
SwitchOut1
Text GLabel 2150 1600 0    50   Input ~ 0
VccIn
Wire Wire Line
	2150 2000 2150 1600
Text GLabel 4850 2600 3    50   Input ~ 0
Fusible2
Text GLabel 4450 2600 3    50   Input ~ 0
Fusible1
Text GLabel 5050 2600 3    50   Input ~ 0
SwitchOut2
Text GLabel 5250 2600 3    50   Input ~ 0
SwitchOut1
Text GLabel 5450 2600 3    50   Input ~ 0
AnoLedOut
Text GLabel 4650 2600 3    50   Input ~ 0
CatLedOut
Text GLabel 5550 2600 3    50   Input ~ 0
gndOut
Text GLabel 4950 2600 3    50   Input ~ 0
VccOut
Text GLabel 4750 2600 3    50   Input ~ 0
SwitchIn2
Text GLabel 5150 2600 3    50   Input ~ 0
SwitchIn1
Text GLabel 5650 2600 3    50   Input ~ 0
AnoLedIn
Text GLabel 4550 2600 3    50   Input ~ 0
CatLedIn
Text GLabel 5750 2600 3    50   Input ~ 0
gndIn
Text GLabel 5350 2600 3    50   Input ~ 0
VccIn
Wire Wire Line
	2450 2300 2700 2300
$Comp
L power:GND #PWR0104
U 1 1 60F25499
P 5800 4850
F 0 "#PWR0104" H 5800 4600 50  0001 C CNN
F 1 "GND" H 5805 4677 50  0000 C CNN
F 2 "" H 5800 4850 50  0001 C CNN
F 3 "" H 5800 4850 50  0001 C CNN
	1    5800 4850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60F25C19
P 4900 3900
F 0 "#PWR0105" H 4900 3650 50  0001 C CNN
F 1 "GND" V 4905 3772 50  0000 R CNN
F 2 "" H 4900 3900 50  0001 C CNN
F 3 "" H 4900 3900 50  0001 C CNN
	1    4900 3900
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
