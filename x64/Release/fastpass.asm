; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	LineStoreCurr:QWORD
COMM	StoreState:BYTE
COMM	UseSavedState:BYTE
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
COMM	ZEROLOCALS:BYTE
_DATA	ENDS
_DATA	SEGMENT
$SG10812 DB	'OUT', 00H
_DATA	ENDS
PUBLIC	FastpassInit
PUBLIC	StoreLine
PUBLIC	SkipSavedState
PUBLIC	RestoreState
PUBLIC	SaveVariableState
EXTRN	isspace:PROC
EXTRN	isalnum:PROC
EXTRN	_memicmp:PROC
EXTRN	LclAlloc:PROC
EXTRN	SymSetCmpFunc:PROC
EXTRN	GetLineNumber:PROC
EXTRN	get_curr_srcfile:PROC
EXTRN	SetOfssize:PROC
EXTRN	SegmentSaveState:PROC
EXTRN	AssumeSaveState:PROC
EXTRN	ContextSaveState:PROC
EXTRN	memcpy:PROC
EXTRN	ModuleInfo:BYTE
EXTRN	MacroLevel:BYTE
EXTRN	list_pos:DWORD
_BSS	SEGMENT
modstate DB	01e0H DUP (?)
LineStore DB	010H DUP (?)
_BSS	ENDS
pdata	SEGMENT
$pdata$StoreLine DD imagerel $LN31
	DD	imagerel $LN31+45
	DD	imagerel $unwind$StoreLine
$pdata$0$StoreLine DD imagerel $LN31+45
	DD	imagerel $LN31+50
	DD	imagerel $chain$0$StoreLine
$pdata$1$StoreLine DD imagerel $LN31+50
	DD	imagerel $LN31+326
	DD	imagerel $chain$1$StoreLine
$pdata$2$StoreLine DD imagerel $LN31+326
	DD	imagerel $LN31+434
	DD	imagerel $chain$2$StoreLine
$pdata$3$StoreLine DD imagerel $LN31+434
	DD	imagerel $LN31+498
	DD	imagerel $chain$3$StoreLine
$pdata$RestoreState DD imagerel $LN14
	DD	imagerel $LN14+255
	DD	imagerel $unwind$RestoreState
$pdata$SaveVariableState DD imagerel $LN7
	DD	imagerel $LN7+112
	DD	imagerel $unwind$SaveVariableState
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$SaveState DD imagerel SaveState
	DD	imagerel SaveState+204
	DD	imagerel $unwind$SaveState
pdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$SaveState DD 010401H
	DD	04204H
xdata	ENDS
xdata	SEGMENT
$unwind$StoreLine DD 061001H
	DD	096410H
	DD	085410H
	DD	0e00c3210H
$chain$0$StoreLine DD 020521H
	DD	063405H
	DD	imagerel $LN31
	DD	imagerel $LN31+45
	DD	imagerel $unwind$StoreLine
$chain$1$StoreLine DD 020521H
	DD	077405H
	DD	imagerel $LN31+45
	DD	imagerel $LN31+50
	DD	imagerel $chain$0$StoreLine
$chain$2$StoreLine DD 021H
	DD	imagerel $LN31+45
	DD	imagerel $LN31+50
	DD	imagerel $chain$0$StoreLine
$chain$3$StoreLine DD 021H
	DD	imagerel $LN31
	DD	imagerel $LN31+45
	DD	imagerel $unwind$StoreLine
$unwind$RestoreState DD 010401H
	DD	04204H
$unwind$SaveVariableState DD 020601H
	DD	030023206H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
;	COMDAT SaveState
_TEXT	SEGMENT
SaveState PROC						; COMDAT

; 51   : {

	sub	rsp, 40					; 00000028H

; 52   :     DebugMsg1(("SaveState enter\n" ));
; 53   :     StoreState = TRUE;
; 54   :     UseSavedState = TRUE;
; 55   :     modstate.init = TRUE;
; 56   :     modstate.Equ.head = modstate.Equ.tail = NULL;

	xor	eax, eax
	mov	BYTE PTR StoreState, 1
	mov	QWORD PTR modstate+16, rax

; 57   : 
; 58   :     memcpy( &modstate.modinfo, (uint_8 *)&ModuleInfo + sizeof( struct module_vars ), sizeof( modstate.modinfo ) );

	lea	rdx, OFFSET FLAT:modstate+24
	mov	QWORD PTR modstate+8, rax
	mov	ecx, 3
	lea	rax, OFFSET FLAT:ModuleInfo+320
	mov	BYTE PTR UseSavedState, 1
	mov	BYTE PTR modstate, 1
	npad	4
$LL3@SaveState:
	lea	rdx, QWORD PTR [rdx+128]
	movups	xmm0, XMMWORD PTR [rax]
	movups	xmm1, XMMWORD PTR [rax+16]
	lea	rax, QWORD PTR [rax+128]
	movups	XMMWORD PTR [rdx-128], xmm0
	movups	xmm0, XMMWORD PTR [rax-96]
	movups	XMMWORD PTR [rdx-112], xmm1
	movups	xmm1, XMMWORD PTR [rax-80]
	movups	XMMWORD PTR [rdx-96], xmm0
	movups	xmm0, XMMWORD PTR [rax-64]
	movups	XMMWORD PTR [rdx-80], xmm1
	movups	xmm1, XMMWORD PTR [rax-48]
	movups	XMMWORD PTR [rdx-64], xmm0
	movups	xmm0, XMMWORD PTR [rax-32]
	movups	XMMWORD PTR [rdx-48], xmm1
	movups	xmm1, XMMWORD PTR [rax-16]
	movups	XMMWORD PTR [rdx-32], xmm0
	movups	XMMWORD PTR [rdx-16], xmm1
	sub	rcx, 1
	jne	SHORT $LL3@SaveState
	movups	xmm0, XMMWORD PTR [rax]
	mov	rcx, QWORD PTR [rax+64]
	movups	xmm1, XMMWORD PTR [rax+16]
	movups	XMMWORD PTR [rdx], xmm0
	movups	xmm0, XMMWORD PTR [rax+32]
	movups	XMMWORD PTR [rdx+16], xmm1
	movups	xmm1, XMMWORD PTR [rax+48]
	movups	XMMWORD PTR [rdx+32], xmm0
	movups	XMMWORD PTR [rdx+48], xmm1
	mov	QWORD PTR [rdx+64], rcx

; 59   : 
; 60   :     SegmentSaveState();

	call	SegmentSaveState

; 61   :     AssumeSaveState();

	call	AssumeSaveState

; 63   : 
; 64   :     DebugMsg(( "SaveState exit\n" ));
; 65   : }

	add	rsp, 40					; 00000028H

; 62   :     ContextSaveState(); /* save pushcontext/popcontext stack */

	jmp	ContextSaveState
SaveState ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
_TEXT	SEGMENT
sym$ = 48
SaveVariableState PROC

; 141  : {

$LN7:
	push	rbx
	sub	rsp, 32					; 00000020H

; 142  :     struct equ_item *p;
; 143  : 
; 144  :     DebugMsg1(( "SaveVariableState(%s)=%d\n", sym->name, sym->value ));
; 145  :     sym->issaved = TRUE; /* don't try to save this symbol (anymore) */

	or	BYTE PTR [rcx+41], 16
	mov	rbx, rcx

; 146  :     p = LclAlloc( sizeof( struct equ_item ) );

	mov	ecx, 32					; 00000020H
	call	LclAlloc

; 147  :     p->next = NULL;

	mov	QWORD PTR [rax], 0

; 148  :     p->sym = sym;

	mov	QWORD PTR [rax+8], rbx

; 149  :     p->lvalue    = sym->value;

	mov	edx, DWORD PTR [rbx+16]
	mov	DWORD PTR [rax+16], edx

; 150  :     p->hvalue    = sym->value3264; /* v2.05: added */

	mov	edx, DWORD PTR [rbx+56]
	mov	DWORD PTR [rax+20], edx

; 151  :     p->mem_type  = sym->mem_type;  /* v2.07: added */

	mov	edx, DWORD PTR [rbx+36]
	mov	DWORD PTR [rax+24], edx

; 152  :     p->isdefined = sym->isdefined;

	movzx	ecx, BYTE PTR [rbx+40]
	shr	cl, 1
	and	cl, 1
	mov	BYTE PTR [rax+28], cl

; 153  :     if ( modstate.Equ.tail ) {

	mov	rcx, QWORD PTR modstate+16
	test	rcx, rcx
	je	SHORT $LN2@SaveVariab

; 154  :         modstate.Equ.tail->next = p;

	mov	QWORD PTR [rcx], rax

; 155  :         modstate.Equ.tail = p;
; 156  :     } else {
; 157  :         modstate.Equ.head = modstate.Equ.tail = p;

	mov	QWORD PTR modstate+16, rax

; 158  :     }
; 159  : //    printf("state of symbol >%s< saved, value=%u, defined=%u\n", sym->name, sym->value, sym->defined);
; 160  : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
$LN2@SaveVariab:

; 155  :         modstate.Equ.tail = p;
; 156  :     } else {
; 157  :         modstate.Equ.head = modstate.Equ.tail = p;

	mov	QWORD PTR modstate+8, rax
	mov	QWORD PTR modstate+16, rax

; 158  :     }
; 159  : //    printf("state of symbol >%s< saved, value=%u, defined=%u\n", sym->name, sym->value, sym->defined);
; 160  : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
SaveVariableState ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
_TEXT	SEGMENT
RestoreState PROC

; 164  : {

$LN14:
	sub	rsp, 40					; 00000028H

; 165  :     DebugMsg1(("RestoreState enter\n"));
; 166  :     if ( modstate.init ) {

	cmp	BYTE PTR modstate, 0
	je	$LN12@RestoreSta

; 167  :         struct equ_item *curr;
; 168  :         /* restore values of assembly time variables */
; 169  :         for ( curr = modstate.Equ.head; curr; curr = curr->next ) {

	mov	rdx, QWORD PTR modstate+8
	test	rdx, rdx
	je	SHORT $LN3@RestoreSta
	npad	3
$LL4@RestoreSta:

; 170  :             DebugMsg1(("RestoreState: sym >%s<, value=%Xh (hvalue=%Xh), defined=%u\n", curr->sym->name, curr->lvalue, curr->hvalue, curr->isdefined ));
; 171  :             /* v2.07: MT_ABS is obsolete */
; 172  :             //if ( curr->sym->mem_type == MT_ABS ) {
; 173  :                 curr->sym->value     = curr->lvalue;

	mov	rcx, QWORD PTR [rdx+8]
	mov	eax, DWORD PTR [rdx+16]
	mov	DWORD PTR [rcx+16], eax

; 174  :                 curr->sym->value3264 = curr->hvalue;

	mov	rcx, QWORD PTR [rdx+8]
	mov	eax, DWORD PTR [rdx+20]
	mov	DWORD PTR [rcx+56], eax

; 175  :                 curr->sym->mem_type  = curr->mem_type; /* v2.07: added */

	mov	rcx, QWORD PTR [rdx+8]
	mov	eax, DWORD PTR [rdx+24]
	mov	DWORD PTR [rcx+36], eax

; 176  :                 curr->sym->isdefined = curr->isdefined;

	mov	rcx, QWORD PTR [rdx+8]
	movzx	eax, BYTE PTR [rdx+28]
	add	al, al
	xor	al, BYTE PTR [rcx+40]
	and	al, 2
	xor	BYTE PTR [rcx+40], al
	mov	rdx, QWORD PTR [rdx]
	test	rdx, rdx
	jne	SHORT $LL4@RestoreSta
$LN3@RestoreSta:

; 177  :             //}
; 178  :         }
; 179  :         /* fields in module_vars are not to be restored.
; 180  :          * v2.10: the module_vars fields are not saved either.
; 181  :          */
; 182  :         //memcpy( &modstate.modinfo.g, &ModuleInfo.g, sizeof( ModuleInfo.g ) );
; 183  :         memcpy( (char *)&ModuleInfo + sizeof( struct module_vars ), &modstate.modinfo, sizeof( modstate.modinfo ) );

	lea	rdx, OFFSET FLAT:ModuleInfo+320
	mov	ecx, 3
	lea	rax, OFFSET FLAT:modstate+24
	npad	5
$LL11@RestoreSta:
	lea	rdx, QWORD PTR [rdx+128]
	movups	xmm0, XMMWORD PTR [rax]
	movups	xmm1, XMMWORD PTR [rax+16]
	lea	rax, QWORD PTR [rax+128]
	movups	XMMWORD PTR [rdx-128], xmm0
	movups	xmm0, XMMWORD PTR [rax-96]
	movups	XMMWORD PTR [rdx-112], xmm1
	movups	xmm1, XMMWORD PTR [rax-80]
	movups	XMMWORD PTR [rdx-96], xmm0
	movups	xmm0, XMMWORD PTR [rax-64]
	movups	XMMWORD PTR [rdx-80], xmm1
	movups	xmm1, XMMWORD PTR [rax-48]
	movups	XMMWORD PTR [rdx-64], xmm0
	movups	xmm0, XMMWORD PTR [rax-32]
	movups	XMMWORD PTR [rdx-48], xmm1
	movups	xmm1, XMMWORD PTR [rax-16]
	movups	XMMWORD PTR [rdx-32], xmm0
	movups	XMMWORD PTR [rdx-16], xmm1
	sub	rcx, 1
	jne	SHORT $LL11@RestoreSta
	movups	xmm0, XMMWORD PTR [rax]
	mov	rcx, QWORD PTR [rax+64]
	movups	xmm1, XMMWORD PTR [rax+16]
	movups	XMMWORD PTR [rdx], xmm0
	movups	xmm0, XMMWORD PTR [rax+32]
	movups	XMMWORD PTR [rdx+16], xmm1
	movups	xmm1, XMMWORD PTR [rax+48]
	movups	XMMWORD PTR [rdx+32], xmm0
	movups	XMMWORD PTR [rdx+48], xmm1
	mov	QWORD PTR [rdx+64], rcx

; 184  :         SetOfssize();

	call	SetOfssize

; 185  :         SymSetCmpFunc();

	call	SymSetCmpFunc
$LN12@RestoreSta:

; 186  :     }
; 187  : 
; 188  : #if 0
; 189  :     /* v2.05: AFAICS this can't happen anymore. */
; 190  :     if ( LineStore.head == NULL ) {
; 191  :         struct line_item *endl = LclAlloc( sizeof( struct line_item ) + 3 );
; 192  :         endl->next = NULL;
; 193  :         endl->srcfile = 0;
; 194  :         endl->lineno = GetLineNumber();
; 195  :         endl->list_pos = 0;
; 196  :         strcpy( endl->line, "END");
; 197  :         LineStore.head = endl;
; 198  :         DebugMsg(("RestoreState: LineStore.head was NULL !!!\n" ));
; 199  :     }
; 200  : #endif
; 201  :     return( LineStore.head );

	mov	rax, QWORD PTR LineStore

; 202  : }

	add	rsp, 40					; 00000028H
	ret	0
RestoreState ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
_TEXT	SEGMENT
SkipSavedState PROC

; 124  :     DebugMsg(("SkipSavedState enter\n"));
; 125  :     UseSavedState = FALSE;

	mov	BYTE PTR UseSavedState, 0

; 126  : }

	ret	0
SkipSavedState ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
_TEXT	SEGMENT
srcline$ = 48
flags$ = 56
lst_position$ = 64
StoreLine PROC

; 69   : {

$LN31:
	mov	QWORD PTR [rsp+24], rbp
	mov	QWORD PTR [rsp+32], rsi
	push	r14
	sub	rsp, 32					; 00000020H

; 70   :     int i,j;
; 71   :     char *p;
; 72   : 
; 73   : #ifdef DEBUG_OUT
; 74   :     if ( Options.nofastpass )
; 75   :         return;
; 76   : #endif
; 77   :     if ( ModuleInfo.GeneratedCode ) /* don't store generated lines! */

	cmp	DWORD PTR ModuleInfo+456, 0
	mov	ebp, r8d
	mov	r14d, edx
	mov	rsi, rcx
	jne	$LN1@StoreLine

; 78   :         return;
; 79   :     if ( StoreState == FALSE ) /* line store already started? */

	cmp	BYTE PTR StoreState, 0
	mov	QWORD PTR [rsp+48], rbx
	mov	QWORD PTR [rsp+56], rdi
	jne	SHORT $LN6@StoreLine

; 80   :         SaveState();

	call	SaveState
$LN6@StoreLine:

; 81   : 
; 82   :     i = strlen( srcline );

	or	rdi, -1
	mov	rbx, rdi
$LL25@StoreLine:
	inc	rbx
	cmp	BYTE PTR [rsi+rbx], 0
	jne	SHORT $LL25@StoreLine

; 83   :     j = ( ( ( flags & 1 ) && ModuleInfo.CurrComment ) ? strlen( ModuleInfo.CurrComment ) : 0 );

	test	r14b, 1
	je	SHORT $LN17@StoreLine
	mov	rax, QWORD PTR ModuleInfo+472
	test	rax, rax
	je	SHORT $LN17@StoreLine
$LL24@StoreLine:
	inc	rdi
	cmp	BYTE PTR [rax+rdi], 0
	jne	SHORT $LL24@StoreLine
	jmp	SHORT $LN18@StoreLine
$LN17@StoreLine:
	xor	edi, edi
$LN18@StoreLine:

; 84   :     LineStoreCurr = LclAlloc( i + j + sizeof( struct line_item ) );

	lea	eax, DWORD PTR [rdi+rbx]
	movsxd	rcx, eax
	add	rcx, 24
	call	LclAlloc
	mov	QWORD PTR LineStoreCurr, rax

; 85   :     LineStoreCurr->next = NULL;

	mov	QWORD PTR [rax], 0

; 86   :     LineStoreCurr->lineno = GetLineNumber();

	call	GetLineNumber
	mov	rdx, QWORD PTR LineStoreCurr
	mov	ecx, DWORD PTR [rdx+8]
	xor	ecx, eax
	and	ecx, 1048575				; 000fffffH
	xor	DWORD PTR [rdx+8], ecx

; 87   :     if ( MacroLevel ) {

	cmp	BYTE PTR MacroLevel, 0
	je	SHORT $LN7@StoreLine

; 88   :         LineStoreCurr->srcfile = 0xfff;

	mov	rax, QWORD PTR LineStoreCurr
	or	DWORD PTR [rax+8], -1048576		; fff00000H

; 89   :     } else {

	jmp	SHORT $LN8@StoreLine
$LN7@StoreLine:

; 90   :         LineStoreCurr->srcfile = get_curr_srcfile();

	call	get_curr_srcfile
	mov	rdx, QWORD PTR LineStoreCurr
	shl	eax, 20
	mov	ecx, DWORD PTR [rdx+8]
	and	ecx, 1048575				; 000fffffH
	or	ecx, eax
	mov	DWORD PTR [rdx+8], ecx
$LN8@StoreLine:

; 91   :     }
; 92   :     LineStoreCurr->list_pos = ( lst_position ? lst_position : list_pos );

	mov	ecx, DWORD PTR list_pos
	test	ebp, ebp
	mov	rax, QWORD PTR LineStoreCurr

; 93   :     if ( j ) {
; 94   :         memcpy( LineStoreCurr->line, srcline, i );

	mov	rdx, rsi
	cmovne	ecx, ebp
	mov	DWORD PTR [rax+12], ecx
	mov	rcx, QWORD PTR LineStoreCurr
	add	rcx, 16
	test	edi, edi
	je	SHORT $LN9@StoreLine
	movsxd	rbx, ebx
	mov	r8, rbx
	call	memcpy

; 95   :         memcpy( LineStoreCurr->line + i, ModuleInfo.CurrComment, j + 1 );

	mov	rcx, QWORD PTR LineStoreCurr
	lea	eax, DWORD PTR [rdi+1]
	mov	rdx, QWORD PTR ModuleInfo+472
	add	rcx, 16
	add	rcx, rbx

; 96   :     } else

	jmp	SHORT $LN29@StoreLine
$LN9@StoreLine:

; 97   :         memcpy( LineStoreCurr->line, srcline, i + 1 );

	lea	eax, DWORD PTR [rbx+1]
$LN29@StoreLine:
	movsxd	r8, eax
	call	memcpy

; 98   : 
; 99   :     DebugMsg1(("StoreLine(>%s<, lst_position=%u): cur=%X\n", LineStoreCurr->line, lst_position, LineStoreCurr ));
; 100  : 
; 101  :     /* v2.08: don't store % operator at pos 0 */
; 102  :     for ( p = LineStoreCurr->line; *p && isspace(*p); p++ );

	mov	rbx, QWORD PTR LineStoreCurr
	mov	rdi, QWORD PTR [rsp+56]
	add	rbx, 16
	cmp	BYTE PTR [rbx], 0
	je	SHORT $LN28@StoreLine
$LL4@StoreLine:
	movsx	ecx, BYTE PTR [rbx]
	call	isspace
	test	eax, eax
	je	SHORT $LN28@StoreLine
	inc	rbx
	cmp	BYTE PTR [rbx], 0
	jne	SHORT $LL4@StoreLine
$LN28@StoreLine:

; 103  :     if (*p == '%' && ( _memicmp( p+1, "OUT", 3 ) || is_valid_id_char( *(p+4) ) ) )

	cmp	BYTE PTR [rbx], 37			; 00000025H
	jne	SHORT $LN11@StoreLine
	lea	rcx, QWORD PTR [rbx+1]
	mov	r8d, 3
	lea	rdx, OFFSET FLAT:$SG10812
	call	_memicmp
	test	eax, eax
	jne	SHORT $LN13@StoreLine
	movsx	ecx, BYTE PTR [rbx+4]
	call	isalnum
	test	eax, eax
	jne	SHORT $LN13@StoreLine
	movzx	eax, BYTE PTR [rbx+4]
	sub	al, 36					; 00000024H
	cmp	al, 59					; 0000003bH
	ja	SHORT $LN11@StoreLine
	mov	rcx, 576460752706076673			; 0800000018000001H
	bt	rcx, rax
	jae	SHORT $LN11@StoreLine
$LN13@StoreLine:

; 104  :         *p = ' ';

	mov	BYTE PTR [rbx], 32			; 00000020H
$LN11@StoreLine:

; 105  : 
; 106  : #ifdef DEBUG_OUT
; 107  :     if ( Options.print_linestore )
; 108  :         printf("%s\n", LineStoreCurr->line );
; 109  : #endif
; 110  :     if ( LineStore.head )

	cmp	QWORD PTR LineStore, 0
	mov	rbx, QWORD PTR [rsp+48]
	je	SHORT $LN14@StoreLine

; 111  :         LineStore.tail->next = LineStoreCurr;

	mov	rax, QWORD PTR LineStore+8
	mov	rcx, QWORD PTR LineStoreCurr
	mov	QWORD PTR [rax], rcx
	jmp	SHORT $LN15@StoreLine
$LN14@StoreLine:

; 112  :     else
; 113  :         LineStore.head = LineStoreCurr;

	mov	rax, QWORD PTR LineStoreCurr
	mov	QWORD PTR LineStore, rax
$LN15@StoreLine:

; 114  :     LineStore.tail = LineStoreCurr;

	mov	rax, QWORD PTR LineStoreCurr
	mov	QWORD PTR LineStore+8, rax
$LN1@StoreLine:

; 115  : }

	mov	rbp, QWORD PTR [rsp+64]
	mov	rsi, QWORD PTR [rsp+72]
	add	rsp, 32					; 00000020H
	pop	r14
	ret	0
StoreLine ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\fastpass.c
_TEXT	SEGMENT
FastpassInit PROC

; 223  : {

	xorps	xmm0, xmm0

; 224  :     StoreState = FALSE;

	mov	BYTE PTR StoreState, 0
	movdqu	XMMWORD PTR LineStore, xmm0

; 225  :     modstate.init = FALSE;

	mov	BYTE PTR modstate, 0

; 226  :     LineStore.head = NULL;
; 227  :     LineStore.tail = NULL;
; 228  :     UseSavedState = FALSE;

	mov	BYTE PTR UseSavedState, 0

; 229  : }

	ret	0
FastpassInit ENDP
_TEXT	ENDS
END
