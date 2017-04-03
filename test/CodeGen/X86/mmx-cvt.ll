; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+mmx,+sse2 | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+mmx,+sse2 | FileCheck %s --check-prefix=X64

; If we are transferring XMM conversion results to MMX registers we could use the MMX equivalents
; (CVTPD2PI/CVTTPD2PI + CVTPS2PI/CVTTPS2PI) without affecting rounding/exceptions etc.

define void @cvt_v2f64_v2i32(<2 x double>, <1 x i64>*) nounwind {
; X86-LABEL: cvt_v2f64_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvtpd2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: cvt_v2f64_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvtpd2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = tail call <4 x i32> @llvm.x86.sse2.cvtpd2dq(<2 x double> %0)
  %4 = bitcast <4 x i32> %3 to <2 x i64>
  %5 = extractelement <2 x i64> %4, i32 0
  %6 = bitcast i64 %5 to x86_mmx
  %7 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %6, x86_mmx %6)
  %8 = bitcast x86_mmx %7 to i64
  %9 = insertelement <1 x i64> undef, i64 %8, i32 0
  store <1 x i64> %9, <1 x i64>* %1
  ret void
}

define void @cvtt_v2f64_v2i32(<2 x double>, <1 x i64>*) nounwind {
; X86-LABEL: cvtt_v2f64_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvttpd2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: cvtt_v2f64_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvttpd2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = tail call <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double> %0)
  %4 = bitcast <4 x i32> %3 to <2 x i64>
  %5 = extractelement <2 x i64> %4, i32 0
  %6 = bitcast i64 %5 to x86_mmx
  %7 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %6, x86_mmx %6)
  %8 = bitcast x86_mmx %7 to i64
  %9 = insertelement <1 x i64> undef, i64 %8, i32 0
  store <1 x i64> %9, <1 x i64>* %1
  ret void
}

define void @fptosi_v2f64_v2i32(<2 x double>, <1 x i64>*) nounwind {
; X86-LABEL: fptosi_v2f64_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvttpd2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: fptosi_v2f64_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvttpd2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = fptosi <2 x double> %0 to <2 x i32>
  %4 = bitcast <2 x i32> %3 to x86_mmx
  %5 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %4, x86_mmx %4)
  %6 = bitcast x86_mmx %5 to i64
  %7 = insertelement <1 x i64> undef, i64 %6, i32 0
  store <1 x i64> %7, <1 x i64>* %1
  ret void
}

define void @cvt_v2f32_v2i32(<4 x float>, <1 x i64>*) nounwind {
; X86-LABEL: cvt_v2f32_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvtps2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: cvt_v2f32_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvtps2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = tail call <4 x i32> @llvm.x86.sse2.cvtps2dq(<4 x float> %0)
  %4 = bitcast <4 x i32> %3 to <2 x i64>
  %5 = extractelement <2 x i64> %4, i32 0
  %6 = bitcast i64 %5 to x86_mmx
  %7 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %6, x86_mmx %6)
  %8 = bitcast x86_mmx %7 to i64
  %9 = insertelement <1 x i64> undef, i64 %8, i32 0
  store <1 x i64> %9, <1 x i64>* %1
  ret void
}

define void @cvtt_v2f32_v2i32(<4 x float>, <1 x i64>*) nounwind {
; X86-LABEL: cvtt_v2f32_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvttps2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: cvtt_v2f32_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvttps2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = tail call <4 x i32> @llvm.x86.sse2.cvttps2dq(<4 x float> %0)
  %4 = bitcast <4 x i32> %3 to <2 x i64>
  %5 = extractelement <2 x i64> %4, i32 0
  %6 = bitcast i64 %5 to x86_mmx
  %7 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %6, x86_mmx %6)
  %8 = bitcast x86_mmx %7 to i64
  %9 = insertelement <1 x i64> undef, i64 %8, i32 0
  store <1 x i64> %9, <1 x i64>* %1
  ret void
}

define void @fptosi_v4f32_v4i32(<4 x float>, <1 x i64>*) nounwind {
; X86-LABEL: fptosi_v4f32_v4i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvttps2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: fptosi_v4f32_v4i32:
; X64:       # BB#0:
; X64-NEXT:    cvttps2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = fptosi <4 x float> %0 to <4 x i32>
  %4 = shufflevector <4 x i32> %3, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  %5 = bitcast <2 x i32> %4 to x86_mmx
  %6 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %5, x86_mmx %5)
  %7 = bitcast x86_mmx %6 to i64
  %8 = insertelement <1 x i64> undef, i64 %7, i32 0
  store <1 x i64> %8, <1 x i64>* %1
  ret void
}

define void @fptosi_v2f32_v2i32(<4 x float>, <1 x i64>*) nounwind {
; X86-LABEL: fptosi_v2f32_v2i32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    cvttps2pi %xmm0, %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movl (%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl %edx, 4(%eax)
; X86-NEXT:    movl %ecx, (%eax)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: fptosi_v2f32_v2i32:
; X64:       # BB#0:
; X64-NEXT:    cvttps2pi %xmm0, %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, (%rdi)
; X64-NEXT:    retq
  %3 = fptosi <4 x float> %0 to <4 x i32>
  %4 = bitcast <4 x i32> %3 to <2 x i64>
  %5 = extractelement <2 x i64> %4, i32 0
  %6 = bitcast i64 %5 to x86_mmx
  %7 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %6, x86_mmx %6)
  %8 = bitcast x86_mmx %7 to i64
  %9 = insertelement <1 x i64> undef, i64 %8, i32 0
  store <1 x i64> %9, <1 x i64>* %1
  ret void
}

; FIXME: If we are transferring MMX registers to XMM for conversion we could use the MMX equivalents
; (CVTPI2PD + CVTPI2PS) without affecting rounding/exceptions etc.

define <2 x double> @sitofp_v2i32_v2f64(<1 x i64>*) nounwind {
; X86-LABEL: sitofp_v2i32_v2f64:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movq (%eax), %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    cvtdq2pd (%esp), %xmm0
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: sitofp_v2i32_v2f64:
; X64:       # BB#0:
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq2dq %mm0, %xmm0
; X64-NEXT:    cvtdq2pd %xmm0, %xmm0
; X64-NEXT:    retq
  %2 = bitcast <1 x i64>* %0 to x86_mmx*
  %3 = load x86_mmx, x86_mmx* %2, align 8
  %4 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %3, x86_mmx %3)
  %5 = bitcast x86_mmx %4 to i64
  %6 = insertelement <2 x i64> undef, i64 %5, i32 0
  %7 = bitcast <2 x i64> %6 to <4 x i32>
  %8 = shufflevector <4 x i32> %7, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  %9 = sitofp <2 x i32> %8 to <2 x double>
  ret <2 x double> %9
}

define <4 x float> @sitofp_v2i32_v2f32(<1 x i64>*) nounwind {
; X86-LABEL: sitofp_v2i32_v2f32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movq (%eax), %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    cvtdq2ps %xmm0, %xmm0
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: sitofp_v2i32_v2f32:
; X64:       # BB#0:
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movq %mm0, -{{[0-9]+}}(%rsp)
; X64-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    cvtdq2ps %xmm0, %xmm0
; X64-NEXT:    retq
  %2 = bitcast <1 x i64>* %0 to x86_mmx*
  %3 = load x86_mmx, x86_mmx* %2, align 8
  %4 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %3, x86_mmx %3)
  %5 = bitcast x86_mmx %4 to <2 x i32>
  %6 = shufflevector <2 x i32> %5, <2 x i32> zeroinitializer, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  ret <4 x float> %7
}

define <4 x float> @cvt_v2i32_v2f32(<1 x i64>*) nounwind {
; X86-LABEL: cvt_v2i32_v2f32:
; X86:       # BB#0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    movl 8(%ebp), %eax
; X86-NEXT:    movq (%eax), %mm0
; X86-NEXT:    paddd %mm0, %mm0
; X86-NEXT:    movq %mm0, (%esp)
; X86-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    cvtdq2ps %xmm0, %xmm0
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: cvt_v2i32_v2f32:
; X64:       # BB#0:
; X64-NEXT:    movq (%rdi), %mm0
; X64-NEXT:    paddd %mm0, %mm0
; X64-NEXT:    movd %mm0, %rax
; X64-NEXT:    movd %rax, %xmm0
; X64-NEXT:    cvtdq2ps %xmm0, %xmm0
; X64-NEXT:    retq
  %2 = bitcast <1 x i64>* %0 to x86_mmx*
  %3 = load x86_mmx, x86_mmx* %2, align 8
  %4 = tail call x86_mmx @llvm.x86.mmx.padd.d(x86_mmx %3, x86_mmx %3)
  %5 = bitcast x86_mmx %4 to i64
  %6 = insertelement <2 x i64> undef, i64 %5, i32 0
  %7 = insertelement <2 x i64> %6, i64 0, i32 1
  %8 = bitcast <2 x i64> %7 to <4 x i32>
  %9 = tail call <4 x float> @llvm.x86.sse2.cvtdq2ps(<4 x i32> %8)
  ret <4 x float> %9
}

declare x86_mmx @llvm.x86.mmx.padd.d(x86_mmx, x86_mmx)
declare <4 x i32> @llvm.x86.sse2.cvtpd2dq(<2 x double>)
declare <4 x i32> @llvm.x86.sse2.cvttpd2dq(<2 x double>)
declare <4 x i32> @llvm.x86.sse2.cvtps2dq(<4 x float>)
declare <4 x i32> @llvm.x86.sse2.cvttps2dq(<4 x float>)
declare <4 x float> @llvm.x86.sse2.cvtdq2ps(<4 x i32>)
