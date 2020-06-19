; ModuleID = 'bpftrace'
source_filename = "bpftrace"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf-pc-linux"

%printf_t = type { i64, %"unsigned int64_unsigned int64_unsigned int64__tuple_t" }
%"unsigned int64_unsigned int64_unsigned int64__tuple_t" = type <{ i64, i64, i64 }>

; Function Attrs: nounwind
declare i64 @llvm.bpf.pseudo(i64, i64) #0

define i64 @"kprobe:f"(i8*) local_unnamed_addr section "s_kprobe:f_1" {
entry:
  %printf_args = alloca %printf_t, align 8
  %1 = bitcast %printf_t* %printf_args to i8*
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* nonnull %1)
  %2 = getelementptr inbounds %printf_t, %printf_t* %printf_args, i64 0, i32 0
  store i64 0, i64* %2, align 8
  %get_ns = tail call i64 inttoptr (i64 5 to i64 ()*)()
  %strftime_t.sroa.0.0..sroa_idx = getelementptr inbounds %printf_t, %printf_t* %printf_args, i64 0, i32 1, i32 0
  store i64 30008, i64* %strftime_t.sroa.0.0..sroa_idx, align 8
  %strftime_t.sroa.4.0..sroa_idx2 = getelementptr inbounds %printf_t, %printf_t* %printf_args, i64 0, i32 1, i32 1
  store i64 0, i64* %strftime_t.sroa.4.0..sroa_idx2, align 8
  %strftime_t.sroa.5.0..sroa_idx4 = getelementptr inbounds %printf_t, %printf_t* %printf_args, i64 0, i32 1, i32 2
  store i64 %get_ns, i64* %strftime_t.sroa.5.0..sroa_idx4, align 8
  %pseudo = tail call i64 @llvm.bpf.pseudo(i64 1, i64 1)
  %get_cpu_id = tail call i64 inttoptr (i64 8 to i64 ()*)()
  %perf_event_output = call i64 inttoptr (i64 25 to i64 (i8*, i64, i64, %printf_t*, i64)*)(i8* %0, i64 %pseudo, i64 %get_cpu_id, %printf_t* nonnull %printf_args, i64 32)
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* nonnull %1)
  ret i64 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
