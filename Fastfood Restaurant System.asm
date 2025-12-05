INCLUDE Irvine32.inc
.data
intro    BYTE "**********WELCOME TO SF CAFE**********",0

str1	 BYTE '(1)NUGGETS         Price:150(6 pieces)',0dh,0ah,0
str2	 BYTE '(2)FRIES           Price:100(medium)  ',0dh,0ah,0
str3	 BYTE '(3)FREID CHICKEN   Price:350(2 pieces)',0dh,0ah,0

str4     BYTE '(1)TIKKA           Price:250(1 pieces)',0dh,0ah,0
str5	 BYTE '(2)BEEF BOTI       Price:300(1 plate)',0dh,0ah,0
str6	 BYTE '(3)KABAB           Price:200(1 plate)',0dh,0ah,0

str7     BYTE '(1)PEPSI           Price:50',0dh,0ah,0
str8	 BYTE '(2)7UP             Price:50',0dh,0ah,0

str9     BYTE '(1)RICE            Price:100(1 plate)',0dh,0ah,0
str10    BYTE '(2)SALAD           Price:70(1 plate)',0dh,0ah,0
str11    BYTE '(3)RAITA           Price:50',0dh,0ah,0

op   	 BYTE "MENU OPTION ",0
fastfood BYTE "(1)FAST FOOD",0
bbq		 BYTE "(2)BBQ ",0
drinks   BYTE "(3)COLD DRINKS AND JUICES ",0
side     BYTE "(4)SIDE ORDER ",0
done     BYTE "(5)MAKE THE BILL ",0
back1	 BYTE '(4)BACK',0dh,0ah,0 
back2	 BYTE '(3)BACK',0dh,0ah,0
ask1     BYTE "ENTER THE OPTION WANT TO SELECT : ",0
ask2     BYTE "INCORRECT OPTION RE-ENTER !! ",0
pay      BYTE "PAYMENTS",0
quantity BYTE "ENTER THE QUANTITY : ",0
tbill    BYTE "TOTAL BILL-------------------------------------------",0
thank	 BYTE "*******************THANK YOU FOR ORDERING.YOUR ORDER WILL BE READY SOON******************* ",0dh,0ah,0

arrff	 DWORD 3 DUP (0)			;prices array of nuggets, fries and fried chicken respectively
arrbbq	 DWORD 3 DUP (0)			;prices array of tikka, beefboti and kabab respectively
arrcd	 DWORD 2 DUP (0)			;prices array of pepsi and 7-up respectively
arrside	 DWORD 3 DUP (0)			;prices array of salad, raita and rice respectively
quan	 DWORD 11 DUP(0)			;quantity array
total    DWORD ?					;total price
counter  DWORD 0
spacee	 BYTE "      ",0
multiply BYTE "x",0


.code 
main PROC

call start
call menu

exit 
main ENDP

start PROC
	mov eax,red+(white*16)
	call settextcolor
	call cursor1
	mov edx,offset intro
	call writestring
	call crlf
	call crlf
	call crlf
	mov eax,3000
	call delay
	call clrscr
ret
start ENDP


cursor1 PROC
	call clrscr
	mov dh,2
	mov dl,40
	call gotoxy
ret
cursor1 ENDP


cursor2 PROC
	mov dl,0
	mov dh,6
	call gotoxy
ret 
cursor2 ENDP


delayfunc PROC
	mov eax,2000
	call delay
	call clrscr
ret
delayfunc ENDP


fastfoodMenu PROC

	L1:
		mov esi,offset arrff
		mov edi,offset quan
		mov eax,0
		call cursor1
		mov edx,offset fastfood
		call writestring
		call cursor2
		mov edx,offset str1
		call writestring
		mov edx,offset str2
		call writestring
		mov edx,offset str3
		call writestring
		mov edx,offset back1
		call writestring
		call crlf
		call crlf 
		mov edx,offset ask1
		call writestring
		call readdec
		call crlf

		cmp eax,1
		je op1
		cmp eax,2
		je op2
		cmp eax,3
		je op3
		cmp eax,4
		je op4
		mov edx,offset ask2
		call writestring
		call delayfunc
	jmp L1

		op1:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi],eax
			mov ebx,150
			mul ebx
			mov [esi],eax
		jmp L1
	
		op2:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+4],eax
			mov ebx,100
			mul ebx
			mov [esi+4],eax
		jmp L1
	
		op3:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+8],eax
			mov ebx,350
			mul ebx
			mov [esi+8],eax
		jmp L1
	
		op4:

		ret 
fastfoodMenu ENDP

bbqMenu PROC
	L1:
		mov esi,offset arrbbq
		mov edi,offset quan
		call cursor1
		mov edx,offset bbq
		call writestring
		call cursor2
		mov edx,offset str4
		call writestring
		mov edx,offset str5
		call writestring
		mov edx,offset str6
		call writestring
		mov edx,offset back1
		call writestring
		call crlf
		call crlf 
		mov edx,offset ask1
		call writestring
		call readdec
		call crlf

		cmp eax,1
		je op1
		cmp eax,2
		je op2
		cmp eax,3
		je op3
		cmp eax,4
		je op4
		mov edx,offset ask2
		call writestring
	jmp L1

		op1:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+12],eax
			mov ebx,250
			mul ebx
			mov [esi],eax
		jmp L1
	
		op2:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+16],eax
			mov ebx,300
			mul ebx
			mov [esi+4],eax
		jmp L1
	
		op3:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+20],eax
			mov ebx,200
			mul ebx
			mov [esi+8],eax
		jmp L1
	
		op4:
		ret 
bbqMenu ENDP


drinkMenu PROC
	L1:
		mov esi,offset arrcd
		mov edi,offset quan
		call cursor1
		mov edx,offset drinks
		call writestring
		call cursor2
		mov edx,offset str7
		call writestring
		mov edx,offset str8
		call writestring
		mov edx,offset back2
		call writestring
		call crlf
		call crlf
		mov edx,offset ask1
		call writestring
		call readdec
		call crlf

		cmp eax,1
		je op1
		cmp eax,2
		je op2
		cmp eax,3
		je op3
		mov edx,offset ask2
		call writestring
		call delayfunc
	jmp L1

		op1:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+24],eax
			mov ebx,50
			mul ebx
			mov [esi],eax
		jmp L1
	
		op2:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+28],eax
			mov ebx,50
			mul ebx
			mov [esi+4],eax
		jmp L1
		
		op3:
		ret 
drinkMenu ENDP

sideMenu PROC
	L1:
		mov esi,offset arrside
		mov edi,offset quan
		call cursor1
		mov edx,offset side
		call writestring
		call cursor2
		mov edx,offset str9
		call writestring
		mov edx,offset str10
		call writestring
		mov edx,offset str11
		call writestring
		mov edx,offset back1
		call writestring
		call crlf
		call crlf 
		mov edx,offset ask1
		call writestring
		call readdec
		call crlf

		cmp eax,1
		je op1
		cmp eax,2
		je op2
		cmp eax,3
		je op3
		cmp eax,4
		je op4
		mov edx,offset ask2
		call writestring
		call delayfunc
	jmp L1

		op1:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+32],eax
			mov ebx,100
			mul ebx
			mov [esi],eax
		jmp L1

		op2:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+36],eax
			mov ebx,70
			mul ebx
			mov [esi+4],eax
		jmp L1

		op3:
			mov edx,offset quantity
			call writestring 
			call readdec
			mov [edi+40],eax
			mov ebx,50
			mul ebx
			mov [esi+8],eax
		jmp L1
		
		op4:
		ret
sideMenu ENDP


menu PROC
	L1:
		call cursor1
		mov edx,offset op
		call writestring
		call cursor2
		mov edx,offset fastfood
		call writestring
		call crlf
		mov edx,offset bbq
		call writestring
		call crlf
		mov edx,offset drinks
		call writestring
		call crlf
		mov edx,offset side
		call writestring
		call crlf
		mov edx,offset done
		call writestring
		call crlf
		call crlf 
		mov edx,offset ask1
		call writestring
		call readdec
	

		cmp eax,1
		je op1
		cmp eax,2
		je op2
		cmp eax,3
		je op3
		cmp eax,4
		je op4
		cmp eax,5
		je op5
		mov edx,offset ask2
		call writestring
		call delayfunc
	jmp L1

	
		op1:	
		call fastfoodMenu
		jmp L1
		op2:	
		call bbqMenu
		jmp L1
		op3:	
		call drinkMenu
		jmp L1
		op4:	
		call sideMenu
		jmp L1
		op5:
		call bill
ret
menu ENDP

bill PROC 

	call cursor1
	mov edx,offset pay
	call writestring
	call cursor2
	mov edi,offset quan
	mov esi,offset arrff

	

	n1:
	mov ebx,[edi]
	cmp ebx,0
	je n2
	mov edx,offset str1
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n2:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n3
	mov edx,offset str2
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n3:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n4
	mov edx,offset str3
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	
	n4:
	add esi,4
	add edi,4
	mov esi,offset arrbbq
	mov ebx,[edi]
	cmp ebx,0
	je n5
	mov edx,offset str4
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf
	
	n5:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n6
	mov edx,offset str5
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n6:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n7
	mov edx,offset str6
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n7:
	add esi,4
	add edi,4
	mov esi,offset arrcd
	mov ebx,[edi]
	cmp ebx,0
	je n8
	mov edx,offset str7
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n8:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n9
	mov edx,offset str8
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n9:
	add esi,4
	add edi,4
	mov esi,offset arrside
	mov ebx,[edi]
	cmp ebx,0
	je n10
	mov edx,offset str9
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n10:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je n11
	mov edx,offset str10
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	n11:
	add esi,4
	add edi,4
	mov ebx,[edi]
	cmp ebx,0
	je tot
	mov edx,offset str11
	call writestring
	mov edx,[esi]
	add total,edx
	mov edx,offset multiply
	call writestring
	mov eax,[edi]
	call writedec
	mov edx,offset spacee
	call writestring
	mov eax,[esi]
	call writedec
	call crlf

	tot:
	call crlf
	mov edx,offset tbill
	call writestring 
	mov eax,total
	call writedec
	call crlf
	mov edx,offset thank
	call writestring

ret 
bill ENDP


END main
