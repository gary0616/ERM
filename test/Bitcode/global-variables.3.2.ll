; RUN:  llvm-dis < %s.bc| FileCheck %s

; global-variables.3.2.ll.bc was generated by passing this file to llvm-as-3.2.
; The test checks that LLVM does not silently misread global variables attributes of
; older bitcode files.

@global.var = global i32 1
; CHECK: @global.var = global i32 1

@constant.var = constant i32 1
; CHECK: @constant.var = constant i32 1

@noinit.var = global float undef
; CHECK: @noinit.var = global float undef

@section.var = global i32 1, section "foo"
; CHECK: @section.var = global i32 1, section "foo"

@align.var = global i64 undef, align 8
; CHECK: @align.var = global i64 undef, align 8

@unnamed_addr.var = unnamed_addr global i8 1
; CHECK: @unnamed_addr.var = unnamed_addr global i8 1

@default_addrspace.var = addrspace(0) global i8 1 
; CHECK: @default_addrspace.var = global i8 1 

@non_default_addrspace.var = addrspace(1) global i8* undef 
; CHECK: @non_default_addrspace.var = addrspace(1) global i8* undef 

@initialexec.var = thread_local(initialexec) global i32 0, align 4
; CHECK: @initialexec.var = thread_local(initialexec) global i32 0, align 4

@localdynamic.var = thread_local(localdynamic) constant i32 0, align 4
; CHECK: @localdynamic.var = thread_local(localdynamic) constant i32 0, align 4

@localexec.var = thread_local(localexec) constant i32 0, align 4
; CHECK: @localexec.var = thread_local(localexec) constant i32 0, align 4

@string.var = private unnamed_addr constant [13 x i8] c"hello world\0A\00"
; CHECK: @string.var = private unnamed_addr constant [13 x i8] c"hello world\0A\00"