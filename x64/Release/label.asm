; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.23026.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	decoflags:BYTE
COMM	broadflags:BYTE
COMM	evex:BYTE
COMM	ZEROLOCALS:BYTE
_DATA	ENDS
_DATA	SEGMENT
$SG10660 DB	'L&_%04u', 00H
$SG10689 DB	'L&_%04u', 00H
_DATA	ENDS
PUBLIC	__local_stdio_printf_options
PUBLIC	sprintf
PUBLIC	LabelInit
PUBLIC	GetAnonymousLabel
PUBLIC	CreateLabel
PUBLIC	LabelDirective
EXTRN	__stdio_common_vsprintf:PROC
EXTRN	EmitError:PROC
EXTRN	EmitErr:PROC
EXTRN	SymLookup:PROC
EXTRN	SymLookupLocal:PROC
EXTRN	sym_remove_table:PROC
EXTRN	sym_ext2int:PROC
EXTRN	BackPatch:PROC
EXTRN	SetSymSegOfs:PROC
EXTRN	CreateProc:PROC
EXTRN	CopyPrototype:PROC
EXTRN	GetQualifiedType:PROC
EXTRN	LstWrite:PROC
EXTRN	EvalOperand:PROC
EXTRN	Options:BYTE
EXTRN	ModuleInfo:BYTE
EXTRN	Parse_Pass:DWORD
EXTRN	SymTables:BYTE
EXTRN	CurrProc:QWORD
EXTRN	SegAssumeTable:BYTE
_DATA	SEGMENT
COMM	?_OptionsStorage@?1??__local_stdio_printf_options@@9@9:QWORD							; `__local_stdio_printf_options'::`2'::_OptionsStorage
_DATA	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$_vsnprintf_l DD imagerel $LN4
	DD	imagerel $LN4+102
	DD	imagerel $unwind$_vsnprintf_l
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$_vsprintf_l DD imagerel $LN6
	DD	imagerel $LN6+98
	DD	imagerel $unwind$_vsprintf_l
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$sprintf DD imagerel $LN8
	DD	imagerel $LN8+90
	DD	imagerel $unwind$sprintf
pdata	ENDS
pdata	SEGMENT
$pdata$GetAnonymousLabel DD imagerel $LN4
	DD	imagerel $LN4+40
	DD	imagerel $unwind$GetAnonymousLabel
$pdata$CreateLabel DD imagerel $LN34
	DD	imagerel $LN34+644
	DD	imagerel $unwind$CreateLabel
$pdata$LabelDirective DD imagerel $LN24
	DD	imagerel $LN24+524
	DD	imagerel $unwind$LabelDirective
pdata	ENDS
xdata	SEGMENT
$unwind$GetAnonymousLabel DD 020601H
	DD	030023206H
$unwind$CreateLabel DD 0aad01H
	DD	0c34adH
	DD	0df473H
	DD	0e540dH
	DD	0e009720dH
	DD	060067007H
$unwind$LabelDirective DD 07a101H
	DD	01b34a1H
	DD	01c7416H
	DD	0180116H
	DD	0500aH
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$sprintf DD 041601H
	DD	070125216H
	DD	030106011H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$_vsprintf_l DD 081401H
	DD	0a6414H
	DD	095414H
	DD	083414H
	DD	070105214H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$_vsnprintf_l DD 081401H
	DD	0a6414H
	DD	095414H
	DD	083414H
	DD	070105214H
xdata	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\label.c
_TEXT	SEGMENT
ti$ = 48
opnd$1 = 80
i$ = 208
tokenarray$ = 216
LabelDirective PROC

; 208  : {

$LN24:
	mov	QWORD PTR [rsp+24], rdi
	mov	DWORD PTR [rsp+8], ecx
	push	rbp
	lea	rbp, QWORD PTR [rsp-87]
	sub	rsp, 192				; 000000c0H
	mov	rdi, rdx

; 209  :     struct qualified_type ti;
; 210  :     struct asym *sym;
; 211  : #if LABELARRAY
; 212  :     uint_32 length;
; 213  : #endif
; 214  : 
; 215  :     if( i != 1 ) {  /* LABEL must be preceded by an ID */

	cmp	ecx, 1
	je	SHORT $LN2@LabelDirec

; 216  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].string_ptr ) );

	movsxd	rdx, ecx
	mov	ecx, 209				; 000000d1H
	shl	rdx, 5
	mov	rdx, QWORD PTR [rdx+rdi+8]
	call	EmitErr

; 291  : }

	mov	rdi, QWORD PTR [rsp+224]
	add	rsp, 192				; 000000c0H
	pop	rbp
	ret	0
$LN2@LabelDirec:

; 217  :     }
; 218  : 
; 219  :     i++;
; 220  : 
; 221  :     ti.size = 0;

	xor	eax, eax
	mov	DWORD PTR i$[rbp-105], 2
	mov	DWORD PTR ti$[rbp-105], eax

; 222  :     ti.is_ptr = 0;
; 223  :     ti.is_far = FALSE;
; 224  :     ti.mem_type = MT_EMPTY;
; 225  :     ti.ptr_memtype = MT_EMPTY;
; 226  :     ti.symtype = NULL;
; 227  :     ti.Ofssize = ModuleInfo.Ofssize;
; 228  :     if ( GetQualifiedType( &i, tokenarray, &ti ) == ERROR )

	lea	r8, QWORD PTR ti$[rbp-105]
	mov	WORD PTR ti$[rbp-85], ax
	lea	rcx, QWORD PTR i$[rbp-105]
	mov	QWORD PTR ti$[rbp-97], rax
	movzx	eax, BYTE PTR ModuleInfo+404
	mov	BYTE PTR ti$[rbp-83], al
	mov	DWORD PTR ti$[rbp-89], 192		; 000000c0H
	mov	DWORD PTR ti$[rbp-81], 192		; 000000c0H
	call	GetQualifiedType
	cmp	eax, -1
	jne	SHORT $LN3@LabelDirec

; 229  :         return( ERROR );

	or	eax, eax

; 291  : }

	mov	rdi, QWORD PTR [rsp+224]
	add	rsp, 192				; 000000c0H
	pop	rbp
	ret	0
$LN3@LabelDirec:

; 230  : 
; 231  :     DebugMsg1(("LabelDirective(%s): memtype=%Xh, far=%u, ptr=%u, ofssize=%u, type=%s)\n",
; 232  :                tokenarray[0].string_ptr, ti.mem_type, ti.is_far, ti.is_ptr, ti.Ofssize, ti.symtype ? ti.symtype->name : "NULL" ));
; 233  : 
; 234  : #if LABELARRAY
; 235  :     length = -1;
; 236  : #endif
; 237  :     /* v2.10: first if()-block is to handle all address types ( MT_NEAR, MT_FAR and MT_PROC ) */
; 238  :     //if ( ti.mem_type == MT_NEAR || ti.mem_type == MT_FAR ) {
; 239  :     if ( ( ti.mem_type & MT_SPECIAL_MASK) == MT_ADDRESS ) {

	mov	eax, DWORD PTR ti$[rbp-89]
	mov	QWORD PTR [rsp+216], rbx
	and	eax, 192				; 000000c0H
	or	ebx, -1					; ffffffffH
	cmp	al, -128				; ffffffffffffff80H
	jne	SHORT $LN4@LabelDirec

; 240  :         /* dont allow near16/far16/near32/far32 if size won't match */
; 241  :         if ( ti.Ofssize != USE_EMPTY && ModuleInfo.Ofssize != ti.Ofssize ) {

	movzx	eax, BYTE PTR ti$[rbp-83]
	cmp	al, 254					; 000000feH
	je	$LN11@LabelDirec
	cmp	BYTE PTR ModuleInfo+404, al
	je	$LN11@LabelDirec

; 242  :             return( EmitError( OFFSET_SIZE_MISMATCH ) );

	mov	ecx, 237				; 000000edH
	call	EmitError
	jmp	$LN21@LabelDirec
$LN4@LabelDirec:

; 243  :         }
; 244  :     }
; 245  : #if LABELARRAY
; 246  :     else if ( tokenarray[i].token == T_COLON && tokenarray[i+1].token != T_FINAL && Options.strict_masm_compat == FALSE ) {

	movsxd	rcx, DWORD PTR i$[rbp-105]
	mov	rax, rcx
	shl	rax, 5
	cmp	BYTE PTR [rax+rdi], 58			; 0000003aH
	jne	SHORT $LN7@LabelDirec
	lea	rax, QWORD PTR [rcx+1]
	shl	rax, 5
	cmp	BYTE PTR [rax+rdi], 0
	je	SHORT $LN7@LabelDirec
	cmp	BYTE PTR Options+127, 0
	jne	SHORT $LN7@LabelDirec

; 247  :         struct expr opnd;
; 248  :         i++;
; 249  :         if ( EvalOperand( &i, tokenarray, Token_Count, &opnd, 0 ) == ERROR )

	mov	r8d, DWORD PTR ModuleInfo+496
	lea	r9, QWORD PTR opnd$1[rbp-105]
	inc	ecx
	mov	BYTE PTR [rsp+32], 0
	mov	DWORD PTR i$[rbp-105], ecx
	mov	rdx, rdi
	lea	rcx, QWORD PTR i$[rbp-105]
	call	EvalOperand
	cmp	eax, -1
	je	$LN14@LabelDirec

; 250  :             return( ERROR );
; 251  :         if ( opnd.kind != EXPR_CONST ) {

	cmp	DWORD PTR opnd$1[rbp-45], 0
	je	SHORT $LN19@LabelDirec

; 252  :             if ( opnd.sym && opnd.sym->state == SYM_UNDEFINED )

	mov	rax, QWORD PTR opnd$1[rbp-25]
	test	rax, rax
	je	SHORT $LN10@LabelDirec
	cmp	DWORD PTR [rax+32], 0
	jne	SHORT $LN10@LabelDirec

; 253  :                 opnd.value = 1;

	mov	ebx, 1
	jmp	SHORT $LN11@LabelDirec
$LN10@LabelDirec:

; 254  :             else {
; 255  :                 return( EmitError( CONSTANT_EXPECTED ) );

	mov	ecx, 65					; 00000041H
	call	EmitError
	jmp	$LN21@LabelDirec
$LN19@LabelDirec:
	mov	ebx, DWORD PTR opnd$1[rbp-105]
$LN11@LabelDirec:

; 256  :             }
; 257  :         }
; 258  :         length = opnd.value;

	mov	ecx, DWORD PTR i$[rbp-105]
$LN7@LabelDirec:

; 259  :     }
; 260  : #endif
; 261  : 
; 262  :     if ( tokenarray[i].token != T_FINAL ) {

	movsxd	rdx, ecx
	shl	rdx, 5
	cmp	BYTE PTR [rdx+rdi], 0
	je	SHORT $LN12@LabelDirec

; 263  :         return( EmitErr( SYNTAX_ERROR_EX, tokenarray[i].tokpos ) ); /* v2.10: display tokpos */

	mov	rdx, QWORD PTR [rdx+rdi+24]
	mov	ecx, 209				; 000000d1H
	call	EmitErr
	jmp	SHORT $LN21@LabelDirec
$LN12@LabelDirec:

; 264  :     }
; 265  : 
; 266  :     if ( ModuleInfo.list )

	test	DWORD PTR ModuleInfo+408, 2048		; 00000800H
	je	SHORT $LN13@LabelDirec

; 267  :         LstWrite( LSTTYPE_LABEL, 0, NULL );

	xor	edx, edx
	xor	r8d, r8d
	lea	ecx, QWORD PTR [rdx+7]
	call	LstWrite
$LN13@LabelDirec:

; 268  : 
; 269  :     /* v2.08: if label is a DATA label, set total_size and total_length */
; 270  :     if ( sym = CreateLabel( tokenarray[0].string_ptr, ti.mem_type, &ti, FALSE ) ) {

	mov	edx, DWORD PTR ti$[rbp-89]
	lea	r8, QWORD PTR ti$[rbp-105]
	mov	rcx, QWORD PTR [rdi+8]
	xor	r9d, r9d
	call	CreateLabel
	mov	rdx, rax
	test	rax, rax
	je	SHORT $LN14@LabelDirec

; 271  :         DebugMsg1(("LabelDirective(%s): label created, memtype=%Xh size=%u\n", sym->name, sym->mem_type, ti.size ));
; 272  :         /* sym->isdata must be 0, else the LABEL directive was generated within data_item()
; 273  :          * and fields total_size & total_length must not be modified then!
; 274  :          * v2.09: data_item() no longer creates LABEL directives.
; 275  :          */
; 276  :         if ( sym->isdata == FALSE && ( sym->mem_type & MT_SPECIAL_MASK ) != MT_ADDRESS )

	movzx	r8d, BYTE PTR [rax+41]
	test	r8b, 4
	jne	SHORT $LN17@LabelDirec
	mov	ecx, DWORD PTR [rax+36]
	and	ecx, 192				; 000000c0H
	cmp	cl, -128				; ffffffffffffff80H
	je	SHORT $LN17@LabelDirec

; 277  : #if LABELARRAY
; 278  :             if ( length != -1 ) {

	cmp	ebx, -1					; ffffffffH
	je	SHORT $LN16@LabelDirec

; 279  :                 sym->total_size = ti.size * length;
; 280  :                 sym->total_length = length;
; 281  :                 sym->isarray = TRUE;

	or	r8b, 2
	mov	eax, ebx
	imul	eax, DWORD PTR ti$[rbp-105]
	mov	DWORD PTR [rdx+64], ebx
	mov	BYTE PTR [rdx+41], r8b

; 282  :             } else
; 283  : #endif
; 284  :             {
; 285  :                 sym->total_size = ti.size;

	mov	DWORD PTR [rdx+56], eax

; 287  :             }
; 288  :         return( NOT_ERROR );

	xor	eax, eax
	jmp	SHORT $LN21@LabelDirec
$LN16@LabelDirec:

; 282  :             } else
; 283  : #endif
; 284  :             {
; 285  :                 sym->total_size = ti.size;

	mov	eax, DWORD PTR ti$[rbp-105]

; 286  :                 sym->total_length = 1;

	mov	DWORD PTR [rdx+64], 1
	mov	DWORD PTR [rdx+56], eax
$LN17@LabelDirec:

; 287  :             }
; 288  :         return( NOT_ERROR );

	xor	eax, eax
	jmp	SHORT $LN21@LabelDirec
$LN14@LabelDirec:

; 289  :     }
; 290  :     return( ERROR );

	or	eax, -1
$LN21@LabelDirec:
	mov	rbx, QWORD PTR [rsp+216]

; 291  : }

	mov	rdi, QWORD PTR [rsp+224]
	add	rsp, 192				; 000000c0H
	pop	rbp
	ret	0
LabelDirective ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\label.c
_TEXT	SEGMENT
addr$ = 32
buffer$ = 40
name$ = 96
mem_type$ = 104
ti$ = 112
bLocal$ = 120
CreateLabel PROC

; 77   : {

$LN34:
	mov	QWORD PTR [rsp+24], rbp
	push	rsi
	push	rdi
	push	r14
	sub	rsp, 64					; 00000040H

; 78   :     struct asym         *sym;
; 79   :     uint_32             addr;
; 80   :     char                buffer[20];
; 81   : 
; 82   :     DebugMsg1(("CreateLabel(%s, memtype=%Xh, %" I32_SPEC "Xh, %u) enter\n", name, mem_type, ti, bLocal));
; 83   : 
; 84   :     if( CurrSeg == NULL ) {

	cmp	QWORD PTR ModuleInfo+432, 0
	movzx	r14d, r9b
	mov	rbp, r8
	mov	esi, edx
	mov	rdi, rcx
	jne	SHORT $LN2@CreateLabe

; 85   :         EmitError( MUST_BE_IN_SEGMENT_BLOCK );

	mov	ecx, 82					; 00000052H
	call	EmitError

; 86   :         return( NULL );

	xor	eax, eax

; 200  : }

	mov	rbp, QWORD PTR [rsp+112]
	add	rsp, 64					; 00000040H
	pop	r14
	pop	rdi
	pop	rsi
	ret	0
$LN2@CreateLabe:

; 87   :     }
; 88   :     /* v2.06: don't allow a code label (NEAR, FAR, PROC) if CS is
; 89   :      * assumed ERROR. This was previously checked for labels with
; 90   :      * trailing colon only [in ParseLine()].
; 91   :      */
; 92   :     if ( ( mem_type & MT_SPECIAL_MASK) == MT_ADDRESS ) {

	mov	eax, edx
	and	eax, 192				; 000000c0H
	cmp	al, -128				; ffffffffffffff80H
	jne	SHORT $LN4@CreateLabe

; 93   :         if ( SegAssumeTable[ASSUME_CS].error ) { /* CS assumed to ERROR? */

	cmp	BYTE PTR SegAssumeTable+24, 0
	je	SHORT $LN4@CreateLabe

; 94   :             DebugMsg(("CreateLabel: code label and CS assumed error\n" ));
; 95   :             EmitError( USE_OF_REGISTER_ASSUMED_TO_ERROR );

	mov	ecx, 183				; 000000b7H
	call	EmitError

; 96   :             return( NULL );

	xor	eax, eax

; 200  : }

	mov	rbp, QWORD PTR [rsp+112]
	add	rsp, 64					; 00000040H
	pop	r14
	pop	rdi
	pop	rsi
	ret	0
$LN4@CreateLabe:

; 97   :         }
; 98   :     }
; 99   : 
; 100  :     //if( strcmp( name, "@@" ) == 0 ) {
; 101  :     if( name[0] == '@' && name[1] == '@' && name[2] == NULLC ) {

	cmp	BYTE PTR [rcx], 64			; 00000040H
	mov	QWORD PTR [rsp+104], r15
	jne	SHORT $LN5@CreateLabe
	cmp	BYTE PTR [rcx+1], 64			; 00000040H
	jne	SHORT $LN5@CreateLabe
	cmp	BYTE PTR [rcx+2], 0
	jne	SHORT $LN5@CreateLabe

; 102  :         sprintf( buffer, "L&_%04u", ++ModuleInfo.g.anonymous_label );

	mov	r8d, DWORD PTR ModuleInfo+268
	lea	rdx, OFFSET FLAT:$SG10689
	inc	r8d
	lea	rcx, QWORD PTR buffer$[rsp]
	mov	DWORD PTR ModuleInfo+268, r8d
	call	sprintf

; 103  :         name = buffer;

	lea	rdi, QWORD PTR buffer$[rsp]
$LN5@CreateLabe:

; 104  :     }
; 105  : 
; 106  :     sym = ( bLocal ? SymLookupLocal( name ) : SymLookup( name ) );

	mov	QWORD PTR [rsp+96], rbx
	mov	rcx, rdi
	test	r14b, r14b
	je	SHORT $LN26@CreateLabe
	call	SymLookupLocal
	jmp	SHORT $LN31@CreateLabe
$LN26@CreateLabe:
	call	SymLookup
$LN31@CreateLabe:

; 107  :     /* v2.11: SymLookup...() cannot fail */
; 108  :     //if( sym == NULL ) /* name invalid or too long? */
; 109  :     //    return( NULL );
; 110  : 
; 111  :     if( Parse_Pass == PASS_1 ) {

	cmp	DWORD PTR Parse_Pass, 0
	mov	rbx, rax
	mov	r15d, 1
	jne	$LN6@CreateLabe

; 112  :         if( sym->state == SYM_EXTERNAL && sym->weak == TRUE ) {

	mov	eax, DWORD PTR [rax+32]
	cmp	eax, 2
	jne	SHORT $LN8@CreateLabe
	test	BYTE PTR [rbx+47], 8
	je	SHORT $LN8@CreateLabe

; 113  :             /* don't accept EXTERNDEF for a local label! */
; 114  :             /* v2.04: also never accept PROTOs for extern to intern conversion */
; 115  :             //if ( bLocal && CurrProc ) {
; 116  :             if ( sym->isproc || ( bLocal && CurrProc ) ) {

	test	BYTE PTR [rbx+41], 8
	jne	SHORT $LN11@CreateLabe
	test	r14b, r14b
	je	SHORT $LN10@CreateLabe
	cmp	QWORD PTR CurrProc, 0
	jne	SHORT $LN11@CreateLabe
$LN10@CreateLabe:

; 120  :             }
; 121  :             /* ensure that type of symbol is compatible! */
; 122  :             if ( sym->mem_type != MT_EMPTY &&

	mov	eax, DWORD PTR [rbx+36]
	cmp	eax, 192				; 000000c0H
	je	SHORT $LN12@CreateLabe
	cmp	eax, esi
	je	SHORT $LN12@CreateLabe

; 123  :                  sym->mem_type != mem_type ) {
; 124  :                 DebugMsg(("CreateLabel(%s): error, memtype conflict %X-%X\n", sym->name, sym->mem_type, mem_type));
; 125  :                 EmitErr( SYMBOL_TYPE_CONFLICT, name );

	mov	rdx, rdi
	mov	ecx, 136				; 00000088H
	call	EmitErr
$LN12@CreateLabe:

; 126  :             }
; 127  :             sym_ext2int( sym );

	mov	rcx, rbx
	call	sym_ext2int
	jmp	SHORT $LN14@CreateLabe
$LN11@CreateLabe:

; 117  :                 DebugMsg(("CreateLabel(%s): error, EXTERNDEF for local label\n", sym->name));
; 118  :                 EmitErr( SYMBOL_REDEFINITION, name );

	mov	rdx, rdi
	mov	ecx, 143				; 0000008fH
	call	EmitErr

; 119  :                 return( NULL );

	xor	eax, eax
	jmp	$LN30@CreateLabe
$LN8@CreateLabe:

; 128  :         } else if( sym->state == SYM_UNDEFINED ) {

	test	eax, eax
	jne	$LN13@CreateLabe

; 129  :             sym_remove_table( &SymTables[TAB_UNDEF], (struct dsym *)sym );

	mov	rdx, rbx
	lea	rcx, OFFSET FLAT:SymTables
	call	sym_remove_table

; 130  :             sym->state = SYM_INTERNAL;

	mov	DWORD PTR [rbx+32], r15d
$LN14@CreateLabe:

; 141  :         }
; 142  :         /* add the label to the linked list attached to curr segment */
; 143  :         /* this allows to reduce the number of passes (see fixup.c) */
; 144  :         ((struct dsym *)sym)->next = (struct dsym *)CurrSeg->e.seginfo->label_list;

	mov	rax, QWORD PTR ModuleInfo+432
	mov	rcx, QWORD PTR [rax+96]
	mov	rax, QWORD PTR [rcx+32]
	mov	QWORD PTR [rbx+104], rax

; 145  :         CurrSeg->e.seginfo->label_list = sym;

	mov	rax, QWORD PTR ModuleInfo+432
	mov	rcx, QWORD PTR [rax+96]
	mov	QWORD PTR [rcx+32], rbx

; 146  : 
; 147  :         /* a possible language type set by EXTERNDEF must be kept! */
; 148  :         if ( sym->langtype == LANG_NONE )

	cmp	DWORD PTR [rbx+76], 0
	jne	SHORT $LN17@CreateLabe

; 149  :             sym->langtype = ModuleInfo.langtype;

	mov	eax, DWORD PTR ModuleInfo+364
	mov	DWORD PTR [rbx+76], eax
$LN17@CreateLabe:

; 150  : 
; 151  :         /* v2.05: added to accept type prototypes */
; 152  :         if ( mem_type == MT_PROC ) {

	cmp	esi, 128				; 00000080H
	jne	SHORT $LN18@CreateLabe

; 153  :             DebugMsg1(("CreateLabel(%s): memtype MT_PROC detected, sym.isproc=%u\n", sym->name, sym->isproc ));
; 154  :             if ( sym->isproc == FALSE ) {

	test	BYTE PTR [rbx+41], 8
	jne	SHORT $LN19@CreateLabe

; 155  :                 CreateProc( sym, NULL, SYM_INTERNAL );

	mov	r8d, r15d
	xor	edx, edx
	mov	rcx, rbx
	call	CreateProc

; 156  :                 CopyPrototype( (struct dsym *)sym, (struct dsym *)ti->symtype );

	mov	rdx, QWORD PTR [rbp+8]
	mov	rcx, rbx
	call	CopyPrototype
$LN19@CreateLabe:

; 157  :             }
; 158  :             mem_type = ti->symtype->mem_type;

	mov	rax, QWORD PTR [rbp+8]
	mov	esi, DWORD PTR [rax+36]

; 159  :             ti->symtype = NULL;

	mov	QWORD PTR [rbp+8], 0
$LN18@CreateLabe:

; 160  :         }
; 161  : 
; 162  :         sym->mem_type = mem_type;

	mov	DWORD PTR [rbx+36], esi

; 163  :         if ( ti ) {

	test	rbp, rbp
	je	SHORT $LN7@CreateLabe

; 164  :             if ( mem_type == MT_TYPE )

	cmp	esi, 196				; 000000c4H
	jne	SHORT $LN21@CreateLabe

; 165  :                 sym->type = ti->symtype;

	mov	rax, QWORD PTR [rbp+8]
	mov	QWORD PTR [rbx+80], rax
	jmp	SHORT $LN7@CreateLabe
$LN21@CreateLabe:

; 166  :             else {
; 167  :                 sym->Ofssize = ti->Ofssize;

	movzx	eax, BYTE PTR [rbp+22]
	mov	BYTE PTR [rbx+44], al

; 168  :                 sym->is_ptr = ti->is_ptr;

	movzx	eax, BYTE PTR [rbp+20]
	mov	BYTE PTR [rbx+45], al

; 169  :                 sym->isfar = ti->is_far;

	movzx	eax, BYTE PTR [rbp+21]
	shl	al, 4
	xor	al, BYTE PTR [rbx+47]
	and	al, 16
	xor	BYTE PTR [rbx+47], al

; 170  :                 sym->target_type = ti->symtype;

	mov	rax, QWORD PTR [rbp+8]
	mov	QWORD PTR [rbx+48], rax

; 171  :                 sym->ptr_memtype = ti->ptr_memtype;

	movzx	eax, BYTE PTR [rbp+24]
	mov	BYTE PTR [rbx+46], al

; 172  :             }
; 173  :         }
; 174  :     } else {

	jmp	SHORT $LN7@CreateLabe
$LN13@CreateLabe:

; 131  :         } else {
; 132  :             /* v2.04: emit a more distinctive error msg */
; 133  :             if ( sym->state == SYM_INTERNAL && sym->mem_type == mem_type )

	cmp	eax, r15d
	jne	SHORT $LN15@CreateLabe

; 134  :                 /* fixme: if label has exactly the same value ( segment+offset ),
; 135  :                  * it's ok.
; 136  :                  */
; 137  :                 EmitErr( SYMBOL_ALREADY_DEFINED, name );

	mov	ecx, 56					; 00000038H
	cmp	DWORD PTR [rbx+36], esi
	je	SHORT $LN32@CreateLabe
$LN15@CreateLabe:

; 138  :             else
; 139  :                 EmitErr( SYMBOL_REDEFINITION, name );

	mov	ecx, 143				; 0000008fH
$LN32@CreateLabe:
	mov	rdx, rdi
	call	EmitErr

; 140  :             return( NULL );

	xor	eax, eax
	jmp	SHORT $LN30@CreateLabe
$LN6@CreateLabe:

; 175  :         /* save old offset */
; 176  :         addr = sym->offset;

	mov	eax, DWORD PTR [rbx+16]
	mov	DWORD PTR addr$[rsp], eax
$LN7@CreateLabe:

; 177  :     }
; 178  : 
; 179  :     sym->isdefined = TRUE;

	or	BYTE PTR [rbx+40], 2

; 180  :     /* v2.05: the label may be "data" - due to the way struct initialization
; 181  :      * is handled. Then fields first_size and first_length must not be
; 182  :      * touched!
; 183  :      */
; 184  :     if ( sym->isdata == FALSE )

	test	BYTE PTR [rbx+41], 4
	jne	SHORT $LN23@CreateLabe

; 185  :         sym->asmpass = Parse_Pass;

	movzx	eax, BYTE PTR Parse_Pass
	mov	BYTE PTR [rbx+46], al
$LN23@CreateLabe:

; 186  :     SetSymSegOfs( sym );

	mov	rcx, rbx
	call	SetSymSegOfs

; 187  : //  DebugMsg(("CreateLabel(%s): ofs=%X\n", sym->name, sym->offset));
; 188  : 
; 189  :     if( Parse_Pass != PASS_1 && sym->offset != addr ) {

	cmp	DWORD PTR Parse_Pass, 0
	je	SHORT $LN24@CreateLabe
	movzx	ecx, BYTE PTR ModuleInfo+422
	mov	eax, DWORD PTR addr$[rsp]
	cmp	DWORD PTR [rbx+16], eax
	cmovne	ecx, r15d
	mov	BYTE PTR ModuleInfo+422, cl
$LN24@CreateLabe:

; 190  : #ifdef DEBUG_OUT
; 191  :         if ( !ModuleInfo.PhaseError )
; 192  :             DebugMsg(("CreateLabel: Phase error, pass %u, sym >%s< first time, new=%" I32_SPEC "X - old=%" I32_SPEC "X\n", Parse_Pass+1, sym->name, sym->offset, addr));
; 193  :         else
; 194  :             DebugMsg(("CreateLabel: pass %u, sym >%s< changed, new=%" I32_SPEC "X - old=%" I32_SPEC "X\n", Parse_Pass+1, sym->name, sym->offset, addr));
; 195  : #endif
; 196  :         ModuleInfo.PhaseError = TRUE;
; 197  :     }
; 198  :     BackPatch( sym );

	mov	rcx, rbx
	call	BackPatch

; 199  :     return( sym );

	mov	rax, rbx
$LN30@CreateLabe:

; 200  : }

	mov	rbx, QWORD PTR [rsp+96]
	mov	r15, QWORD PTR [rsp+104]
	mov	rbp, QWORD PTR [rsp+112]
	add	rsp, 64					; 00000040H
	pop	r14
	pop	rdi
	pop	rsi
	ret	0
CreateLabel ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\label.c
_TEXT	SEGMENT
buffer$ = 48
value$ = 56
GetAnonymousLabel PROC

; 63   : {

$LN4:
	push	rbx
	sub	rsp, 32					; 00000020H

; 64   :     sprintf( buffer, "L&_%04u", ModuleInfo.g.anonymous_label + value );

	mov	r8d, DWORD PTR ModuleInfo+268
	mov	rbx, rcx
	add	r8d, edx
	lea	rdx, OFFSET FLAT:$SG10660
	call	sprintf

; 65   :     return( buffer );

	mov	rax, rbx

; 66   : }

	add	rsp, 32					; 00000020H
	pop	rbx
	ret	0
GetAnonymousLabel ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File d:\hjwasm\hjwasm2.13.1s\hjwasm2.13.1s\label.c
_TEXT	SEGMENT
LabelInit PROC

; 58   :     ModuleInfo.g.anonymous_label = 0;

	mov	DWORD PTR ModuleInfo+268, 0

; 59   : }

	ret	0
LabelInit ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\stdio.h
;	COMDAT sprintf
_TEXT	SEGMENT
_Buffer$ = 80
_Format$ = 88
sprintf	PROC						; COMDAT

; 1776 : {

$LN8:
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	push	rbx
	push	rsi
	push	rdi
	sub	rsp, 48					; 00000030H
	mov	rbx, rdx

; 1777 :     int _Result;
; 1778 :     va_list _ArgList;
; 1779 :     __crt_va_start(_ArgList, _Format);

	lea	rsi, QWORD PTR _Format$[rsp+8]
	mov	rdi, rcx

; 1780 : 
; 1781 :     #pragma warning(push)
; 1782 :     #pragma warning(disable: 4996) // Deprecation
; 1783 :     _Result = _vsprintf_l(_Buffer, _Format, NULL, _ArgList);

	call	__local_stdio_printf_options
	mov	r9, rbx
	mov	QWORD PTR [rsp+40], rsi
	or	rbx, -1
	mov	QWORD PTR [rsp+32], 0
	mov	r8, rbx
	mov	rdx, rdi
	mov	rcx, QWORD PTR [rax]
	or	rcx, 1
	call	__stdio_common_vsprintf
	test	eax, eax
	cmovs	eax, ebx

; 1784 :     #pragma warning(pop)
; 1785 : 
; 1786 :     __crt_va_end(_ArgList);
; 1787 :     return _Result;
; 1788 : }

	add	rsp, 48					; 00000030H
	pop	rdi
	pop	rsi
	pop	rbx
	ret	0
sprintf	ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\stdio.h
;	COMDAT _vsprintf_l
_TEXT	SEGMENT
_Buffer$ = 64
_Format$ = 72
_Locale$ = 80
_ArgList$ = 88
_vsprintf_l PROC					; COMDAT

; 1455 : {

$LN6:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rbp
	mov	QWORD PTR [rsp+24], rsi
	push	rdi
	sub	rsp, 48					; 00000030H
	mov	rbx, r9
	mov	rdi, r8
	mov	rsi, rdx
	mov	rbp, rcx

; 1456 :     #pragma warning(push)
; 1457 :     #pragma warning(disable: 4996) // Deprecation
; 1458 :     return _vsnprintf_l(_Buffer, (size_t)-1, _Format, _Locale, _ArgList);

	call	__local_stdio_printf_options
	mov	QWORD PTR [rsp+40], rbx
	mov	r9, rsi
	or	rbx, -1
	mov	QWORD PTR [rsp+32], rdi
	mov	r8, rbx
	mov	rdx, rbp
	mov	rcx, QWORD PTR [rax]
	or	rcx, 1
	call	__stdio_common_vsprintf

; 1459 :     #pragma warning(pop)
; 1460 : }

	mov	rbp, QWORD PTR [rsp+72]
	test	eax, eax
	mov	rsi, QWORD PTR [rsp+80]
	cmovs	eax, ebx
	mov	rbx, QWORD PTR [rsp+64]
	add	rsp, 48					; 00000030H
	pop	rdi
	ret	0
_vsprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\stdio.h
;	COMDAT _vsnprintf_l
_TEXT	SEGMENT
_Buffer$ = 64
_BufferCount$ = 72
_Format$ = 80
_Locale$ = 88
_ArgList$ = 96
_vsnprintf_l PROC					; COMDAT

; 1385 : {

$LN4:
	mov	QWORD PTR [rsp+8], rbx
	mov	QWORD PTR [rsp+16], rbp
	mov	QWORD PTR [rsp+24], rsi
	push	rdi
	sub	rsp, 48					; 00000030H
	mov	rbx, r9
	mov	rdi, r8
	mov	rsi, rdx
	mov	rbp, rcx

; 1386 :     int const _Result = __stdio_common_vsprintf(

	call	__local_stdio_printf_options
	mov	r9, rdi
	mov	r8, rsi
	mov	rdx, rbp
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR _ArgList$[rsp]
	or	rcx, 1
	mov	QWORD PTR [rsp+40], rax
	mov	QWORD PTR [rsp+32], rbx
	call	__stdio_common_vsprintf

; 1387 :         _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS | _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION,
; 1388 :         _Buffer, _BufferCount, _Format, _Locale, _ArgList);
; 1389 : 
; 1390 :     return _Result < 0 ? -1 : _Result;
; 1391 : }

	mov	rbx, QWORD PTR [rsp+64]
	or	ecx, -1
	mov	rbp, QWORD PTR [rsp+72]
	test	eax, eax
	mov	rsi, QWORD PTR [rsp+80]
	cmovs	eax, ecx
	add	rsp, 48					; 00000030H
	pop	rdi
	ret	0
_vsnprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Ogtpy
; File c:\program files (x86)\windows kits\10\include\10.0.10150.0\ucrt\corecrt_stdio_config.h
;	COMDAT __local_stdio_printf_options
_TEXT	SEGMENT
__local_stdio_printf_options PROC			; COMDAT

; 74   :     static unsigned __int64 _OptionsStorage;
; 75   :     return &_OptionsStorage;

	lea	rax, OFFSET FLAT:?_OptionsStorage@?1??__local_stdio_printf_options@@9@9 ; `__local_stdio_printf_options'::`2'::_OptionsStorage

; 76   : }

	ret	0
__local_stdio_printf_options ENDP
_TEXT	ENDS
END
