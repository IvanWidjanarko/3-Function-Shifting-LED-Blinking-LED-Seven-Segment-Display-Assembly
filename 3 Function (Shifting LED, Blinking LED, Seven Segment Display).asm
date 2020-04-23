;---------------Konstanta----------------
TOM_ON1	EQU P0.1		; Port Tombol Fungsi 1, yaitu Port 0 Bit 1
TOM_ON2	EQU P0.2		; Port Tombol Fungsi 2, yaitu Port 0 Bit 2
TOM_ON3	EQU P0.3		; Port Tombol Fungsi 3, yaitu Port 0 Bit 3
LED1	EQU P1			; Port LED (Kanan ke Kiri), yaitu Port 1 (Bit 0 paling kiri, Bit 7 paling kanan)
LED2	EQU P2			; Port LED (Kelap-Kelip), yaitu Port 2 (Bit 0 paling kiri, Bit 7 paling kanan)
SEGMENT	EQU P3			; Port Seven Segment, yaitu Port 3
MATI	EQU 0FFH		; Mematikan LED maupun Seven Segment
GENAP	EQU 0AAH		; LED (Kelap-Kelip) Genap (Bit 0, 2, 4, dan 6)
GANJIL	EQU 055H		; LED (Kelap-Kelip) Ganjil (Bit 1, 3, 5, dan 7)
TIME_A	EQU 0FFH		; Konstanta untuk delay dengan timer
TIME_B	EQU 0FEH		; Konstanta untuk delay dengan timer
TIME_1	EQU 01H			; Konstanta untuk delay tanpa timer
TIME_2	EQU 01H			; Konstanta untuk delay tanpa timer
MODE	EQU 01H			; Mode Timer (TMOD)
CLEAR	EQU 00H			; Reset Timer (TL0)

	ORG 00H			; Alamat awal dimulai dari 00H

;---------------Main Function---------------
MAIN:	MOV LED1,#MATI		; Set awal LED (Kanan ke Kiri) mati
	MOV LED2, #MATI		; Set awal LED (Kelap-Kelip) mati
	MOV SEGMENT, #MATI	; Set awal Seven Segment mati
	JNB TOM_ON1, FUNG_1	; Fungsi 1
	JNB TOM_ON2, FUNG_2F	; Fungsi 2
	JNB TOM_ON3, FUNG_3F	; Fungsi 3
	JMP MAIN		; Loop jika tidak ada input

; ---------------Fungsi Pertama (LED dari Kanan ke Kiri dan kembali ke Kanan)---------------
FUNG_1:	CLR LED1.7		; Menyalakan LED paling kanan (Port 1 Bit 7)
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.7		; Mematikan LED Port 1 Bit 7
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.6		; Menyalakan LED Port 1 Bit 6
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.6		; Mematikan LED Port 1 Bit 6
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.5		; Menyalakan LED Port 1 Bit 5
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.5		; Mematikan LED Port 1 Bit 5
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.4		; Menyalakan LED Port 1 Bit 4
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.4		; Mematikan LED Port 1 Bit 4
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.3		; Menyalakan LED Port 1 Bit 3
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.3		; Mematikan LED Port 1 Bit 3
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.2		; Menyalakan LED Port 1 Bit 2
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.2		; Mematikan LED Port 1 Bit 2
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.1		; Menyalakan LED Port 1 Bit 1
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.1		; Mematikan LED Port 1 Bit 1
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.0		; Menyalakan LED paling kiri (Port 1 Bit 0)
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.0		; Mematikan LED Port 1 Bit 0
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

FUNG_2F: JMP FUNG_2		; Flag untuk ke Fungsi 2
FUNG_3F: JMP FUNG_3		; Flag untuk ke Fungsi 3

	CLR LED1.1		; Menyalakan LED Port 1 Bit 1
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.1		; Mematikan LED Port 1 Bit 1
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.2		; Menyalakan LED Port 1 Bit 2
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.2		; Mematikan LED Port 1 Bit 2
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.3		; Menyalakan LED Port 1 Bit 3
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.3		; Mematikan LED Port 1 Bit 3
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.4		; Menyalakan LED Port 1 Bit 4
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.4		; Mematikan LED Port 1 Bit 4
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.5		; Menyalakan LED Port 1 Bit 5
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.5		; Mematikan LED Port 1 Bit 5
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	CLR LED1.6		; Menyalakan LED Port 1 Bit 6
	ACALL DELAY		; Memanggil fungsi delay tanpa timer
	SETB LED1.6		; Mematikan LED Port 1 Bit 6
	JB TOM_ON1,MF_1		; Jika Tombol Fungsi 1 ditekan kembali, fungsi di reset

	JMP FUNG_1		; Kembali ke LED paling kanan (Port 1 Bit 7)
MF_1:	JMP MAIN		; Kembali menunggu input user

; ---------------Fungsi Kedua (LED Kelap-Kelip (Genap-Ganjil-Genap-Ganjil-dst))---------------
FUNG_2:	MOV LED2, #GENAP	; Menyalakan LED Genap (Port 2 Bit 0, 2, 4, dan 6)
	ACALL DELAY_TIMER	; Memanggil fungsi delay dengan timer
	JB TOM_ON2,MF_1		; Jika Tombol Fungsi 2 ditekan kembali, fungsi di reset

	MOV LED2, #GANJIL	; Menyalakan LED Ganjil (Port 2 Bit 1, 3, 5, dan 7)
	ACALL DELAY_TIMER	; Memanggil fungsi delay dengan timer
	JB TOM_ON2,MF_1		; Jika Tombol Fungsi 2 ditekan kembali, fungsi di reset

	JMP FUNG_2		; Kembali ke LED Genap (Port 2 Bit 0, 2, 4, dan 6)
MF_2:	JMP MAIN		; Kembali menunggu input user

; ---------------Fungsi Ketiga (Seven Segment dari 0 ke 9 dan kembali ke 0)---------------
FUNG_3:	MOV SEGMENT, #0C0H	; Menampilkan angka 0 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #0F9H	; Menampilkan angka 1 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #0A4H	; Menampilkan angka 2 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #0B0H	; Menampilkan angka 3 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #099H	; Menampilkan angka 4 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #092H	; Menampilkan angka 5 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #082H	; Menampilkan angka 6 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #0F8H	; Menampilkan angka 7 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #080H	; Menampilkan angka 8 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3,MF_1		; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset

	MOV SEGMENT, #090H	; Menampilkan angka 9 pada 7 segment
	ACALL DELAY		; Memanggil subroutine DELAY (2500 cycle)
	JB TOM_ON3, MF_1	; Jika Tombol Fungsi 3 ditekan kembali, fungsi di reset
	
	JMP FUNG_3		; Kembali ke angka 0 pada 7 segment
MF_3:	JMP MAIN		; Kembali menunggu input user

;---------------Fungsi Delay (Tanpa Timer))---------------
DELAY:	MOV R7, #TIME_1		; Delay tanpa timer (01H)
DELAY2:	MOV R6, #TIME_2		; Delay tanpa timer (01H)
DELAY3:	DJNZ R6, DELAY3		; Delay tanpa timer (Loop hingga R6 bernilai 00H)
	DJNZ R7, DELAY2		; Delay tanpa timer (Loop hingga R7 bernilai 00H)
RET				; Akhir dari fungsi delay tanpa timer

;---------------Fungsi Delay (Dengan Timer))---------------
DELAY_TIMER:			; Delay dengan timer
	SETB EA			; Delay dengan timer (Menyalakan Interrupt EA)
	MOV TMOD, #MODE		; Delay dengan timer (Memilih mode 1, yaitu 16-bit Timer)
	MOV TH0, #TIME_A	; Delay dengan timer (0FFH)
	MOV TL0, #TIME_B	; Delay dengan timer (0FEH)
	SETB TR0		; Delay dengan timer (Menyalakan Timer0)
LOOP_TIMER:			; Delay dengan timer
	JNB TF0, LOOP_TIMER	; Delay dengan timer (Menghitung mundur timer hingga TH0 kembali 00H dan TL0 kembali 00H)
	CLR TR0			; Delay dengan timer (Mematikan Timer0)
	MOV TL0, #CLEAR		; Delay dengan timer (Mereset TL0)
RET				; Akhir dari fungsi delay dengan timer

END				; Akhir dari program