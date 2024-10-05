T and Z

.option post
.op

*For optimal accuracy, convergence, and runtime
***************************************************
.options POST
.options AUTOSTOP
.options INGOLD=2     DCON=1  ******   2  1
.options GSHUNT=1e-12 RMIN=1e-15 
.options ABSTOL=1e-5  ABSVDC=1e-4 
.options RELTOL=1e-2  RELVDC=1e-2 
.options NUMDGT=4    PIVOT=13        **** .options NUMDGT=4     PIVOT=13 
.param   TEMP=25
***************************************************
.lib 'CNFET.lib' CNFET
***************************************************


***************************************************
*Beginning of circuit and device definitions
***************************************************
*Supplies and voltage params:

*Some CNFET parameters:
.param Ccsd=0      CoupleRatio=0
.param m_cnt=1     Efo=0.6     
.param Wg=0        Cb=40e-12
.param Lg=32e-9    Lgef=100e-9
.param Vfn=0       Vfp=0      
.param Hox=4e-9    Kox=16 

.param Vddval=0.9
.param Supply=0.9
.param Vd='Supply'
.param Vd2='Supply/2'
.param Td=20p
.param c_load=3.5f

*** Voltage ***
Vdd Vdd 0 DC VddVal 
Vdd2 Vdd2 0 DC Vd2

**** 1 GHz
vX X gnd pwl 0ns 0v, 0.0001ns 0v, 3ns 0v, 3.0001ns vd2, 6ns vd2,6.0001ns vd,10ns vd
vY Y gnd pwl 0ns 0v, 0.0001ns 0v, 1ns 0v, 1.0001ns vd2, 2ns vd2,2.0001ns vd,3ns vd, 3.0001ns 0v, 4ns 0v, 4.0001ns vd2, 5ns vd2, 5.0001ns vd, 6ns vd, 6.0001ns 0v, 7ns 0v, 7.0001ns vd2, 8ns vd2, 8.0001ns vd, 10ns vd 

**vX X gnd pwl 0ns 0v, '0+td' 0v, 10ns 0v, '10n+td' vd, 20ns vd, '20n+td' vd2, 30ns vd2, '30n+td' vd, 40ns vd, '40n+td' 0V, 50ns 0V, '50n+td' 0V, 60ns 0V, '60n+td' vd2, 70ns vd2, '70n+td' vd, 80ns vd, '80n+td' vd, 100ns vd 
**vY Y gnd pwl 0ns 0v, '0+td' 0v, 10ns 0v, '10n+td' vd, 20ns vd, '20n+td' vd2, 30ns vd2, '30n+td' 0v, 40ns 0v, '40n+td' vd, 50ns vd, '50n+td' vd, 60ns vd, '60n+td' 0v, 70ns 0v, '70n+td' vd2, 80ns vd2, '80n+td' vd, 100ns vd 

*vX X gnd pwl 0ns 0v, '10n+td' 0v, 30ns 0v, '30n+td' vd2, 60ns vd2, '60n+td' vd, 100ns vd
*vY Y gnd pwl 0ns 0v, '0+td' 0v, 10ns 0v, '10n+td' vd2, 20ns vd2, '20n+td' vd, 30ns vd, '30n+td' 0v, 40ns 0v, '40n+td' vd2, 50ns vd2, '50n+td' vd, 60ns vd, '60n+td' 0v, 70ns 0v, '70n+td' vd2, 80ns vd2, '80n+td' vd, 100ns vd 

**** 100 MHz
*vX X gnd pwl 0ns vd, '0+td' vd, 10ns vd, '10n+td' vd2, 20ns vd2, '20n+td' vd, 30ns vd, '30n+td' 0v, 40ns 0v, '40n+td' 0v, 50ns 0v, '50n+td' vd2, 60ns vd2
*vY Y gnd pwl 0ns vd, '0+td' vd, 10ns vd, '10n+td' vd, 20ns vd, '20n+td' 0v, 30ns 0v, '30n+td' 0v, 40ns 0v, '40n+td' vd2, 50ns vd2, '50n+td' vd2, 60ns vd2 


********************A0 = NTI (A)
XCNTp01	X0	X	Vdd	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

XCNTn01	X0	X	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

********************B0 = NTI (B)
XCNTp02	Y0	Y	Vdd	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

XCNTn02	Y0	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

********************PA = PTI (A)
XCNTp03	PX	X	Vdd	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

XCNTn03	PX	X	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

********************PB = PTI (B)
XCNTp04	PY	Y	Vdd	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

XCNTn04	PY	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=3

********************A1
XCNTp05	X1	X0	PX	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=55  n2=0  tubes=3

XCNTn05	X1	X0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

********************B1
XCNTp06	Y1	Y0	PY	Vdd	PCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=55  n2=0  tubes=3

XCNTn06	Y1	Y0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3


**********************Path to generate T
********************* PATH GENERATE '1'

XCNTnn1	n2	X1	n3	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15

XCNTnn2	n3	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15  ** for 1 and 2

XCNTnn3	n2	X0	n4	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15

XCNTnn4	n4	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=15

XCNTnn5	n2	X	n1	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=15

XCNTnn6	n1	Y1	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15

XCNTnn7	n1	Y0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15


********************


********Pull Up path '1'

XCNTpp1 m1 X1 vdd vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=15

XCNTpp2 m1 Y vdd vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=15  *** Y=Y1 + Y2

XCNTpp3 m2 X0 m1 vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=15

XCNTpp4 m2 Y m1 vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15  *** Y = Y2

XCNTpp5 n2 X m2 vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15   *** X= X2

XCNTpp6 m3 Y1 m2 vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=15

XCNTpp7 n2 Y0 m3 vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=8  n2=0  tubes=15

************


********************** PATH GENERATE '2'

XCNTnn8	n9	X	n5	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=15  *** X= X2

XCNTnn9	n5	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=15  *** Y= Y2


************ Pull Down '2'


XCNTpp8 n9 X vdd vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15 *** X= X2

XCNTpp9 n9 Y vdd vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15  *** Y= Y2

**********'2'

XCNTpp10 T n9 vdd vdd pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15  *** Y= Y2 '2'

XCNTpp11 T n2 vdd2 vdd2 pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15  **'1'

XCNTnn10	T	n9	k4	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15

XCNTnn11	k4	n2	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=15


************End of T

************Start of Z
********************** PATH GENERATE '1'

XCNTn1	O1	X1	O2	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn2	O2	Y0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn3	O2	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=10

XCNTn4	O1	Y1	O3	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn5	O3	X0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn6	O3	X	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=10

********************** PATH GENERATE '0'

XCNTn7	Z	X0	O4	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn8	O4	Y	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=10

XCNTn9	Z	X	O4	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=10  n2=0  tubes=10

XCNTn10	O4	Y0	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn11	Z	X1	O5	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10

XCNTn12	O5	Y1	0	0	NCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9 Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=10


XCNTpp13 Z O1 vdd2 vdd2 pCNFET Lch=Lg  Lgeff='Lgef' Lss=32e-9  Ldd=32e-9  Kgate='Kox' Tox='Hox' Csub='Cb' Vfbn='Vfn' Dout=0  Sout=0  Pitch=20e-9  n1=19  n2=0  tubes=3

**********End of Z

C01	T	0	c_load
C02	Z	0	c_load

.Tran .01n 10n

***********DELEAY OF SUM

.MEASURE TRAN pow AVG POWER FROM=0n TO=10n


.END