; ModuleID = 'add.c'
source_filename = "add.c"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32"

@__heap_base = external global i8, align 1
@bump_pointer = hidden global ptr @__heap_base, align 4

; Function Attrs: noinline nounwind optnone
define hidden ptr @malloc2(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 4
  store i32 %0, ptr %2, align 4
  %4 = load ptr, ptr @bump_pointer, align 4
  store ptr %4, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr @bump_pointer, align 4
  %7 = getelementptr inbounds i8, ptr %6, i32 %5
  store ptr %7, ptr @bump_pointer, align 4
  %8 = load ptr, ptr %3, align 4
  ret ptr %8
}

; Function Attrs: noinline nounwind optnone
define hidden void @free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 4
  store ptr %0, ptr %2, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define hidden i32 @add(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = mul nsw i32 %5, %6
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %7, %8
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone
define hidden i32 @sum(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 4
  %13 = load i32, ptr %6, align 4
  %14 = getelementptr inbounds i32, ptr %12, i32 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %5, align 4
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %6, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %6, align 4
  br label %7, !llvm.loop !2

21:                                               ; preds = %7
  %22 = load i32, ptr %5, align 4
  ret i32 %22
}

attributes #0 = { noinline nounwind optnone "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+mutable-globals,+sign-ext" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 18.1.8"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
