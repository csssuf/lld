; RUN: llc -filetype=obj %s -o %t.o
; RUN: lld -flavor wasm --check-signatures -o %t.wasm %t.o
; RUN: llvm-readobj -file-headers %t.wasm | FileCheck %s

target triple = "wasm32-unknown-unknown-wasm"

define hidden void @_start() local_unnamed_addr #0 {
entry:
    ret void
}

; CHECK: Format: WASM
; CHECK: Arch: wasm32
; CHECK: AddressSize: 32bit
; CHECK: Version: 0x1
