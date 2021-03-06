; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-unknown | FileCheck %s --check-prefix=X32
; RUN: llc < %s -mtriple=x86_64-unknown | FileCheck %s --check-prefix=X64

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define void @test(i256* %a, i256* %b, i256* %out) #0 {
; X32-LABEL: test:
; X32:       # BB#0: # %entry
; X32-NEXT:    pushl %ebp
; X32-NEXT:    .cfi_def_cfa_offset 8
; X32-NEXT:    .cfi_offset %ebp, -8
; X32-NEXT:    movl %esp, %ebp
; X32-NEXT:    .cfi_def_cfa_register %ebp
; X32-NEXT:    pushl %ebx
; X32-NEXT:    pushl %edi
; X32-NEXT:    pushl %esi
; X32-NEXT:    andl $-8, %esp
; X32-NEXT:    subl $168, %esp
; X32-NEXT:    .cfi_offset %esi, -20
; X32-NEXT:    .cfi_offset %edi, -16
; X32-NEXT:    .cfi_offset %ebx, -12
; X32-NEXT:    movl 8(%ebp), %eax
; X32-NEXT:    movl 16(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 20(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 24(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 28(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 8(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 12(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl (%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 4(%eax), %ebx
; X32-NEXT:    movl 12(%ebp), %eax
; X32-NEXT:    movl 16(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 20(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 24(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 28(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl (%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 4(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl 8(%eax), %esi
; X32-NEXT:    movl 12(%eax), %edi
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl %edi
; X32-NEXT:    movl %edi, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    pushl %esi
; X32-NEXT:    movl %esi, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl %ebx
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl %edi
; X32-NEXT:    pushl %esi
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    movl {{[0-9]+}}(%esp), %esi # 4-byte Reload
; X32-NEXT:    pushl %esi
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi # 4-byte Reload
; X32-NEXT:    pushl %edi
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl %ebx
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl %esi
; X32-NEXT:    pushl %edi
; X32-NEXT:    pushl %ebx
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl $0
; X32-NEXT:    pushl %esi
; X32-NEXT:    pushl %edi
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    addl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    adcl $0, %ecx
; X32-NEXT:    adcl $0, %eax
; X32-NEXT:    addl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    movl %edx, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    movl %esi, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi
; X32-NEXT:    adcl $0, %edi
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ebx
; X32-NEXT:    adcl $0, %ebx
; X32-NEXT:    addl %ecx, %edi
; X32-NEXT:    adcl %eax, %ebx
; X32-NEXT:    setb %al
; X32-NEXT:    addl {{[0-9]+}}(%esp), %edi
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %ebx
; X32-NEXT:    movzbl %al, %eax
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl %eax, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    adcl $0, %eax
; X32-NEXT:    movl %eax, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    leal {{[0-9]+}}(%esp), %eax
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl {{[0-9]+}}(%esp) # 4-byte Folded Reload
; X32-NEXT:    pushl %eax
; X32-NEXT:    calll __multi3
; X32-NEXT:    addl $32, %esp
; X32-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    addl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %ecx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    addl %edi, %esi
; X32-NEXT:    adcl %ebx, %ecx
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %edx # 4-byte Folded Reload
; X32-NEXT:    adcl {{[0-9]+}}(%esp), %eax # 4-byte Folded Reload
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi
; X32-NEXT:    movl %edi, {{[0-9]+}}(%esp) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ebx
; X32-NEXT:    movl 16(%ebp), %edi
; X32-NEXT:    movl %ebx, 4(%edi)
; X32-NEXT:    movl 16(%ebp), %ebx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi # 4-byte Reload
; X32-NEXT:    movl %edi, (%ebx)
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi # 4-byte Reload
; X32-NEXT:    movl %edi, 8(%ebx)
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi # 4-byte Reload
; X32-NEXT:    movl %edi, 12(%ebx)
; X32-NEXT:    movl %esi, 16(%ebx)
; X32-NEXT:    movl %ecx, 20(%ebx)
; X32-NEXT:    movl %edx, 24(%ebx)
; X32-NEXT:    movl %eax, 28(%ebx)
; X32-NEXT:    leal -12(%ebp), %esp
; X32-NEXT:    popl %esi
; X32-NEXT:    popl %edi
; X32-NEXT:    popl %ebx
; X32-NEXT:    popl %ebp
; X32-NEXT:    retl
;
; X64-LABEL: test:
; X64:       # BB#0: # %entry
; X64-NEXT:    pushq %r15
; X64-NEXT:    .cfi_def_cfa_offset 16
; X64-NEXT:    pushq %r14
; X64-NEXT:    .cfi_def_cfa_offset 24
; X64-NEXT:    pushq %rbx
; X64-NEXT:    .cfi_def_cfa_offset 32
; X64-NEXT:    .cfi_offset %rbx, -32
; X64-NEXT:    .cfi_offset %r14, -24
; X64-NEXT:    .cfi_offset %r15, -16
; X64-NEXT:    movq %rdx, %r9
; X64-NEXT:    movq (%rdi), %r11
; X64-NEXT:    movq 8(%rdi), %r8
; X64-NEXT:    movq 16(%rdi), %rbx
; X64-NEXT:    movq 16(%rsi), %r10
; X64-NEXT:    movq (%rsi), %rcx
; X64-NEXT:    movq 8(%rsi), %r15
; X64-NEXT:    movq 24(%rdi), %rdi
; X64-NEXT:    imulq %rcx, %rdi
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    mulq %rbx
; X64-NEXT:    movq %rax, %r14
; X64-NEXT:    addq %rdi, %rdx
; X64-NEXT:    imulq %r15, %rbx
; X64-NEXT:    addq %rdx, %rbx
; X64-NEXT:    movq %r10, %rdi
; X64-NEXT:    imulq %r8, %rdi
; X64-NEXT:    movq %r10, %rax
; X64-NEXT:    mulq %r11
; X64-NEXT:    movq %rax, %r10
; X64-NEXT:    addq %rdi, %rdx
; X64-NEXT:    movq 24(%rsi), %rdi
; X64-NEXT:    imulq %r11, %rdi
; X64-NEXT:    addq %rdx, %rdi
; X64-NEXT:    addq %r14, %r10
; X64-NEXT:    adcq %rbx, %rdi
; X64-NEXT:    movq %r11, %rax
; X64-NEXT:    mulq %rcx
; X64-NEXT:    movq %rdx, %rsi
; X64-NEXT:    movq %rax, %r14
; X64-NEXT:    movq %r8, %rax
; X64-NEXT:    mulq %rcx
; X64-NEXT:    movq %rdx, %rcx
; X64-NEXT:    movq %rax, %rbx
; X64-NEXT:    addq %rsi, %rbx
; X64-NEXT:    adcq $0, %rcx
; X64-NEXT:    movq %r11, %rax
; X64-NEXT:    mulq %r15
; X64-NEXT:    movq %rdx, %rsi
; X64-NEXT:    movq %rax, %r11
; X64-NEXT:    addq %rbx, %r11
; X64-NEXT:    adcq %rcx, %rsi
; X64-NEXT:    setb %al
; X64-NEXT:    movzbl %al, %ecx
; X64-NEXT:    movq %r8, %rax
; X64-NEXT:    mulq %r15
; X64-NEXT:    addq %rsi, %rax
; X64-NEXT:    adcq %rcx, %rdx
; X64-NEXT:    addq %r10, %rax
; X64-NEXT:    adcq %rdi, %rdx
; X64-NEXT:    movq %r14, (%r9)
; X64-NEXT:    movq %r11, 8(%r9)
; X64-NEXT:    movq %rax, 16(%r9)
; X64-NEXT:    movq %rdx, 24(%r9)
; X64-NEXT:    popq %rbx
; X64-NEXT:    popq %r14
; X64-NEXT:    popq %r15
; X64-NEXT:    retq
entry:
  %av = load i256, i256* %a
  %bv = load i256, i256* %b
  %r = mul i256 %av, %bv
  store i256 %r, i256* %out
  ret void
}

attributes #0 = { norecurse nounwind uwtable }
