; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Fault_Injector_ConfigsSt = type { i32, i32, i32, i32, i32, i32, [10 x i8], double, [32 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.rusage = type { %struct.timeval, %struct.timeval, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon, %union.anon }
%struct.timeval = type { i64, i64 }
%union.anon = type { i64 }

@.str = private unnamed_addr constant [81 x i8] c"\0AUSAGE:\0A%s <grid x> <grid y> <grid z> <block x> <block y> <block z> <timesteps>\0A\00", align 1
@.str.1 = private unnamed_addr constant [101 x i8] c"\0ATIME SKEWING CONSTRAINTS:\0AIn each dimension, <grid size - 2> should be a multiple of <block size>.\0A\00", align 1
@.str.2 = private unnamed_addr constant [133 x i8] c"\0ACIRCULAR QUEUE CONSTRAINTS:\0A<grid y - 2> should be a multiple of <block y>.  The block sizes in the other dimensions are ignored.\0A\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"#######NUM_TRIALS: %d#######\0A\00", align 1
@EPSILON = dso_local constant double 0x3BC79CA10C924223, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [32 x i8] c"####### EM: %s, EB: %s #######\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [36 x i8] c"******* Injected Iters: %d *******\0A\00", align 1
@.str.2.6 = private unnamed_addr constant [15 x i8] c"timestep = %d,\00", align 1
@.str.3.7 = private unnamed_addr constant [8 x i8] c"%.25lf,\00", align 1
@.str.4.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"./fault_injector.config\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"No fault_injector.config found!\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"x=\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"=\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"y=\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"z=\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"iteration=\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"steps=\00", align 1
@.str.14 = private unnamed_addr constant [12 x i8] c"compressor=\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"SZerrorBoundMode=\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"ABS\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"SZabsErrorBound=\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"REL\00", align 1
@.str.19 = private unnamed_addr constant [17 x i8] c"SZrelBoundRatio=\00", align 1
@.str.20 = private unnamed_addr constant [21 x i8] c"./exconfig/sz.config\00", align 1
@.str.21 = private unnamed_addr constant [23 x i8] c"./exconfig/replace.tmp\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.23 = private unnamed_addr constant [21 x i8] c"Unable t open file.\0A\00", align 1
@.str.24 = private unnamed_addr constant [18 x i8] c"errorBoundMode = \00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"errorBoundMode = ABS\0A\00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"errorBoundMode = REL\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"absErrBound = \00", align 1
@__const.overwrite_sz_config.temp_buffer = private unnamed_addr constant [40 x i8] c"absErrBound = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.28 = private unnamed_addr constant [17 x i8] c"relBoundRatio = \00", align 1
@__const.overwrite_sz_config.temp_buffer.29 = private unnamed_addr constant [40 x i8] c"relBoundRatio = \00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.30 = private unnamed_addr constant [30 x i8] c"Can not read sz.config file!\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %Anext = alloca double*, align 8
  %A0 = alloca double*, align 8
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %nz = alloca i32, align 4
  %tx = alloca i32, align 4
  %ty = alloca i32, align 4
  %tz = alloca i32, align 4
  %timesteps = alloca i32, align 4
  %i = alloca i32, align 4
  %t1 = alloca i64, align 8
  %t2 = alloca i64, align 8
  %spt = alloca double, align 8
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !DIExpression()), !dbg !42
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata double** %Anext, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata double** %A0, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %nx, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %ny, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %nz, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %tx, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %ty, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %tz, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %timesteps, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %i, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %t1, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i64* %t2, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata double* %spt, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load i32, i32* %argc.addr, align 4, !dbg !71
  %cmp = icmp slt i32 %0, 8, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !75
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !75
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str, i64 0, i64 0), i8* %2), !dbg !77
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([101 x i8], [101 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([133 x i8], [133 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  store i32 1, i32* %retval, align 4, !dbg !80
  br label %return, !dbg !80

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !81
  %arrayidx3 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !81
  %4 = load i8*, i8** %arrayidx3, align 8, !dbg !81
  %call4 = call i32 @atoi(i8* %4) #7, !dbg !82
  store i32 %call4, i32* %nx, align 4, !dbg !83
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !84
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i64 2, !dbg !84
  %6 = load i8*, i8** %arrayidx5, align 8, !dbg !84
  %call6 = call i32 @atoi(i8* %6) #7, !dbg !85
  store i32 %call6, i32* %ny, align 4, !dbg !86
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !87
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i64 3, !dbg !87
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !87
  %call8 = call i32 @atoi(i8* %8) #7, !dbg !88
  store i32 %call8, i32* %nz, align 4, !dbg !89
  %9 = load i8**, i8*** %argv.addr, align 8, !dbg !90
  %arrayidx9 = getelementptr inbounds i8*, i8** %9, i64 4, !dbg !90
  %10 = load i8*, i8** %arrayidx9, align 8, !dbg !90
  %call10 = call i32 @atoi(i8* %10) #7, !dbg !91
  store i32 %call10, i32* %tx, align 4, !dbg !92
  %11 = load i8**, i8*** %argv.addr, align 8, !dbg !93
  %arrayidx11 = getelementptr inbounds i8*, i8** %11, i64 5, !dbg !93
  %12 = load i8*, i8** %arrayidx11, align 8, !dbg !93
  %call12 = call i32 @atoi(i8* %12) #7, !dbg !94
  store i32 %call12, i32* %ty, align 4, !dbg !95
  %13 = load i8**, i8*** %argv.addr, align 8, !dbg !96
  %arrayidx13 = getelementptr inbounds i8*, i8** %13, i64 6, !dbg !96
  %14 = load i8*, i8** %arrayidx13, align 8, !dbg !96
  %call14 = call i32 @atoi(i8* %14) #7, !dbg !97
  store i32 %call14, i32* %tz, align 4, !dbg !98
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !99
  %arrayidx15 = getelementptr inbounds i8*, i8** %15, i64 7, !dbg !99
  %16 = load i8*, i8** %arrayidx15, align 8, !dbg !99
  %call16 = call i32 @atoi(i8* %16) #7, !dbg !100
  store i32 %call16, i32* %timesteps, align 4, !dbg !101
  %call17 = call double (...) bitcast (double ()* @seconds_per_tick to double (...)*)(), !dbg !102
  store double %call17, double* %spt, align 8, !dbg !103
  %17 = load i32, i32* %nx, align 4, !dbg !104
  %conv = sext i32 %17 to i64, !dbg !104
  %mul = mul i64 8, %conv, !dbg !105
  %18 = load i32, i32* %ny, align 4, !dbg !106
  %conv18 = sext i32 %18 to i64, !dbg !106
  %mul19 = mul i64 %mul, %conv18, !dbg !107
  %19 = load i32, i32* %nz, align 4, !dbg !108
  %conv20 = sext i32 %19 to i64, !dbg !108
  %mul21 = mul i64 %mul19, %conv20, !dbg !109
  %call22 = call noalias align 16 i8* @malloc(i64 %mul21) #8, !dbg !110
  %20 = bitcast i8* %call22 to double*, !dbg !111
  store double* %20, double** %Anext, align 8, !dbg !112
  %21 = load i32, i32* %nx, align 4, !dbg !113
  %conv23 = sext i32 %21 to i64, !dbg !113
  %mul24 = mul i64 8, %conv23, !dbg !114
  %22 = load i32, i32* %ny, align 4, !dbg !115
  %conv25 = sext i32 %22 to i64, !dbg !115
  %mul26 = mul i64 %mul24, %conv25, !dbg !116
  %23 = load i32, i32* %nz, align 4, !dbg !117
  %conv27 = sext i32 %23 to i64, !dbg !117
  %mul28 = mul i64 %mul26, %conv27, !dbg !118
  %call29 = call noalias align 16 i8* @malloc(i64 %mul28) #8, !dbg !119
  %24 = bitcast i8* %call29 to double*, !dbg !120
  store double* %24, double** %A0, align 8, !dbg !121
  store i32 0, i32* %i, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc47, %if.end
  %25 = load i32, i32* %i, align 4, !dbg !125
  %cmp30 = icmp slt i32 %25, 1, !dbg !127
  br i1 %cmp30, label %for.body, label %for.end49, !dbg !128

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %i, align 4, !dbg !129
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i64 0, i64 0), i32 %26), !dbg !131
  %call33 = call i64 @time(i64* null) #8, !dbg !132
  %conv34 = trunc i64 %call33 to i32, !dbg !132
  call void @srand(i32 %conv34) #8, !dbg !133
  %27 = load i32, i32* %nx, align 4, !dbg !134
  %28 = load i32, i32* %ny, align 4, !dbg !135
  %29 = load i32, i32* %nz, align 4, !dbg !136
  %30 = load double*, double** %Anext, align 8, !dbg !137
  call void @StencilInit(i32 %27, i32 %28, i32 %29, double* %30), !dbg !138
  call void @llvm.dbg.declare(metadata i32* %j, metadata !139, metadata !DIExpression()), !dbg !141
  store i32 0, i32* %j, align 4, !dbg !141
  br label %for.cond35, !dbg !142

for.cond35:                                       ; preds = %for.inc, %for.body
  %31 = load i32, i32* %j, align 4, !dbg !143
  %32 = load i32, i32* %nx, align 4, !dbg !145
  %33 = load i32, i32* %ny, align 4, !dbg !146
  %mul36 = mul nsw i32 %32, %33, !dbg !147
  %34 = load i32, i32* %nz, align 4, !dbg !148
  %mul37 = mul nsw i32 %mul36, %34, !dbg !149
  %cmp38 = icmp slt i32 %31, %mul37, !dbg !150
  br i1 %cmp38, label %for.body40, label %for.end, !dbg !151

for.body40:                                       ; preds = %for.cond35
  %35 = load double*, double** %Anext, align 8, !dbg !152
  %36 = load i32, i32* %j, align 4, !dbg !153
  %idxprom = sext i32 %36 to i64, !dbg !152
  %arrayidx41 = getelementptr inbounds double, double* %35, i64 %idxprom, !dbg !152
  %37 = load double, double* %arrayidx41, align 8, !dbg !152
  %38 = load double*, double** %A0, align 8, !dbg !154
  %39 = load i32, i32* %j, align 4, !dbg !155
  %idxprom42 = sext i32 %39 to i64, !dbg !154
  %arrayidx43 = getelementptr inbounds double, double* %38, i64 %idxprom42, !dbg !154
  store double %37, double* %arrayidx43, align 8, !dbg !156
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body40
  %40 = load i32, i32* %j, align 4, !dbg !157
  %inc = add nsw i32 %40, 1, !dbg !157
  store i32 %inc, i32* %j, align 4, !dbg !157
  br label %for.cond35, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond35
  %call44 = call i64 @getticks(), !dbg !162
  store i64 %call44, i64* %t1, align 8, !dbg !163
  %41 = load double*, double** %A0, align 8, !dbg !164
  %42 = load double*, double** %Anext, align 8, !dbg !165
  %43 = load i32, i32* %nx, align 4, !dbg !166
  %44 = load i32, i32* %ny, align 4, !dbg !167
  %45 = load i32, i32* %nz, align 4, !dbg !168
  %46 = load i32, i32* %tx, align 4, !dbg !169
  %47 = load i32, i32* %ty, align 4, !dbg !170
  %48 = load i32, i32* %tz, align 4, !dbg !171
  %49 = load i32, i32* %timesteps, align 4, !dbg !172
  call void @StencilProbe(double* %41, double* %42, i32 %43, i32 %44, i32 %45, i32 %46, i32 %47, i32 %48, i32 %49), !dbg !173
  %call45 = call i64 @getticks(), !dbg !174
  store i64 %call45, i64* %t2, align 8, !dbg !175
  %call46 = call i32 @sleep(i32 1), !dbg !176
  br label %for.inc47, !dbg !177

for.inc47:                                        ; preds = %for.end
  %50 = load i32, i32* %i, align 4, !dbg !178
  %inc48 = add nsw i32 %50, 1, !dbg !178
  store i32 %inc48, i32* %i, align 4, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end49:                                        ; preds = %for.cond
  %51 = load double*, double** %Anext, align 8, !dbg !182
  %52 = bitcast double* %51 to i8*, !dbg !182
  call void @free(i8* %52) #8, !dbg !183
  %53 = load double*, double** %A0, align 8, !dbg !184
  %54 = bitcast double* %53 to i8*, !dbg !184
  call void @free(i8* %54) #8, !dbg !185
  store i32 0, i32* %retval, align 4, !dbg !186
  br label %return, !dbg !186

return:                                           ; preds = %for.end49, %if.then
  %55 = load i32, i32* %retval, align 4, !dbg !187
  ret i32 %55, !dbg !187
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @getticks() #0 !dbg !188 {
entry:
  %a = alloca i32, align 4
  %d = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i32* %d, metadata !194, metadata !DIExpression()), !dbg !195
  %0 = call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !dbg !196, !srcloc !197
  %asmresult = extractvalue { i32, i32 } %0, 0, !dbg !196
  %asmresult1 = extractvalue { i32, i32 } %0, 1, !dbg !196
  store i32 %asmresult, i32* %a, align 4, !dbg !196
  store i32 %asmresult1, i32* %d, align 4, !dbg !196
  %1 = load i32, i32* %a, align 4, !dbg !198
  %conv = zext i32 %1 to i64, !dbg !199
  %2 = load i32, i32* %d, align 4, !dbg !200
  %conv2 = zext i32 %2 to i64, !dbg !201
  %shl = shl i64 %conv2, 32, !dbg !202
  %or = or i64 %conv, %shl, !dbg !203
  ret i64 %or, !dbg !204
}

declare dso_local i32 @sleep(i32) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @StencilProbe(double* %A00, double* %Anext0, i32 %nx, i32 %ny, i32 %nz, i32 %tx, i32 %ty, i32 %tz, i32 %timesteps) #0 !dbg !205 {
entry:
  %A00.addr = alloca double*, align 8
  %Anext0.addr = alloca double*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %tx.addr = alloca i32, align 4
  %ty.addr = alloca i32, align 4
  %tz.addr = alloca i32, align 4
  %timesteps.addr = alloca i32, align 4
  %minxyz = alloca double, align 8
  %fac = alloca double, align 8
  %temp_ptr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %t = alloca i32, align 4
  %fi_config = alloca %struct.Fault_Injector_ConfigsSt, align 8
  %timeNow = alloca i32, align 4
  %step = alloca i32, align 4
  %Anext = alloca double*, align 8
  %A0 = alloca double*, align 8
  %temp_A0 = alloca double*, align 8
  store double* %A00, double** %A00.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A00.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store double* %Anext0, double** %Anext0.addr, align 8
  call void @llvm.dbg.declare(metadata double** %Anext0.addr, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 %nz, i32* %nz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nz.addr, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 %tx, i32* %tx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tx.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 %ty, i32* %ty.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ty.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 %tz, i32* %tz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %tz.addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 %timesteps, i32* %timesteps.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %timesteps.addr, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata double* %minxyz, metadata !226, metadata !DIExpression()), !dbg !227
  %0 = load i32, i32* %nx.addr, align 4, !dbg !228
  %1 = load i32, i32* %nx.addr, align 4, !dbg !228
  %mul = mul nsw i32 %0, %1, !dbg !228
  %2 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub = sub nsw i32 %2, 1, !dbg !228
  %3 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub1 = sub nsw i32 %3, 1, !dbg !228
  %mul2 = mul nsw i32 %sub, %sub1, !dbg !228
  %div = sdiv i32 %mul, %mul2, !dbg !228
  %4 = load i32, i32* %ny.addr, align 4, !dbg !228
  %5 = load i32, i32* %ny.addr, align 4, !dbg !228
  %mul3 = mul nsw i32 %4, %5, !dbg !228
  %6 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub4 = sub nsw i32 %6, 1, !dbg !228
  %7 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub5 = sub nsw i32 %7, 1, !dbg !228
  %mul6 = mul nsw i32 %sub4, %sub5, !dbg !228
  %div7 = sdiv i32 %mul3, %mul6, !dbg !228
  %cmp = icmp slt i32 %div, %div7, !dbg !228
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !228

cond.true:                                        ; preds = %entry
  %8 = load i32, i32* %nx.addr, align 4, !dbg !228
  %9 = load i32, i32* %nx.addr, align 4, !dbg !228
  %mul8 = mul nsw i32 %8, %9, !dbg !228
  %10 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub9 = sub nsw i32 %10, 1, !dbg !228
  %11 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub10 = sub nsw i32 %11, 1, !dbg !228
  %mul11 = mul nsw i32 %sub9, %sub10, !dbg !228
  %div12 = sdiv i32 %mul8, %mul11, !dbg !228
  br label %cond.end, !dbg !228

cond.false:                                       ; preds = %entry
  %12 = load i32, i32* %ny.addr, align 4, !dbg !228
  %13 = load i32, i32* %ny.addr, align 4, !dbg !228
  %mul13 = mul nsw i32 %12, %13, !dbg !228
  %14 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub14 = sub nsw i32 %14, 1, !dbg !228
  %15 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub15 = sub nsw i32 %15, 1, !dbg !228
  %mul16 = mul nsw i32 %sub14, %sub15, !dbg !228
  %div17 = sdiv i32 %mul13, %mul16, !dbg !228
  br label %cond.end, !dbg !228

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %div12, %cond.true ], [ %div17, %cond.false ], !dbg !228
  %16 = load i32, i32* %nz.addr, align 4, !dbg !228
  %17 = load i32, i32* %nz.addr, align 4, !dbg !228
  %mul18 = mul nsw i32 %16, %17, !dbg !228
  %18 = load i32, i32* %nz.addr, align 4, !dbg !228
  %sub19 = sub nsw i32 %18, 1, !dbg !228
  %19 = load i32, i32* %nz.addr, align 4, !dbg !228
  %sub20 = sub nsw i32 %19, 1, !dbg !228
  %mul21 = mul nsw i32 %sub19, %sub20, !dbg !228
  %div22 = sdiv i32 %mul18, %mul21, !dbg !228
  %cmp23 = icmp slt i32 %cond, %div22, !dbg !228
  br i1 %cmp23, label %cond.true24, label %cond.false50, !dbg !228

cond.true24:                                      ; preds = %cond.end
  %20 = load i32, i32* %nx.addr, align 4, !dbg !228
  %21 = load i32, i32* %nx.addr, align 4, !dbg !228
  %mul25 = mul nsw i32 %20, %21, !dbg !228
  %22 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub26 = sub nsw i32 %22, 1, !dbg !228
  %23 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub27 = sub nsw i32 %23, 1, !dbg !228
  %mul28 = mul nsw i32 %sub26, %sub27, !dbg !228
  %div29 = sdiv i32 %mul25, %mul28, !dbg !228
  %24 = load i32, i32* %ny.addr, align 4, !dbg !228
  %25 = load i32, i32* %ny.addr, align 4, !dbg !228
  %mul30 = mul nsw i32 %24, %25, !dbg !228
  %26 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub31 = sub nsw i32 %26, 1, !dbg !228
  %27 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub32 = sub nsw i32 %27, 1, !dbg !228
  %mul33 = mul nsw i32 %sub31, %sub32, !dbg !228
  %div34 = sdiv i32 %mul30, %mul33, !dbg !228
  %cmp35 = icmp slt i32 %div29, %div34, !dbg !228
  br i1 %cmp35, label %cond.true36, label %cond.false42, !dbg !228

cond.true36:                                      ; preds = %cond.true24
  %28 = load i32, i32* %nx.addr, align 4, !dbg !228
  %29 = load i32, i32* %nx.addr, align 4, !dbg !228
  %mul37 = mul nsw i32 %28, %29, !dbg !228
  %30 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub38 = sub nsw i32 %30, 1, !dbg !228
  %31 = load i32, i32* %nx.addr, align 4, !dbg !228
  %sub39 = sub nsw i32 %31, 1, !dbg !228
  %mul40 = mul nsw i32 %sub38, %sub39, !dbg !228
  %div41 = sdiv i32 %mul37, %mul40, !dbg !228
  br label %cond.end48, !dbg !228

cond.false42:                                     ; preds = %cond.true24
  %32 = load i32, i32* %ny.addr, align 4, !dbg !228
  %33 = load i32, i32* %ny.addr, align 4, !dbg !228
  %mul43 = mul nsw i32 %32, %33, !dbg !228
  %34 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub44 = sub nsw i32 %34, 1, !dbg !228
  %35 = load i32, i32* %ny.addr, align 4, !dbg !228
  %sub45 = sub nsw i32 %35, 1, !dbg !228
  %mul46 = mul nsw i32 %sub44, %sub45, !dbg !228
  %div47 = sdiv i32 %mul43, %mul46, !dbg !228
  br label %cond.end48, !dbg !228

cond.end48:                                       ; preds = %cond.false42, %cond.true36
  %cond49 = phi i32 [ %div41, %cond.true36 ], [ %div47, %cond.false42 ], !dbg !228
  br label %cond.end56, !dbg !228

cond.false50:                                     ; preds = %cond.end
  %36 = load i32, i32* %nz.addr, align 4, !dbg !228
  %37 = load i32, i32* %nz.addr, align 4, !dbg !228
  %mul51 = mul nsw i32 %36, %37, !dbg !228
  %38 = load i32, i32* %nz.addr, align 4, !dbg !228
  %sub52 = sub nsw i32 %38, 1, !dbg !228
  %39 = load i32, i32* %nz.addr, align 4, !dbg !228
  %sub53 = sub nsw i32 %39, 1, !dbg !228
  %mul54 = mul nsw i32 %sub52, %sub53, !dbg !228
  %div55 = sdiv i32 %mul51, %mul54, !dbg !228
  br label %cond.end56, !dbg !228

cond.end56:                                       ; preds = %cond.false50, %cond.end48
  %cond57 = phi i32 [ %cond49, %cond.end48 ], [ %div55, %cond.false50 ], !dbg !228
  %conv = sitofp i32 %cond57 to double, !dbg !228
  store double %conv, double* %minxyz, align 8, !dbg !227
  call void @llvm.dbg.declare(metadata double* %fac, metadata !229, metadata !DIExpression()), !dbg !230
  %40 = load double, double* %minxyz, align 8, !dbg !231
  %mul58 = fmul double 6.250000e-02, %40, !dbg !232
  store double %mul58, double* %fac, align 8, !dbg !230
  call void @llvm.dbg.declare(metadata double** %temp_ptr, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %i, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %j, metadata !237, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata i32* %k, metadata !239, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata i32* %t, metadata !241, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.declare(metadata %struct.Fault_Injector_ConfigsSt* %fi_config, metadata !243, metadata !DIExpression()), !dbg !263
  call void @read_fault_injector_config(%struct.Fault_Injector_ConfigsSt* sret(%struct.Fault_Injector_ConfigsSt) align 8 %fi_config), !dbg !264
  call void @overwrite_sz_config(%struct.Fault_Injector_ConfigsSt* byval(%struct.Fault_Injector_ConfigsSt) align 8 %fi_config), !dbg !265
  %error_type = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %fi_config, i32 0, i32 6, !dbg !266
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %error_type, i64 0, i64 0, !dbg !267
  %error_bound_ch = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %fi_config, i32 0, i32 8, !dbg !268
  %arraydecay59 = getelementptr inbounds [32 x i8], [32 x i8]* %error_bound_ch, i64 0, i64 0, !dbg !269
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i8* %arraydecay, i8* %arraydecay59), !dbg !270
  %iters = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %fi_config, i32 0, i32 3, !dbg !271
  %41 = load i32, i32* %iters, align 4, !dbg !271
  store i32 %41, i32* %timesteps.addr, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata i32* %timeNow, metadata !273, metadata !DIExpression()), !dbg !274
  store i32 0, i32* %timeNow, align 4, !dbg !274
  call void @llvm.dbg.declare(metadata i32* %step, metadata !275, metadata !DIExpression()), !dbg !276
  %steps = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %fi_config, i32 0, i32 4, !dbg !277
  %42 = load i32, i32* %steps, align 8, !dbg !277
  store i32 %42, i32* %step, align 4, !dbg !276
  call void @llvm.dbg.declare(metadata double** %Anext, metadata !278, metadata !DIExpression()), !dbg !279
  call void @llvm.dbg.declare(metadata double** %A0, metadata !280, metadata !DIExpression()), !dbg !281
  %43 = load i32, i32* %nx.addr, align 4, !dbg !282
  %conv60 = sext i32 %43 to i64, !dbg !282
  %mul61 = mul i64 8, %conv60, !dbg !283
  %44 = load i32, i32* %ny.addr, align 4, !dbg !284
  %conv62 = sext i32 %44 to i64, !dbg !284
  %mul63 = mul i64 %mul61, %conv62, !dbg !285
  %45 = load i32, i32* %nz.addr, align 4, !dbg !286
  %conv64 = sext i32 %45 to i64, !dbg !286
  %mul65 = mul i64 %mul63, %conv64, !dbg !287
  %call66 = call noalias align 16 i8* @malloc(i64 %mul65) #8, !dbg !288
  %46 = bitcast i8* %call66 to double*, !dbg !289
  store double* %46, double** %Anext, align 8, !dbg !290
  %47 = load i32, i32* %nx.addr, align 4, !dbg !291
  %conv67 = sext i32 %47 to i64, !dbg !291
  %mul68 = mul i64 8, %conv67, !dbg !292
  %48 = load i32, i32* %ny.addr, align 4, !dbg !293
  %conv69 = sext i32 %48 to i64, !dbg !293
  %mul70 = mul i64 %mul68, %conv69, !dbg !294
  %49 = load i32, i32* %nz.addr, align 4, !dbg !295
  %conv71 = sext i32 %49 to i64, !dbg !295
  %mul72 = mul i64 %mul70, %conv71, !dbg !296
  %call73 = call noalias align 16 i8* @malloc(i64 %mul72) #8, !dbg !297
  %50 = bitcast i8* %call73 to double*, !dbg !298
  store double* %50, double** %A0, align 8, !dbg !299
  store i32 15, i32* %timeNow, align 4, !dbg !300
  br label %for.cond, !dbg !302

for.cond:                                         ; preds = %for.inc250, %cond.end56
  %51 = load i32, i32* %timeNow, align 4, !dbg !303
  %52 = load i32, i32* %timesteps.addr, align 4, !dbg !305
  %cmp74 = icmp sle i32 %51, %52, !dbg !306
  br i1 %cmp74, label %for.body, label %for.end253, !dbg !307

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !308
  br label %for.cond76, !dbg !311

for.cond76:                                       ; preds = %for.inc, %for.body
  %53 = load i32, i32* %i, align 4, !dbg !312
  %54 = load i32, i32* %nz.addr, align 4, !dbg !314
  %55 = load i32, i32* %nx.addr, align 4, !dbg !315
  %mul77 = mul nsw i32 %54, %55, !dbg !316
  %56 = load i32, i32* %ny.addr, align 4, !dbg !317
  %mul78 = mul nsw i32 %mul77, %56, !dbg !318
  %cmp79 = icmp slt i32 %53, %mul78, !dbg !319
  br i1 %cmp79, label %for.body81, label %for.end, !dbg !320

for.body81:                                       ; preds = %for.cond76
  %57 = load double*, double** %A00.addr, align 8, !dbg !321
  %58 = load i32, i32* %i, align 4, !dbg !323
  %idxprom = sext i32 %58 to i64, !dbg !321
  %arrayidx = getelementptr inbounds double, double* %57, i64 %idxprom, !dbg !321
  %59 = load double, double* %arrayidx, align 8, !dbg !321
  %60 = load double*, double** %A0, align 8, !dbg !324
  %61 = load i32, i32* %i, align 4, !dbg !325
  %idxprom82 = sext i32 %61 to i64, !dbg !324
  %arrayidx83 = getelementptr inbounds double, double* %60, i64 %idxprom82, !dbg !324
  store double %59, double* %arrayidx83, align 8, !dbg !326
  br label %for.inc, !dbg !327

for.inc:                                          ; preds = %for.body81
  %62 = load i32, i32* %i, align 4, !dbg !328
  %inc = add nsw i32 %62, 1, !dbg !328
  store i32 %inc, i32* %i, align 4, !dbg !328
  br label %for.cond76, !dbg !329, !llvm.loop !330

for.end:                                          ; preds = %for.cond76
  store i32 0, i32* %i, align 4, !dbg !332
  br label %for.cond84, !dbg !334

for.cond84:                                       ; preds = %for.inc94, %for.end
  %63 = load i32, i32* %i, align 4, !dbg !335
  %64 = load i32, i32* %nz.addr, align 4, !dbg !337
  %65 = load i32, i32* %nx.addr, align 4, !dbg !338
  %mul85 = mul nsw i32 %64, %65, !dbg !339
  %66 = load i32, i32* %ny.addr, align 4, !dbg !340
  %mul86 = mul nsw i32 %mul85, %66, !dbg !341
  %cmp87 = icmp slt i32 %63, %mul86, !dbg !342
  br i1 %cmp87, label %for.body89, label %for.end96, !dbg !343

for.body89:                                       ; preds = %for.cond84
  %67 = load double*, double** %Anext0.addr, align 8, !dbg !344
  %68 = load i32, i32* %i, align 4, !dbg !346
  %idxprom90 = sext i32 %68 to i64, !dbg !344
  %arrayidx91 = getelementptr inbounds double, double* %67, i64 %idxprom90, !dbg !344
  %69 = load double, double* %arrayidx91, align 8, !dbg !344
  %70 = load double*, double** %Anext, align 8, !dbg !347
  %71 = load i32, i32* %i, align 4, !dbg !348
  %idxprom92 = sext i32 %71 to i64, !dbg !347
  %arrayidx93 = getelementptr inbounds double, double* %70, i64 %idxprom92, !dbg !347
  store double %69, double* %arrayidx93, align 8, !dbg !349
  br label %for.inc94, !dbg !350

for.inc94:                                        ; preds = %for.body89
  %72 = load i32, i32* %i, align 4, !dbg !351
  %inc95 = add nsw i32 %72, 1, !dbg !351
  store i32 %inc95, i32* %i, align 4, !dbg !351
  br label %for.cond84, !dbg !352, !llvm.loop !353

for.end96:                                        ; preds = %for.cond84
  %73 = load i32, i32* %timeNow, align 4, !dbg !355
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1.5, i64 0, i64 0), i32 %73), !dbg !356
  store i32 0, i32* %t, align 4, !dbg !357
  br label %for.cond98, !dbg !359

for.cond98:                                       ; preds = %for.inc247, %for.end96
  %74 = load i32, i32* %t, align 4, !dbg !360
  %75 = load i32, i32* %timesteps.addr, align 4, !dbg !362
  %cmp99 = icmp sle i32 %74, %75, !dbg !363
  br i1 %cmp99, label %for.body101, label %for.end249, !dbg !364

for.body101:                                      ; preds = %for.cond98
  %76 = load i32, i32* %timeNow, align 4, !dbg !365
  %77 = load i32, i32* %t, align 4, !dbg !368
  %cmp102 = icmp eq i32 %76, %77, !dbg !369
  br i1 %cmp102, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %for.body101
  call void @llvm.dbg.declare(metadata double** %temp_A0, metadata !371, metadata !DIExpression()), !dbg !373
  %78 = load i32, i32* %nz.addr, align 4, !dbg !374
  %79 = load i32, i32* %nx.addr, align 4, !dbg !375
  %mul104 = mul nsw i32 %78, %79, !dbg !376
  %80 = load i32, i32* %ny.addr, align 4, !dbg !377
  %mul105 = mul nsw i32 %mul104, %80, !dbg !378
  %conv106 = sext i32 %mul105 to i64, !dbg !374
  %mul107 = mul i64 %conv106, 8, !dbg !379
  %call108 = call noalias align 16 i8* @malloc(i64 %mul107) #8, !dbg !380
  %81 = bitcast i8* %call108 to double*, !dbg !381
  store double* %81, double** %temp_A0, align 8, !dbg !373
  %82 = load i32, i32* %nz.addr, align 4, !dbg !382
  %83 = load i32, i32* %nx.addr, align 4, !dbg !383
  %mul109 = mul nsw i32 %82, %83, !dbg !384
  %84 = load i32, i32* %ny.addr, align 4, !dbg !385
  %mul110 = mul nsw i32 %mul109, %84, !dbg !386
  %85 = load double*, double** %A0, align 8, !dbg !387
  %call111 = call double* @SZ_fault_generator_1D(i32 %mul110, double* %85), !dbg !388
  store double* %call111, double** %temp_A0, align 8, !dbg !389
  store i32 0, i32* %i, align 4, !dbg !390
  br label %for.cond112, !dbg !392

for.cond112:                                      ; preds = %for.inc126, %if.then
  %86 = load i32, i32* %i, align 4, !dbg !393
  %87 = load i32, i32* %nz.addr, align 4, !dbg !395
  %88 = load i32, i32* %nx.addr, align 4, !dbg !396
  %mul113 = mul nsw i32 %87, %88, !dbg !397
  %89 = load i32, i32* %ny.addr, align 4, !dbg !398
  %mul114 = mul nsw i32 %mul113, %89, !dbg !399
  %cmp115 = icmp slt i32 %86, %mul114, !dbg !400
  br i1 %cmp115, label %for.body117, label %for.end128, !dbg !401

for.body117:                                      ; preds = %for.cond112
  %90 = load double*, double** %temp_A0, align 8, !dbg !402
  %91 = load i32, i32* %i, align 4, !dbg !404
  %idxprom118 = sext i32 %91 to i64, !dbg !402
  %arrayidx119 = getelementptr inbounds double, double* %90, i64 %idxprom118, !dbg !402
  %92 = load double, double* %arrayidx119, align 8, !dbg !402
  %93 = load double*, double** %A0, align 8, !dbg !405
  %94 = load i32, i32* %i, align 4, !dbg !406
  %idxprom120 = sext i32 %94 to i64, !dbg !405
  %arrayidx121 = getelementptr inbounds double, double* %93, i64 %idxprom120, !dbg !405
  store double %92, double* %arrayidx121, align 8, !dbg !407
  %95 = load double*, double** %temp_A0, align 8, !dbg !408
  %96 = load i32, i32* %i, align 4, !dbg !409
  %idxprom122 = sext i32 %96 to i64, !dbg !408
  %arrayidx123 = getelementptr inbounds double, double* %95, i64 %idxprom122, !dbg !408
  %97 = load double, double* %arrayidx123, align 8, !dbg !408
  %98 = load double*, double** %Anext, align 8, !dbg !410
  %99 = load i32, i32* %i, align 4, !dbg !411
  %idxprom124 = sext i32 %99 to i64, !dbg !410
  %arrayidx125 = getelementptr inbounds double, double* %98, i64 %idxprom124, !dbg !410
  store double %97, double* %arrayidx125, align 8, !dbg !412
  br label %for.inc126, !dbg !413

for.inc126:                                       ; preds = %for.body117
  %100 = load i32, i32* %i, align 4, !dbg !414
  %inc127 = add nsw i32 %100, 1, !dbg !414
  store i32 %inc127, i32* %i, align 4, !dbg !414
  br label %for.cond112, !dbg !415, !llvm.loop !416

for.end128:                                       ; preds = %for.cond112
  %101 = load double*, double** %temp_A0, align 8, !dbg !418
  %102 = bitcast double* %101 to i8*, !dbg !418
  call void @free(i8* %102) #8, !dbg !419
  br label %if.end, !dbg !420

if.end:                                           ; preds = %for.end128, %for.body101
  store i32 1, i32* %k, align 4, !dbg !421
  br label %for.cond129, !dbg !423

for.cond129:                                      ; preds = %for.inc210, %if.end
  %103 = load i32, i32* %k, align 4, !dbg !424
  %104 = load i32, i32* %nz.addr, align 4, !dbg !426
  %sub130 = sub nsw i32 %104, 1, !dbg !427
  %cmp131 = icmp slt i32 %103, %sub130, !dbg !428
  br i1 %cmp131, label %for.body133, label %for.end212, !dbg !429

for.body133:                                      ; preds = %for.cond129
  store i32 1, i32* %j, align 4, !dbg !430
  br label %for.cond134, !dbg !433

for.cond134:                                      ; preds = %for.inc207, %for.body133
  %105 = load i32, i32* %j, align 4, !dbg !434
  %106 = load i32, i32* %ny.addr, align 4, !dbg !436
  %sub135 = sub nsw i32 %106, 1, !dbg !437
  %cmp136 = icmp slt i32 %105, %sub135, !dbg !438
  br i1 %cmp136, label %for.body138, label %for.end209, !dbg !439

for.body138:                                      ; preds = %for.cond134
  store i32 1, i32* %i, align 4, !dbg !440
  br label %for.cond139, !dbg !443

for.cond139:                                      ; preds = %for.inc204, %for.body138
  %107 = load i32, i32* %i, align 4, !dbg !444
  %108 = load i32, i32* %nx.addr, align 4, !dbg !446
  %sub140 = sub nsw i32 %108, 1, !dbg !447
  %cmp141 = icmp slt i32 %107, %sub140, !dbg !448
  br i1 %cmp141, label %for.body143, label %for.end206, !dbg !449

for.body143:                                      ; preds = %for.cond139
  %109 = load double*, double** %A0, align 8, !dbg !450
  %110 = load i32, i32* %i, align 4, !dbg !452
  %111 = load i32, i32* %nx.addr, align 4, !dbg !452
  %112 = load i32, i32* %j, align 4, !dbg !452
  %113 = load i32, i32* %ny.addr, align 4, !dbg !452
  %114 = load i32, i32* %k, align 4, !dbg !452
  %mul144 = mul nsw i32 %113, %114, !dbg !452
  %add = add nsw i32 %112, %mul144, !dbg !452
  %mul145 = mul nsw i32 %111, %add, !dbg !452
  %add146 = add nsw i32 %110, %mul145, !dbg !452
  %idxprom147 = sext i32 %add146 to i64, !dbg !450
  %arrayidx148 = getelementptr inbounds double, double* %109, i64 %idxprom147, !dbg !450
  %115 = load double, double* %arrayidx148, align 8, !dbg !450
  %116 = load double*, double** %A0, align 8, !dbg !453
  %117 = load i32, i32* %i, align 4, !dbg !454
  %add149 = add nsw i32 %117, 1, !dbg !454
  %118 = load i32, i32* %nx.addr, align 4, !dbg !454
  %119 = load i32, i32* %j, align 4, !dbg !454
  %120 = load i32, i32* %ny.addr, align 4, !dbg !454
  %121 = load i32, i32* %k, align 4, !dbg !454
  %mul150 = mul nsw i32 %120, %121, !dbg !454
  %add151 = add nsw i32 %119, %mul150, !dbg !454
  %mul152 = mul nsw i32 %118, %add151, !dbg !454
  %add153 = add nsw i32 %add149, %mul152, !dbg !454
  %idxprom154 = sext i32 %add153 to i64, !dbg !453
  %arrayidx155 = getelementptr inbounds double, double* %116, i64 %idxprom154, !dbg !453
  %122 = load double, double* %arrayidx155, align 8, !dbg !453
  %add156 = fadd double %115, %122, !dbg !455
  %123 = load double*, double** %A0, align 8, !dbg !456
  %124 = load i32, i32* %i, align 4, !dbg !457
  %sub157 = sub nsw i32 %124, 1, !dbg !457
  %125 = load i32, i32* %nx.addr, align 4, !dbg !457
  %126 = load i32, i32* %j, align 4, !dbg !457
  %127 = load i32, i32* %ny.addr, align 4, !dbg !457
  %128 = load i32, i32* %k, align 4, !dbg !457
  %mul158 = mul nsw i32 %127, %128, !dbg !457
  %add159 = add nsw i32 %126, %mul158, !dbg !457
  %mul160 = mul nsw i32 %125, %add159, !dbg !457
  %add161 = add nsw i32 %sub157, %mul160, !dbg !457
  %idxprom162 = sext i32 %add161 to i64, !dbg !456
  %arrayidx163 = getelementptr inbounds double, double* %123, i64 %idxprom162, !dbg !456
  %129 = load double, double* %arrayidx163, align 8, !dbg !456
  %add164 = fadd double %add156, %129, !dbg !458
  %130 = load double*, double** %A0, align 8, !dbg !459
  %131 = load i32, i32* %i, align 4, !dbg !460
  %132 = load i32, i32* %nx.addr, align 4, !dbg !460
  %133 = load i32, i32* %j, align 4, !dbg !460
  %add165 = add nsw i32 %133, 1, !dbg !460
  %134 = load i32, i32* %ny.addr, align 4, !dbg !460
  %135 = load i32, i32* %k, align 4, !dbg !460
  %mul166 = mul nsw i32 %134, %135, !dbg !460
  %add167 = add nsw i32 %add165, %mul166, !dbg !460
  %mul168 = mul nsw i32 %132, %add167, !dbg !460
  %add169 = add nsw i32 %131, %mul168, !dbg !460
  %idxprom170 = sext i32 %add169 to i64, !dbg !459
  %arrayidx171 = getelementptr inbounds double, double* %130, i64 %idxprom170, !dbg !459
  %136 = load double, double* %arrayidx171, align 8, !dbg !459
  %add172 = fadd double %add164, %136, !dbg !461
  %137 = load double*, double** %A0, align 8, !dbg !462
  %138 = load i32, i32* %i, align 4, !dbg !463
  %139 = load i32, i32* %nx.addr, align 4, !dbg !463
  %140 = load i32, i32* %j, align 4, !dbg !463
  %sub173 = sub nsw i32 %140, 1, !dbg !463
  %141 = load i32, i32* %ny.addr, align 4, !dbg !463
  %142 = load i32, i32* %k, align 4, !dbg !463
  %mul174 = mul nsw i32 %141, %142, !dbg !463
  %add175 = add nsw i32 %sub173, %mul174, !dbg !463
  %mul176 = mul nsw i32 %139, %add175, !dbg !463
  %add177 = add nsw i32 %138, %mul176, !dbg !463
  %idxprom178 = sext i32 %add177 to i64, !dbg !462
  %arrayidx179 = getelementptr inbounds double, double* %137, i64 %idxprom178, !dbg !462
  %143 = load double, double* %arrayidx179, align 8, !dbg !462
  %add180 = fadd double %add172, %143, !dbg !464
  %144 = load double*, double** %A0, align 8, !dbg !465
  %145 = load i32, i32* %i, align 4, !dbg !466
  %146 = load i32, i32* %nx.addr, align 4, !dbg !466
  %147 = load i32, i32* %j, align 4, !dbg !466
  %148 = load i32, i32* %ny.addr, align 4, !dbg !466
  %149 = load i32, i32* %k, align 4, !dbg !466
  %add181 = add nsw i32 %149, 1, !dbg !466
  %mul182 = mul nsw i32 %148, %add181, !dbg !466
  %add183 = add nsw i32 %147, %mul182, !dbg !466
  %mul184 = mul nsw i32 %146, %add183, !dbg !466
  %add185 = add nsw i32 %145, %mul184, !dbg !466
  %idxprom186 = sext i32 %add185 to i64, !dbg !465
  %arrayidx187 = getelementptr inbounds double, double* %144, i64 %idxprom186, !dbg !465
  %150 = load double, double* %arrayidx187, align 8, !dbg !465
  %add188 = fadd double %add180, %150, !dbg !467
  %151 = load double*, double** %A0, align 8, !dbg !468
  %152 = load i32, i32* %i, align 4, !dbg !469
  %153 = load i32, i32* %nx.addr, align 4, !dbg !469
  %154 = load i32, i32* %j, align 4, !dbg !469
  %155 = load i32, i32* %ny.addr, align 4, !dbg !469
  %156 = load i32, i32* %k, align 4, !dbg !469
  %sub189 = sub nsw i32 %156, 1, !dbg !469
  %mul190 = mul nsw i32 %155, %sub189, !dbg !469
  %add191 = add nsw i32 %154, %mul190, !dbg !469
  %mul192 = mul nsw i32 %153, %add191, !dbg !469
  %add193 = add nsw i32 %152, %mul192, !dbg !469
  %idxprom194 = sext i32 %add193 to i64, !dbg !468
  %arrayidx195 = getelementptr inbounds double, double* %151, i64 %idxprom194, !dbg !468
  %157 = load double, double* %arrayidx195, align 8, !dbg !468
  %add196 = fadd double %add188, %157, !dbg !470
  %mul197 = fmul double 0x3FC2492492492492, %add196, !dbg !471
  %158 = load double*, double** %Anext, align 8, !dbg !472
  %159 = load i32, i32* %i, align 4, !dbg !473
  %160 = load i32, i32* %nx.addr, align 4, !dbg !473
  %161 = load i32, i32* %j, align 4, !dbg !473
  %162 = load i32, i32* %ny.addr, align 4, !dbg !473
  %163 = load i32, i32* %k, align 4, !dbg !473
  %mul198 = mul nsw i32 %162, %163, !dbg !473
  %add199 = add nsw i32 %161, %mul198, !dbg !473
  %mul200 = mul nsw i32 %160, %add199, !dbg !473
  %add201 = add nsw i32 %159, %mul200, !dbg !473
  %idxprom202 = sext i32 %add201 to i64, !dbg !472
  %arrayidx203 = getelementptr inbounds double, double* %158, i64 %idxprom202, !dbg !472
  store double %mul197, double* %arrayidx203, align 8, !dbg !474
  br label %for.inc204, !dbg !475

for.inc204:                                       ; preds = %for.body143
  %164 = load i32, i32* %i, align 4, !dbg !476
  %inc205 = add nsw i32 %164, 1, !dbg !476
  store i32 %inc205, i32* %i, align 4, !dbg !476
  br label %for.cond139, !dbg !477, !llvm.loop !478

for.end206:                                       ; preds = %for.cond139
  br label %for.inc207, !dbg !480

for.inc207:                                       ; preds = %for.end206
  %165 = load i32, i32* %j, align 4, !dbg !481
  %inc208 = add nsw i32 %165, 1, !dbg !481
  store i32 %inc208, i32* %j, align 4, !dbg !481
  br label %for.cond134, !dbg !482, !llvm.loop !483

for.end209:                                       ; preds = %for.cond134
  br label %for.inc210, !dbg !485

for.inc210:                                       ; preds = %for.end209
  %166 = load i32, i32* %k, align 4, !dbg !486
  %inc211 = add nsw i32 %166, 1, !dbg !486
  store i32 %inc211, i32* %k, align 4, !dbg !486
  br label %for.cond129, !dbg !487, !llvm.loop !488

for.end212:                                       ; preds = %for.cond129
  %167 = load double*, double** %A0, align 8, !dbg !490
  store double* %167, double** %temp_ptr, align 8, !dbg !491
  %168 = load double*, double** %Anext, align 8, !dbg !492
  store double* %168, double** %A0, align 8, !dbg !493
  %169 = load double*, double** %temp_ptr, align 8, !dbg !494
  store double* %169, double** %Anext, align 8, !dbg !495
  %170 = load i32, i32* %t, align 4, !dbg !496
  %rem = srem i32 %170, 10, !dbg !498
  %cmp213 = icmp eq i32 %rem, 0, !dbg !499
  br i1 %cmp213, label %if.then215, label %if.end246, !dbg !500

if.then215:                                       ; preds = %for.end212
  %171 = load i32, i32* %t, align 4, !dbg !501
  %call216 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2.6, i64 0, i64 0), i32 %171), !dbg !503
  store i32 0, i32* %k, align 4, !dbg !504
  br label %for.cond217, !dbg !506

for.cond217:                                      ; preds = %for.inc242, %if.then215
  %172 = load i32, i32* %k, align 4, !dbg !507
  %173 = load i32, i32* %nz.addr, align 4, !dbg !509
  %cmp218 = icmp slt i32 %172, %173, !dbg !510
  br i1 %cmp218, label %for.body220, label %for.end244, !dbg !511

for.body220:                                      ; preds = %for.cond217
  store i32 0, i32* %j, align 4, !dbg !512
  br label %for.cond221, !dbg !514

for.cond221:                                      ; preds = %for.inc239, %for.body220
  %174 = load i32, i32* %j, align 4, !dbg !515
  %175 = load i32, i32* %ny.addr, align 4, !dbg !517
  %cmp222 = icmp slt i32 %174, %175, !dbg !518
  br i1 %cmp222, label %for.body224, label %for.end241, !dbg !519

for.body224:                                      ; preds = %for.cond221
  store i32 0, i32* %i, align 4, !dbg !520
  br label %for.cond225, !dbg !522

for.cond225:                                      ; preds = %for.inc236, %for.body224
  %176 = load i32, i32* %i, align 4, !dbg !523
  %177 = load i32, i32* %nx.addr, align 4, !dbg !525
  %cmp226 = icmp slt i32 %176, %177, !dbg !526
  br i1 %cmp226, label %for.body228, label %for.end238, !dbg !527

for.body228:                                      ; preds = %for.cond225
  %178 = load double*, double** %A0, align 8, !dbg !528
  %179 = load i32, i32* %i, align 4, !dbg !529
  %180 = load i32, i32* %nx.addr, align 4, !dbg !529
  %181 = load i32, i32* %j, align 4, !dbg !529
  %182 = load i32, i32* %ny.addr, align 4, !dbg !529
  %183 = load i32, i32* %k, align 4, !dbg !529
  %mul229 = mul nsw i32 %182, %183, !dbg !529
  %add230 = add nsw i32 %181, %mul229, !dbg !529
  %mul231 = mul nsw i32 %180, %add230, !dbg !529
  %add232 = add nsw i32 %179, %mul231, !dbg !529
  %idxprom233 = sext i32 %add232 to i64, !dbg !528
  %arrayidx234 = getelementptr inbounds double, double* %178, i64 %idxprom233, !dbg !528
  %184 = load double, double* %arrayidx234, align 8, !dbg !528
  %call235 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3.7, i64 0, i64 0), double %184), !dbg !530
  br label %for.inc236, !dbg !530

for.inc236:                                       ; preds = %for.body228
  %185 = load i32, i32* %i, align 4, !dbg !531
  %inc237 = add nsw i32 %185, 1, !dbg !531
  store i32 %inc237, i32* %i, align 4, !dbg !531
  br label %for.cond225, !dbg !532, !llvm.loop !533

for.end238:                                       ; preds = %for.cond225
  br label %for.inc239, !dbg !534

for.inc239:                                       ; preds = %for.end238
  %186 = load i32, i32* %j, align 4, !dbg !535
  %inc240 = add nsw i32 %186, 1, !dbg !535
  store i32 %inc240, i32* %j, align 4, !dbg !535
  br label %for.cond221, !dbg !536, !llvm.loop !537

for.end241:                                       ; preds = %for.cond221
  br label %for.inc242, !dbg !538

for.inc242:                                       ; preds = %for.end241
  %187 = load i32, i32* %k, align 4, !dbg !539
  %inc243 = add nsw i32 %187, 1, !dbg !539
  store i32 %inc243, i32* %k, align 4, !dbg !539
  br label %for.cond217, !dbg !540, !llvm.loop !541

for.end244:                                       ; preds = %for.cond217
  %call245 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4.8, i64 0, i64 0)), !dbg !543
  br label %if.end246, !dbg !544

if.end246:                                        ; preds = %for.end244, %for.end212
  br label %for.inc247, !dbg !545

for.inc247:                                       ; preds = %if.end246
  %188 = load i32, i32* %t, align 4, !dbg !546
  %inc248 = add nsw i32 %188, 1, !dbg !546
  store i32 %inc248, i32* %t, align 4, !dbg !546
  br label %for.cond98, !dbg !547, !llvm.loop !548

for.end249:                                       ; preds = %for.cond98
  br label %for.inc250, !dbg !550

for.inc250:                                       ; preds = %for.end249
  %189 = load i32, i32* %timesteps.addr, align 4, !dbg !551
  %sub251 = sub nsw i32 %189, 15, !dbg !552
  %190 = load i32, i32* %timeNow, align 4, !dbg !553
  %add252 = add nsw i32 %190, %sub251, !dbg !553
  store i32 %add252, i32* %timeNow, align 4, !dbg !553
  br label %for.cond, !dbg !554, !llvm.loop !555

for.end253:                                       ; preds = %for.cond
  %191 = load double*, double** %Anext, align 8, !dbg !557
  %192 = bitcast double* %191 to i8*, !dbg !557
  call void @free(i8* %192) #8, !dbg !558
  %193 = load double*, double** %A0, align 8, !dbg !559
  %194 = bitcast double* %193 to i8*, !dbg !559
  call void @free(i8* %194) #8, !dbg !560
  ret void, !dbg !561
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @read_fault_injector_config(%struct.Fault_Injector_ConfigsSt* noalias sret(%struct.Fault_Injector_ConfigsSt) align 8 %agg.result) #0 !dbg !562 {
entry:
  %FIcfgFilePath = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %chunk = alloca [256 x i8], align 16
  %count_non_space_length = alloca i32, align 4
  %i = alloca i32, align 4
  %temp1 = alloca i8*, align 8
  %index = alloca i32, align 4
  %i30 = alloca i32, align 4
  %temp2 = alloca i8*, align 8
  %temp268 = alloca i8*, align 8
  %temp276 = alloca i8*, align 8
  %temp284 = alloca i8*, align 8
  %temp292 = alloca i8*, align 8
  %temp2100 = alloca i8*, align 8
  %temp2108 = alloca i8*, align 8
  %temp2122 = alloca i8*, align 8
  %temp2137 = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata %struct.Fault_Injector_ConfigsSt* %agg.result, metadata !565, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata i8** %FIcfgFilePath, metadata !567, metadata !DIExpression()), !dbg !570
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i8** %FIcfgFilePath, align 8, !dbg !571
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !572, metadata !DIExpression()), !dbg !632
  %0 = load i8*, i8** %FIcfgFilePath, align 8, !dbg !633
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !634
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !632
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !635
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !637
  br i1 %cmp, label %if.then, label %if.end, !dbg !638

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i64 0, i64 0)), !dbg !639
  call void @exit(i32 1) #9, !dbg !641
  unreachable, !dbg !641

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [256 x i8]* %chunk, metadata !642, metadata !DIExpression()), !dbg !646
  br label %while.cond, !dbg !647

while.cond:                                       ; preds = %if.end146, %if.end
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 0, !dbg !648
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !649
  %call2 = call i8* @fgets(i8* %arraydecay, i32 256, %struct._IO_FILE* %2), !dbg !650
  %cmp3 = icmp ne i8* %call2, null, !dbg !651
  br i1 %cmp3, label %while.body, label %while.end, !dbg !647

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 0, !dbg !652
  %3 = load i8, i8* %arrayidx, align 16, !dbg !652
  %conv = sext i8 %3 to i32, !dbg !652
  %cmp4 = icmp ne i32 %conv, 10, !dbg !655
  br i1 %cmp4, label %land.lhs.true, label %if.end146, !dbg !656

land.lhs.true:                                    ; preds = %while.body
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 0, !dbg !657
  %4 = load i8, i8* %arrayidx6, align 16, !dbg !657
  %conv7 = sext i8 %4 to i32, !dbg !657
  %cmp8 = icmp ne i32 %conv7, 35, !dbg !658
  br i1 %cmp8, label %if.then10, label %if.end146, !dbg !659

if.then10:                                        ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata i32* %count_non_space_length, metadata !660, metadata !DIExpression()), !dbg !662
  store i32 0, i32* %count_non_space_length, align 4, !dbg !662
  call void @llvm.dbg.declare(metadata i32* %i, metadata !663, metadata !DIExpression()), !dbg !665
  store i32 0, i32* %i, align 4, !dbg !665
  br label %for.cond, !dbg !666

for.cond:                                         ; preds = %for.inc, %if.then10
  %5 = load i32, i32* %i, align 4, !dbg !667
  %conv11 = sext i32 %5 to i64, !dbg !667
  %arraydecay12 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 0, !dbg !669
  %call13 = call i64 @strlen(i8* %arraydecay12) #7, !dbg !670
  %cmp14 = icmp ult i64 %conv11, %call13, !dbg !671
  br i1 %cmp14, label %for.body, label %for.end, !dbg !672

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !673
  %idxprom = sext i32 %6 to i64, !dbg !676
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 %idxprom, !dbg !676
  %7 = load i8, i8* %arrayidx16, align 1, !dbg !676
  %conv17 = sext i8 %7 to i32, !dbg !676
  %cmp18 = icmp ne i32 %conv17, 32, !dbg !677
  br i1 %cmp18, label %land.lhs.true20, label %if.end27, !dbg !678

land.lhs.true20:                                  ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !679
  %idxprom21 = sext i32 %8 to i64, !dbg !680
  %arrayidx22 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 %idxprom21, !dbg !680
  %9 = load i8, i8* %arrayidx22, align 1, !dbg !680
  %conv23 = sext i8 %9 to i32, !dbg !680
  %cmp24 = icmp ne i32 %conv23, 10, !dbg !681
  br i1 %cmp24, label %if.then26, label %if.end27, !dbg !682

if.then26:                                        ; preds = %land.lhs.true20
  %10 = load i32, i32* %count_non_space_length, align 4, !dbg !683
  %inc = add nsw i32 %10, 1, !dbg !683
  store i32 %inc, i32* %count_non_space_length, align 4, !dbg !683
  br label %if.end27, !dbg !684

if.end27:                                         ; preds = %if.then26, %land.lhs.true20, %for.body
  br label %for.inc, !dbg !685

for.inc:                                          ; preds = %if.end27
  %11 = load i32, i32* %i, align 4, !dbg !686
  %inc28 = add nsw i32 %11, 1, !dbg !686
  store i32 %inc28, i32* %i, align 4, !dbg !686
  br label %for.cond, !dbg !687, !llvm.loop !688

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8** %temp1, metadata !690, metadata !DIExpression()), !dbg !691
  %call29 = call noalias align 16 i8* @malloc(i64 256) #8, !dbg !692
  store i8* %call29, i8** %temp1, align 8, !dbg !691
  call void @llvm.dbg.declare(metadata i32* %index, metadata !693, metadata !DIExpression()), !dbg !694
  store i32 0, i32* %index, align 4, !dbg !694
  call void @llvm.dbg.declare(metadata i32* %i30, metadata !695, metadata !DIExpression()), !dbg !697
  store i32 0, i32* %i30, align 4, !dbg !697
  br label %for.cond31, !dbg !698

for.cond31:                                       ; preds = %for.inc55, %for.end
  %12 = load i32, i32* %i30, align 4, !dbg !699
  %conv32 = sext i32 %12 to i64, !dbg !699
  %arraydecay33 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 0, !dbg !701
  %call34 = call i64 @strlen(i8* %arraydecay33) #7, !dbg !702
  %cmp35 = icmp ult i64 %conv32, %call34, !dbg !703
  br i1 %cmp35, label %for.body37, label %for.end57, !dbg !704

for.body37:                                       ; preds = %for.cond31
  %13 = load i32, i32* %i30, align 4, !dbg !705
  %idxprom38 = sext i32 %13 to i64, !dbg !708
  %arrayidx39 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 %idxprom38, !dbg !708
  %14 = load i8, i8* %arrayidx39, align 1, !dbg !708
  %conv40 = sext i8 %14 to i32, !dbg !708
  %cmp41 = icmp eq i32 %conv40, 32, !dbg !709
  br i1 %cmp41, label %if.then48, label %lor.lhs.false, !dbg !710

lor.lhs.false:                                    ; preds = %for.body37
  %15 = load i32, i32* %i30, align 4, !dbg !711
  %idxprom43 = sext i32 %15 to i64, !dbg !712
  %arrayidx44 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 %idxprom43, !dbg !712
  %16 = load i8, i8* %arrayidx44, align 1, !dbg !712
  %conv45 = sext i8 %16 to i32, !dbg !712
  %cmp46 = icmp eq i32 %conv45, 10, !dbg !713
  br i1 %cmp46, label %if.then48, label %if.end49, !dbg !714

if.then48:                                        ; preds = %lor.lhs.false, %for.body37
  br label %for.inc55, !dbg !715

if.end49:                                         ; preds = %lor.lhs.false
  %17 = load i32, i32* %i30, align 4, !dbg !716
  %idxprom50 = sext i32 %17 to i64, !dbg !717
  %arrayidx51 = getelementptr inbounds [256 x i8], [256 x i8]* %chunk, i64 0, i64 %idxprom50, !dbg !717
  %18 = load i8, i8* %arrayidx51, align 1, !dbg !717
  %19 = load i8*, i8** %temp1, align 8, !dbg !718
  %20 = load i32, i32* %index, align 4, !dbg !719
  %idxprom52 = sext i32 %20 to i64, !dbg !718
  %arrayidx53 = getelementptr inbounds i8, i8* %19, i64 %idxprom52, !dbg !718
  store i8 %18, i8* %arrayidx53, align 1, !dbg !720
  %21 = load i32, i32* %index, align 4, !dbg !721
  %inc54 = add nsw i32 %21, 1, !dbg !721
  store i32 %inc54, i32* %index, align 4, !dbg !721
  br label %for.inc55, !dbg !722

for.inc55:                                        ; preds = %if.end49, %if.then48
  %22 = load i32, i32* %i30, align 4, !dbg !723
  %inc56 = add nsw i32 %22, 1, !dbg !723
  store i32 %inc56, i32* %i30, align 4, !dbg !723
  br label %for.cond31, !dbg !724, !llvm.loop !725

for.end57:                                        ; preds = %for.cond31
  %23 = load i8*, i8** %temp1, align 8, !dbg !727
  %24 = load i32, i32* %index, align 4, !dbg !728
  %idxprom58 = sext i32 %24 to i64, !dbg !727
  %arrayidx59 = getelementptr inbounds i8, i8* %23, i64 %idxprom58, !dbg !727
  store i8 0, i8* %arrayidx59, align 1, !dbg !729
  %25 = load i8*, i8** %temp1, align 8, !dbg !730
  %call60 = call i8* @strstr(i8* %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #7, !dbg !732
  %tobool = icmp ne i8* %call60, null, !dbg !732
  br i1 %tobool, label %if.then61, label %if.end64, !dbg !733

if.then61:                                        ; preds = %for.end57
  call void @llvm.dbg.declare(metadata i8** %temp2, metadata !734, metadata !DIExpression()), !dbg !736
  %26 = load i8*, i8** %temp1, align 8, !dbg !737
  %call62 = call i8* @strstr(i8* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !738
  store i8* %call62, i8** %temp2, align 8, !dbg !736
  %27 = load i8*, i8** %temp2, align 8, !dbg !739
  %incdec.ptr = getelementptr inbounds i8, i8* %27, i32 1, !dbg !739
  store i8* %incdec.ptr, i8** %temp2, align 8, !dbg !739
  %28 = load i8*, i8** %temp2, align 8, !dbg !740
  %call63 = call i32 @atoi(i8* %28) #7, !dbg !741
  %x = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 0, !dbg !742
  store i32 %call63, i32* %x, align 8, !dbg !743
  br label %if.end64, !dbg !744

if.end64:                                         ; preds = %if.then61, %for.end57
  %29 = load i8*, i8** %temp1, align 8, !dbg !745
  %call65 = call i8* @strstr(i8* %29, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0)) #7, !dbg !747
  %tobool66 = icmp ne i8* %call65, null, !dbg !747
  br i1 %tobool66, label %if.then67, label %if.end72, !dbg !748

if.then67:                                        ; preds = %if.end64
  call void @llvm.dbg.declare(metadata i8** %temp268, metadata !749, metadata !DIExpression()), !dbg !751
  %30 = load i8*, i8** %temp1, align 8, !dbg !752
  %call69 = call i8* @strstr(i8* %30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !753
  store i8* %call69, i8** %temp268, align 8, !dbg !751
  %31 = load i8*, i8** %temp268, align 8, !dbg !754
  %incdec.ptr70 = getelementptr inbounds i8, i8* %31, i32 1, !dbg !754
  store i8* %incdec.ptr70, i8** %temp268, align 8, !dbg !754
  %32 = load i8*, i8** %temp268, align 8, !dbg !755
  %call71 = call i32 @atoi(i8* %32) #7, !dbg !756
  %y = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 1, !dbg !757
  store i32 %call71, i32* %y, align 4, !dbg !758
  br label %if.end72, !dbg !759

if.end72:                                         ; preds = %if.then67, %if.end64
  %33 = load i8*, i8** %temp1, align 8, !dbg !760
  %call73 = call i8* @strstr(i8* %33, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i64 0, i64 0)) #7, !dbg !762
  %tobool74 = icmp ne i8* %call73, null, !dbg !762
  br i1 %tobool74, label %if.then75, label %if.end80, !dbg !763

if.then75:                                        ; preds = %if.end72
  call void @llvm.dbg.declare(metadata i8** %temp276, metadata !764, metadata !DIExpression()), !dbg !766
  %34 = load i8*, i8** %temp1, align 8, !dbg !767
  %call77 = call i8* @strstr(i8* %34, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !768
  store i8* %call77, i8** %temp276, align 8, !dbg !766
  %35 = load i8*, i8** %temp276, align 8, !dbg !769
  %incdec.ptr78 = getelementptr inbounds i8, i8* %35, i32 1, !dbg !769
  store i8* %incdec.ptr78, i8** %temp276, align 8, !dbg !769
  %36 = load i8*, i8** %temp276, align 8, !dbg !770
  %call79 = call i32 @atoi(i8* %36) #7, !dbg !771
  %z = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 2, !dbg !772
  store i32 %call79, i32* %z, align 8, !dbg !773
  br label %if.end80, !dbg !774

if.end80:                                         ; preds = %if.then75, %if.end72
  %37 = load i8*, i8** %temp1, align 8, !dbg !775
  %call81 = call i8* @strstr(i8* %37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0)) #7, !dbg !777
  %tobool82 = icmp ne i8* %call81, null, !dbg !777
  br i1 %tobool82, label %if.then83, label %if.end88, !dbg !778

if.then83:                                        ; preds = %if.end80
  call void @llvm.dbg.declare(metadata i8** %temp284, metadata !779, metadata !DIExpression()), !dbg !781
  %38 = load i8*, i8** %temp1, align 8, !dbg !782
  %call85 = call i8* @strstr(i8* %38, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !783
  store i8* %call85, i8** %temp284, align 8, !dbg !781
  %39 = load i8*, i8** %temp284, align 8, !dbg !784
  %incdec.ptr86 = getelementptr inbounds i8, i8* %39, i32 1, !dbg !784
  store i8* %incdec.ptr86, i8** %temp284, align 8, !dbg !784
  %40 = load i8*, i8** %temp284, align 8, !dbg !785
  %call87 = call i32 @atoi(i8* %40) #7, !dbg !786
  %iters = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 3, !dbg !787
  store i32 %call87, i32* %iters, align 4, !dbg !788
  br label %if.end88, !dbg !789

if.end88:                                         ; preds = %if.then83, %if.end80
  %41 = load i8*, i8** %temp1, align 8, !dbg !790
  %call89 = call i8* @strstr(i8* %41, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0)) #7, !dbg !792
  %tobool90 = icmp ne i8* %call89, null, !dbg !792
  br i1 %tobool90, label %if.then91, label %if.end96, !dbg !793

if.then91:                                        ; preds = %if.end88
  call void @llvm.dbg.declare(metadata i8** %temp292, metadata !794, metadata !DIExpression()), !dbg !796
  %42 = load i8*, i8** %temp1, align 8, !dbg !797
  %call93 = call i8* @strstr(i8* %42, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !798
  store i8* %call93, i8** %temp292, align 8, !dbg !796
  %43 = load i8*, i8** %temp292, align 8, !dbg !799
  %incdec.ptr94 = getelementptr inbounds i8, i8* %43, i32 1, !dbg !799
  store i8* %incdec.ptr94, i8** %temp292, align 8, !dbg !799
  %44 = load i8*, i8** %temp292, align 8, !dbg !800
  %call95 = call i32 @atoi(i8* %44) #7, !dbg !801
  %steps = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 4, !dbg !802
  store i32 %call95, i32* %steps, align 8, !dbg !803
  br label %if.end96, !dbg !804

if.end96:                                         ; preds = %if.then91, %if.end88
  %45 = load i8*, i8** %temp1, align 8, !dbg !805
  %call97 = call i8* @strstr(i8* %45, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.14, i64 0, i64 0)) #7, !dbg !807
  %tobool98 = icmp ne i8* %call97, null, !dbg !807
  br i1 %tobool98, label %if.then99, label %if.end104, !dbg !808

if.then99:                                        ; preds = %if.end96
  call void @llvm.dbg.declare(metadata i8** %temp2100, metadata !809, metadata !DIExpression()), !dbg !811
  %46 = load i8*, i8** %temp1, align 8, !dbg !812
  %call101 = call i8* @strstr(i8* %46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !813
  store i8* %call101, i8** %temp2100, align 8, !dbg !811
  %47 = load i8*, i8** %temp2100, align 8, !dbg !814
  %incdec.ptr102 = getelementptr inbounds i8, i8* %47, i32 1, !dbg !814
  store i8* %incdec.ptr102, i8** %temp2100, align 8, !dbg !814
  %48 = load i8*, i8** %temp2100, align 8, !dbg !815
  %call103 = call i32 @atoi(i8* %48) #7, !dbg !816
  %compressor = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 5, !dbg !817
  store i32 %call103, i32* %compressor, align 4, !dbg !818
  br label %if.end104, !dbg !819

if.end104:                                        ; preds = %if.then99, %if.end96
  %49 = load i8*, i8** %temp1, align 8, !dbg !820
  %call105 = call i8* @strstr(i8* %49, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i64 0, i64 0)) #7, !dbg !822
  %tobool106 = icmp ne i8* %call105, null, !dbg !822
  br i1 %tobool106, label %if.then107, label %if.end113, !dbg !823

if.then107:                                       ; preds = %if.end104
  call void @llvm.dbg.declare(metadata i8** %temp2108, metadata !824, metadata !DIExpression()), !dbg !826
  %50 = load i8*, i8** %temp1, align 8, !dbg !827
  %call109 = call i8* @strstr(i8* %50, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !828
  store i8* %call109, i8** %temp2108, align 8, !dbg !826
  %51 = load i8*, i8** %temp2108, align 8, !dbg !829
  %incdec.ptr110 = getelementptr inbounds i8, i8* %51, i32 1, !dbg !829
  store i8* %incdec.ptr110, i8** %temp2108, align 8, !dbg !829
  %error_type = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 6, !dbg !830
  %arraydecay111 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type, i64 0, i64 0, !dbg !831
  %52 = load i8*, i8** %temp2108, align 8, !dbg !832
  %call112 = call i8* @strcpy(i8* %arraydecay111, i8* %52) #8, !dbg !833
  br label %if.end113, !dbg !834

if.end113:                                        ; preds = %if.then107, %if.end104
  %error_type114 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 6, !dbg !835
  %arraydecay115 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type114, i64 0, i64 0, !dbg !837
  %call116 = call i8* @strstr(i8* %arraydecay115, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)) #7, !dbg !838
  %tobool117 = icmp ne i8* %call116, null, !dbg !838
  br i1 %tobool117, label %land.lhs.true118, label %if.end128, !dbg !839

land.lhs.true118:                                 ; preds = %if.end113
  %53 = load i8*, i8** %temp1, align 8, !dbg !840
  %call119 = call i8* @strstr(i8* %53, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.17, i64 0, i64 0)) #7, !dbg !841
  %tobool120 = icmp ne i8* %call119, null, !dbg !841
  br i1 %tobool120, label %if.then121, label %if.end128, !dbg !842

if.then121:                                       ; preds = %land.lhs.true118
  call void @llvm.dbg.declare(metadata i8** %temp2122, metadata !843, metadata !DIExpression()), !dbg !845
  %54 = load i8*, i8** %temp1, align 8, !dbg !846
  %call123 = call i8* @strstr(i8* %54, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !847
  store i8* %call123, i8** %temp2122, align 8, !dbg !845
  %55 = load i8*, i8** %temp2122, align 8, !dbg !848
  %incdec.ptr124 = getelementptr inbounds i8, i8* %55, i32 1, !dbg !848
  store i8* %incdec.ptr124, i8** %temp2122, align 8, !dbg !848
  %56 = load i8*, i8** %temp2122, align 8, !dbg !849
  %call125 = call double @atof(i8* %56) #7, !dbg !850
  %error_bound = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 7, !dbg !851
  store double %call125, double* %error_bound, align 8, !dbg !852
  %error_bound_ch = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 8, !dbg !853
  %arraydecay126 = getelementptr inbounds [32 x i8], [32 x i8]* %error_bound_ch, i64 0, i64 0, !dbg !854
  %57 = load i8*, i8** %temp2122, align 8, !dbg !855
  %call127 = call i8* @strcpy(i8* %arraydecay126, i8* %57) #8, !dbg !856
  br label %if.end128, !dbg !857

if.end128:                                        ; preds = %if.then121, %land.lhs.true118, %if.end113
  %error_type129 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 6, !dbg !858
  %arraydecay130 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type129, i64 0, i64 0, !dbg !860
  %call131 = call i8* @strstr(i8* %arraydecay130, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0)) #7, !dbg !861
  %tobool132 = icmp ne i8* %call131, null, !dbg !861
  br i1 %tobool132, label %land.lhs.true133, label %if.end145, !dbg !862

land.lhs.true133:                                 ; preds = %if.end128
  %58 = load i8*, i8** %temp1, align 8, !dbg !863
  %call134 = call i8* @strstr(i8* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.19, i64 0, i64 0)) #7, !dbg !864
  %tobool135 = icmp ne i8* %call134, null, !dbg !864
  br i1 %tobool135, label %if.then136, label %if.end145, !dbg !865

if.then136:                                       ; preds = %land.lhs.true133
  call void @llvm.dbg.declare(metadata i8** %temp2137, metadata !866, metadata !DIExpression()), !dbg !868
  %59 = load i8*, i8** %temp1, align 8, !dbg !869
  %call138 = call i8* @strstr(i8* %59, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0)) #7, !dbg !870
  store i8* %call138, i8** %temp2137, align 8, !dbg !868
  %60 = load i8*, i8** %temp2137, align 8, !dbg !871
  %incdec.ptr139 = getelementptr inbounds i8, i8* %60, i32 1, !dbg !871
  store i8* %incdec.ptr139, i8** %temp2137, align 8, !dbg !871
  %61 = load i8*, i8** %temp2137, align 8, !dbg !872
  %call140 = call double @atof(i8* %61) #7, !dbg !873
  %error_bound141 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 7, !dbg !874
  store double %call140, double* %error_bound141, align 8, !dbg !875
  %error_bound_ch142 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %agg.result, i32 0, i32 8, !dbg !876
  %arraydecay143 = getelementptr inbounds [32 x i8], [32 x i8]* %error_bound_ch142, i64 0, i64 0, !dbg !877
  %62 = load i8*, i8** %temp2137, align 8, !dbg !878
  %call144 = call i8* @strcpy(i8* %arraydecay143, i8* %62) #8, !dbg !879
  br label %if.end145, !dbg !880

if.end145:                                        ; preds = %if.then136, %land.lhs.true133, %if.end128
  %63 = load i8*, i8** %temp1, align 8, !dbg !881
  call void @free(i8* %63) #8, !dbg !882
  br label %if.end146, !dbg !883

if.end146:                                        ; preds = %if.end145, %land.lhs.true, %while.body
  br label %while.cond, !dbg !647, !llvm.loop !884

while.end:                                        ; preds = %while.cond
  %64 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !886
  %call147 = call i32 @fclose(%struct._IO_FILE* %64), !dbg !887
  ret void, !dbg !888
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @overwrite_sz_config(%struct.Fault_Injector_ConfigsSt* byval(%struct.Fault_Injector_ConfigsSt) align 8 %config) #0 !dbg !889 {
entry:
  %fPtr = alloca %struct._IO_FILE*, align 8
  %fTemp = alloca %struct._IO_FILE*, align 8
  %SZFIcfgFilePath = alloca i8*, align 8
  %buffer = alloca [256 x i8], align 16
  %temp_buffer = alloca [40 x i8], align 16
  %temp_buffer71 = alloca [40 x i8], align 16
  call void @llvm.dbg.declare(metadata %struct.Fault_Injector_ConfigsSt* %config, metadata !892, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fPtr, metadata !894, metadata !DIExpression()), !dbg !895
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fTemp, metadata !896, metadata !DIExpression()), !dbg !897
  call void @llvm.dbg.declare(metadata i8** %SZFIcfgFilePath, metadata !898, metadata !DIExpression()), !dbg !899
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.20, i64 0, i64 0), i8** %SZFIcfgFilePath, align 8, !dbg !900
  call void @llvm.dbg.declare(metadata [256 x i8]* %buffer, metadata !901, metadata !DIExpression()), !dbg !902
  %0 = load i8*, i8** %SZFIcfgFilePath, align 8, !dbg !903
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0)), !dbg !904
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fPtr, align 8, !dbg !905
  %call1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i64 0, i64 0)), !dbg !906
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fTemp, align 8, !dbg !907
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fPtr, align 8, !dbg !908
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !910
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !911

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !912
  %cmp2 = icmp eq %struct._IO_FILE* %2, null, !dbg !913
  br i1 %cmp2, label %if.then, label %if.end, !dbg !914

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.23, i64 0, i64 0)), !dbg !915
  call void @exit(i32 1) #9, !dbg !917
  unreachable, !dbg !917

if.end:                                           ; preds = %lor.lhs.false
  br label %while.cond, !dbg !918

while.cond:                                       ; preds = %if.end90, %if.end
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !919
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fPtr, align 8, !dbg !920
  %call4 = call i8* @fgets(i8* %arraydecay, i32 256, %struct._IO_FILE* %3), !dbg !921
  %cmp5 = icmp ne i8* %call4, null, !dbg !922
  br i1 %cmp5, label %while.body, label %while.end, !dbg !918

while.body:                                       ; preds = %while.cond
  %arraydecay6 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !923
  %call7 = call i8* @strstr(i8* %arraydecay6, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.24, i64 0, i64 0)) #7, !dbg !926
  %tobool = icmp ne i8* %call7, null, !dbg !926
  br i1 %tobool, label %land.lhs.true, label %if.else24, !dbg !927

land.lhs.true:                                    ; preds = %while.body
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !928
  %4 = load i8, i8* %arrayidx, align 16, !dbg !928
  %conv = sext i8 %4 to i32, !dbg !928
  %cmp8 = icmp ne i32 %conv, 35, !dbg !929
  br i1 %cmp8, label %if.then10, label %if.else24, !dbg !930

if.then10:                                        ; preds = %land.lhs.true
  %error_type = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 6, !dbg !931
  %arraydecay11 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type, i64 0, i64 0, !dbg !934
  %call12 = call i8* @strstr(i8* %arraydecay11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)) #7, !dbg !935
  %tobool13 = icmp ne i8* %call12, null, !dbg !935
  br i1 %tobool13, label %if.then14, label %if.else, !dbg !936

if.then14:                                        ; preds = %if.then10
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !937
  %call15 = call i32 @fputs(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), %struct._IO_FILE* %5), !dbg !939
  br label %if.end23, !dbg !940

if.else:                                          ; preds = %if.then10
  %error_type16 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 6, !dbg !941
  %arraydecay17 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type16, i64 0, i64 0, !dbg !943
  %call18 = call i8* @strstr(i8* %arraydecay17, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0)) #7, !dbg !944
  %tobool19 = icmp ne i8* %call18, null, !dbg !944
  br i1 %tobool19, label %if.then20, label %if.end22, !dbg !945

if.then20:                                        ; preds = %if.else
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !946
  %call21 = call i32 @fputs(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.26, i64 0, i64 0), %struct._IO_FILE* %6), !dbg !948
  br label %if.end22, !dbg !949

if.end22:                                         ; preds = %if.then20, %if.else
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then14
  br label %if.end90, !dbg !950

if.else24:                                        ; preds = %land.lhs.true, %while.body
  %arraydecay25 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !951
  %call26 = call i8* @strstr(i8* %arraydecay25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i64 0, i64 0)) #7, !dbg !953
  %tobool27 = icmp ne i8* %call26, null, !dbg !953
  br i1 %tobool27, label %land.lhs.true28, label %if.else51, !dbg !954

land.lhs.true28:                                  ; preds = %if.else24
  %arrayidx29 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !955
  %7 = load i8, i8* %arrayidx29, align 16, !dbg !955
  %conv30 = sext i8 %7 to i32, !dbg !955
  %cmp31 = icmp ne i32 %conv30, 35, !dbg !956
  br i1 %cmp31, label %if.then33, label %if.else51, !dbg !957

if.then33:                                        ; preds = %land.lhs.true28
  %error_type34 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 6, !dbg !958
  %arraydecay35 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type34, i64 0, i64 0, !dbg !961
  %call36 = call i8* @strstr(i8* %arraydecay35, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i64 0, i64 0)) #7, !dbg !962
  %tobool37 = icmp ne i8* %call36, null, !dbg !962
  br i1 %tobool37, label %if.then38, label %if.else47, !dbg !963

if.then38:                                        ; preds = %if.then33
  call void @llvm.dbg.declare(metadata [40 x i8]* %temp_buffer, metadata !964, metadata !DIExpression()), !dbg !969
  %8 = bitcast [40 x i8]* %temp_buffer to i8*, !dbg !969
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 getelementptr inbounds ([40 x i8], [40 x i8]* @__const.overwrite_sz_config.temp_buffer, i32 0, i32 0), i64 40, i1 false), !dbg !969
  %arraydecay39 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer, i64 0, i64 0, !dbg !970
  %error_bound_ch = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 8, !dbg !971
  %arraydecay40 = getelementptr inbounds [32 x i8], [32 x i8]* %error_bound_ch, i64 0, i64 0, !dbg !972
  %call41 = call i8* @strcat(i8* %arraydecay39, i8* %arraydecay40) #8, !dbg !973
  %arraydecay42 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer, i64 0, i64 0, !dbg !974
  %call43 = call i64 @strlen(i8* %arraydecay42) #7, !dbg !975
  %arrayidx44 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer, i64 0, i64 %call43, !dbg !976
  store i8 10, i8* %arrayidx44, align 1, !dbg !977
  %arraydecay45 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer, i64 0, i64 0, !dbg !978
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !979
  %call46 = call i32 @fputs(i8* %arraydecay45, %struct._IO_FILE* %9), !dbg !980
  br label %if.end50, !dbg !981

if.else47:                                        ; preds = %if.then33
  %arraydecay48 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !982
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !984
  %call49 = call i32 @fputs(i8* %arraydecay48, %struct._IO_FILE* %10), !dbg !985
  br label %if.end50

if.end50:                                         ; preds = %if.else47, %if.then38
  br label %if.end89, !dbg !986

if.else51:                                        ; preds = %land.lhs.true28, %if.else24
  %arraydecay52 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !987
  %call53 = call i8* @strstr(i8* %arraydecay52, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.28, i64 0, i64 0)) #7, !dbg !989
  %tobool54 = icmp ne i8* %call53, null, !dbg !989
  br i1 %tobool54, label %land.lhs.true55, label %if.else85, !dbg !990

land.lhs.true55:                                  ; preds = %if.else51
  %arrayidx56 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !991
  %11 = load i8, i8* %arrayidx56, align 16, !dbg !991
  %conv57 = sext i8 %11 to i32, !dbg !991
  %cmp58 = icmp ne i32 %conv57, 35, !dbg !992
  br i1 %cmp58, label %land.lhs.true60, label %if.else85, !dbg !993

land.lhs.true60:                                  ; preds = %land.lhs.true55
  %arrayidx61 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !994
  %12 = load i8, i8* %arrayidx61, align 16, !dbg !994
  %conv62 = sext i8 %12 to i32, !dbg !994
  %cmp63 = icmp ne i32 %conv62, 112, !dbg !995
  br i1 %cmp63, label %if.then65, label %if.else85, !dbg !996

if.then65:                                        ; preds = %land.lhs.true60
  %error_type66 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 6, !dbg !997
  %arraydecay67 = getelementptr inbounds [10 x i8], [10 x i8]* %error_type66, i64 0, i64 0, !dbg !1000
  %call68 = call i8* @strstr(i8* %arraydecay67, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i64 0, i64 0)) #7, !dbg !1001
  %tobool69 = icmp ne i8* %call68, null, !dbg !1001
  br i1 %tobool69, label %if.then70, label %if.else81, !dbg !1002

if.then70:                                        ; preds = %if.then65
  call void @llvm.dbg.declare(metadata [40 x i8]* %temp_buffer71, metadata !1003, metadata !DIExpression()), !dbg !1005
  %13 = bitcast [40 x i8]* %temp_buffer71 to i8*, !dbg !1005
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %13, i8* align 16 getelementptr inbounds ([40 x i8], [40 x i8]* @__const.overwrite_sz_config.temp_buffer.29, i32 0, i32 0), i64 40, i1 false), !dbg !1005
  %arraydecay72 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer71, i64 0, i64 0, !dbg !1006
  %error_bound_ch73 = getelementptr inbounds %struct.Fault_Injector_ConfigsSt, %struct.Fault_Injector_ConfigsSt* %config, i32 0, i32 8, !dbg !1007
  %arraydecay74 = getelementptr inbounds [32 x i8], [32 x i8]* %error_bound_ch73, i64 0, i64 0, !dbg !1008
  %call75 = call i8* @strcat(i8* %arraydecay72, i8* %arraydecay74) #8, !dbg !1009
  %arraydecay76 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer71, i64 0, i64 0, !dbg !1010
  %call77 = call i64 @strlen(i8* %arraydecay76) #7, !dbg !1011
  %arrayidx78 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer71, i64 0, i64 %call77, !dbg !1012
  store i8 10, i8* %arrayidx78, align 1, !dbg !1013
  %arraydecay79 = getelementptr inbounds [40 x i8], [40 x i8]* %temp_buffer71, i64 0, i64 0, !dbg !1014
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !1015
  %call80 = call i32 @fputs(i8* %arraydecay79, %struct._IO_FILE* %14), !dbg !1016
  br label %if.end84, !dbg !1017

if.else81:                                        ; preds = %if.then65
  %arraydecay82 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !1018
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !1020
  %call83 = call i32 @fputs(i8* %arraydecay82, %struct._IO_FILE* %15), !dbg !1021
  br label %if.end84

if.end84:                                         ; preds = %if.else81, %if.then70
  br label %if.end88, !dbg !1022

if.else85:                                        ; preds = %land.lhs.true60, %land.lhs.true55, %if.else51
  %arraydecay86 = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i64 0, i64 0, !dbg !1023
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !1025
  %call87 = call i32 @fputs(i8* %arraydecay86, %struct._IO_FILE* %16), !dbg !1026
  br label %if.end88

if.end88:                                         ; preds = %if.else85, %if.end84
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %if.end50
  br label %if.end90

if.end90:                                         ; preds = %if.end89, %if.end23
  br label %while.cond, !dbg !918, !llvm.loop !1027

while.end:                                        ; preds = %while.cond
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %fPtr, align 8, !dbg !1029
  %call91 = call i32 @fclose(%struct._IO_FILE* %17), !dbg !1030
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %fTemp, align 8, !dbg !1031
  %call92 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !1032
  %19 = load i8*, i8** %SZFIcfgFilePath, align 8, !dbg !1033
  %call93 = call i32 @remove(i8* %19) #8, !dbg !1034
  %20 = load i8*, i8** %SZFIcfgFilePath, align 8, !dbg !1035
  %call94 = call i32 @rename(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.21, i64 0, i64 0), i8* %20) #8, !dbg !1036
  ret void, !dbg !1037
}

; Function Attrs: noinline nounwind optnone uwtable
define internal double* @SZ_fault_generator_1D(i32 %length, double* %ori_data) #0 !dbg !1038 {
entry:
  %length.addr = alloca i32, align 4
  %ori_data.addr = alloca double*, align 8
  %SZcfgFilePath = alloca i8*, align 8
  %start_time1 = alloca double, align 8
  %start_time2 = alloca double, align 8
  %compression_time = alloca double, align 8
  %decompression_time = alloca double, align 8
  %status = alloca i32, align 4
  %tar_data = alloca double*, align 8
  %SZ_compressed_size = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  %r3 = alloca i64, align 8
  %r4 = alloca i64, align 8
  %r5 = alloca i64, align 8
  %bytes = alloca i8*, align 8
  %SZ_decompressed_size = alloca i64, align 8
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !1041, metadata !DIExpression()), !dbg !1042
  store double* %ori_data, double** %ori_data.addr, align 8
  call void @llvm.dbg.declare(metadata double** %ori_data.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  call void @llvm.dbg.declare(metadata i8** %SZcfgFilePath, metadata !1045, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.declare(metadata double* %start_time1, metadata !1047, metadata !DIExpression()), !dbg !1048
  store double 0.000000e+00, double* %start_time1, align 8, !dbg !1048
  call void @llvm.dbg.declare(metadata double* %start_time2, metadata !1049, metadata !DIExpression()), !dbg !1050
  store double 0.000000e+00, double* %start_time2, align 8, !dbg !1050
  call void @llvm.dbg.declare(metadata double* %compression_time, metadata !1051, metadata !DIExpression()), !dbg !1052
  store double 0.000000e+00, double* %compression_time, align 8, !dbg !1052
  call void @llvm.dbg.declare(metadata double* %decompression_time, metadata !1053, metadata !DIExpression()), !dbg !1054
  store double 0.000000e+00, double* %decompression_time, align 8, !dbg !1054
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.20, i64 0, i64 0), i8** %SZcfgFilePath, align 8, !dbg !1055
  call void @llvm.dbg.declare(metadata i32* %status, metadata !1056, metadata !DIExpression()), !dbg !1057
  %0 = load i8*, i8** %SZcfgFilePath, align 8, !dbg !1058
  %call = call i32 @SZ_Init(i8* %0), !dbg !1059
  store i32 %call, i32* %status, align 4, !dbg !1057
  %1 = load i32, i32* %status, align 4, !dbg !1060
  %cmp = icmp eq i32 %1, -1, !dbg !1062
  br i1 %cmp, label %if.then, label %if.end, !dbg !1063

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.30, i64 0, i64 0)), !dbg !1064
  call void @exit(i32 0) #9, !dbg !1066
  unreachable, !dbg !1066

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata double** %tar_data, metadata !1067, metadata !DIExpression()), !dbg !1068
  %2 = load i32, i32* %length.addr, align 4, !dbg !1069
  %conv = sext i32 %2 to i64, !dbg !1069
  %mul = mul i64 %conv, 8, !dbg !1070
  %call2 = call noalias align 16 i8* @malloc(i64 %mul) #8, !dbg !1071
  %3 = bitcast i8* %call2 to double*, !dbg !1072
  store double* %3, double** %tar_data, align 8, !dbg !1068
  call void @llvm.dbg.declare(metadata i64* %SZ_compressed_size, metadata !1073, metadata !DIExpression()), !dbg !1074
  call void @llvm.dbg.declare(metadata i64* %r1, metadata !1075, metadata !DIExpression()), !dbg !1076
  %4 = load i32, i32* %length.addr, align 4, !dbg !1077
  %conv3 = sext i32 %4 to i64, !dbg !1077
  store i64 %conv3, i64* %r1, align 8, !dbg !1076
  call void @llvm.dbg.declare(metadata i64* %r2, metadata !1078, metadata !DIExpression()), !dbg !1079
  store i64 0, i64* %r2, align 8, !dbg !1079
  call void @llvm.dbg.declare(metadata i64* %r3, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i64 0, i64* %r3, align 8, !dbg !1081
  call void @llvm.dbg.declare(metadata i64* %r4, metadata !1082, metadata !DIExpression()), !dbg !1083
  store i64 0, i64* %r4, align 8, !dbg !1083
  call void @llvm.dbg.declare(metadata i64* %r5, metadata !1084, metadata !DIExpression()), !dbg !1085
  store i64 0, i64* %r5, align 8, !dbg !1085
  %call4 = call double @mytimer(), !dbg !1086
  store double %call4, double* %start_time1, align 8, !dbg !1087
  call void @llvm.dbg.declare(metadata i8** %bytes, metadata !1088, metadata !DIExpression()), !dbg !1091
  %5 = load double*, double** %ori_data.addr, align 8, !dbg !1092
  %6 = bitcast double* %5 to i8*, !dbg !1092
  %7 = load i64, i64* %r5, align 8, !dbg !1093
  %8 = load i64, i64* %r4, align 8, !dbg !1094
  %9 = load i64, i64* %r3, align 8, !dbg !1095
  %10 = load i64, i64* %r2, align 8, !dbg !1096
  %11 = load i64, i64* %r1, align 8, !dbg !1097
  %call5 = call i8* @SZ_compress(i32 1, i8* %6, i64* %SZ_compressed_size, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11), !dbg !1098
  store i8* %call5, i8** %bytes, align 8, !dbg !1091
  %call6 = call double @mytimer(), !dbg !1099
  %12 = load double, double* %start_time1, align 8, !dbg !1100
  %sub = fsub double %call6, %12, !dbg !1101
  %13 = load double, double* %compression_time, align 8, !dbg !1102
  %add = fadd double %13, %sub, !dbg !1102
  store double %add, double* %compression_time, align 8, !dbg !1102
  %call7 = call double @mytimer(), !dbg !1103
  store double %call7, double* %start_time2, align 8, !dbg !1104
  call void @llvm.dbg.declare(metadata i64* %SZ_decompressed_size, metadata !1105, metadata !DIExpression()), !dbg !1106
  %14 = load i8*, i8** %bytes, align 8, !dbg !1107
  %15 = load i64, i64* %SZ_compressed_size, align 8, !dbg !1108
  %16 = load double*, double** %tar_data, align 8, !dbg !1109
  %17 = bitcast double* %16 to i8*, !dbg !1109
  %18 = load i64, i64* %r5, align 8, !dbg !1110
  %19 = load i64, i64* %r4, align 8, !dbg !1111
  %20 = load i64, i64* %r3, align 8, !dbg !1112
  %21 = load i64, i64* %r2, align 8, !dbg !1113
  %22 = load i64, i64* %r1, align 8, !dbg !1114
  %call8 = call i64 @SZ_decompress_args(i32 1, i8* %14, i64 %15, i8* %17, i64 %18, i64 %19, i64 %20, i64 %21, i64 %22), !dbg !1115
  store i64 %call8, i64* %SZ_decompressed_size, align 8, !dbg !1106
  %call9 = call double @mytimer(), !dbg !1116
  %23 = load double, double* %start_time2, align 8, !dbg !1117
  %sub10 = fsub double %call9, %23, !dbg !1118
  %24 = load double, double* %decompression_time, align 8, !dbg !1119
  %add11 = fadd double %24, %sub10, !dbg !1119
  store double %add11, double* %decompression_time, align 8, !dbg !1119
  call void (...) @SZ_Finalize(), !dbg !1120
  %25 = load double*, double** %tar_data, align 8, !dbg !1121
  ret double* %25, !dbg !1122
}

declare dso_local i32 @SZ_Init(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal double @mytimer() #0 !dbg !1123 {
entry:
  %ruse = alloca %struct.rusage, align 8
  call void @llvm.dbg.declare(metadata %struct.rusage* %ruse, metadata !1126, metadata !DIExpression()), !dbg !1210
  %call = call i32 @getrusage(i32 0, %struct.rusage* %ruse) #8, !dbg !1211
  %ru_utime = getelementptr inbounds %struct.rusage, %struct.rusage* %ruse, i32 0, i32 0, !dbg !1212
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime, i32 0, i32 0, !dbg !1213
  %0 = load i64, i64* %tv_sec, align 8, !dbg !1213
  %conv = sitofp i64 %0 to double, !dbg !1214
  %ru_utime1 = getelementptr inbounds %struct.rusage, %struct.rusage* %ruse, i32 0, i32 0, !dbg !1215
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %ru_utime1, i32 0, i32 1, !dbg !1216
  %1 = load i64, i64* %tv_usec, align 8, !dbg !1216
  %conv2 = sitofp i64 %1 to double, !dbg !1217
  %div = fdiv double %conv2, 1.000000e+06, !dbg !1218
  %add = fadd double %conv, %div, !dbg !1219
  ret double %add, !dbg !1220
}

declare dso_local i8* @SZ_compress(i32, i8*, i64*, i64, i64, i64, i64, i64) #2

declare dso_local i64 @SZ_decompress_args(i32, i8*, i64, i8*, i64, i64, i64, i64, i64) #2

declare dso_local void @SZ_Finalize(...) #2

; Function Attrs: nounwind
declare dso_local i32 @getrusage(i32, %struct.rusage*) #4

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i8* @strstr(i8*, i8*) #3

declare dso_local i32 @fputs(i8*, %struct._IO_FILE*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i32 @remove(i8*) #4

; Function Attrs: nounwind
declare dso_local i32 @rename(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local double @atof(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @StencilInit(i32 %nx, i32 %ny, i32 %nz, double* %A) #0 !dbg !1221 {
entry:
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %A.addr = alloca double*, align 8
  %last = alloca i64, align 8
  %i = alloca i64, align 8
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !1224, metadata !DIExpression()), !dbg !1225
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !1226, metadata !DIExpression()), !dbg !1227
  store i32 %nz, i32* %nz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nz.addr, metadata !1228, metadata !DIExpression()), !dbg !1229
  store double* %A, double** %A.addr, align 8
  call void @llvm.dbg.declare(metadata double** %A.addr, metadata !1230, metadata !DIExpression()), !dbg !1231
  call void @llvm.dbg.declare(metadata i64* %last, metadata !1232, metadata !DIExpression()), !dbg !1233
  %0 = load i32, i32* %nx.addr, align 4, !dbg !1234
  %1 = load i32, i32* %ny.addr, align 4, !dbg !1235
  %mul = mul nsw i32 %0, %1, !dbg !1236
  %2 = load i32, i32* %nz.addr, align 4, !dbg !1237
  %mul1 = mul nsw i32 %mul, %2, !dbg !1238
  %conv = sext i32 %mul1 to i64, !dbg !1234
  store i64 %conv, i64* %last, align 8, !dbg !1233
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1239, metadata !DIExpression()), !dbg !1240
  store i64 0, i64* %i, align 8, !dbg !1241
  br label %for.cond, !dbg !1243

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !1244
  %4 = load i64, i64* %last, align 8, !dbg !1246
  %cmp = icmp slt i64 %3, %4, !dbg !1247
  br i1 %cmp, label %for.body, label %for.end, !dbg !1248

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() #8, !dbg !1249
  %conv3 = sitofp i32 %call to float, !dbg !1250
  %div = fdiv float %conv3, 0x41E0000000000000, !dbg !1251
  %conv4 = fpext float %div to double, !dbg !1250
  %5 = load double*, double** %A.addr, align 8, !dbg !1252
  %6 = load i64, i64* %i, align 8, !dbg !1253
  %arrayidx = getelementptr inbounds double, double* %5, i64 %6, !dbg !1252
  store double %conv4, double* %arrayidx, align 8, !dbg !1254
  br label %for.inc, !dbg !1252

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !1255
  %inc = add nsw i64 %7, 1, !dbg !1255
  store i64 %inc, i64* %i, align 8, !dbg !1255
  br label %for.cond, !dbg !1256, !llvm.loop !1257

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1259
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @seconds_per_tick() #0 !dbg !1260 {
entry:
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %i = alloca i32, align 4
  %spt = alloca double, align 8
  call void @llvm.dbg.declare(metadata i64* %t0, metadata !1261, metadata !DIExpression()), !dbg !1262
  call void @llvm.dbg.declare(metadata i64* %t1, metadata !1263, metadata !DIExpression()), !dbg !1264
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1265, metadata !DIExpression()), !dbg !1266
  store i32 3, i32* %i, align 4, !dbg !1266
  call void @llvm.dbg.declare(metadata double* %spt, metadata !1267, metadata !DIExpression()), !dbg !1268
  store double 0.000000e+00, double* %spt, align 8, !dbg !1268
  br label %while.cond, !dbg !1269

while.cond:                                       ; preds = %while.body, %entry
  %0 = load double, double* %spt, align 8, !dbg !1270
  %cmp = fcmp ole double %0, 0.000000e+00, !dbg !1271
  br i1 %cmp, label %while.body, label %while.end, !dbg !1269

while.body:                                       ; preds = %while.cond
  %call = call i64 @getticks.13(), !dbg !1272
  store i64 %call, i64* %t0, align 8, !dbg !1274
  %1 = load i32, i32* %i, align 4, !dbg !1275
  %call1 = call i32 @sleep(i32 %1), !dbg !1276
  %call2 = call i64 @getticks.13(), !dbg !1277
  store i64 %call2, i64* %t1, align 8, !dbg !1278
  %2 = load i32, i32* %i, align 4, !dbg !1279
  %conv = uitofp i32 %2 to double, !dbg !1280
  %3 = load i64, i64* %t1, align 8, !dbg !1281
  %4 = load i64, i64* %t0, align 8, !dbg !1282
  %call3 = call double @elapsed(i64 %3, i64 %4), !dbg !1283
  %div = fdiv double %conv, %call3, !dbg !1284
  store double %div, double* %spt, align 8, !dbg !1285
  %5 = load i32, i32* %i, align 4, !dbg !1286
  %inc = add i32 %5, 1, !dbg !1286
  store i32 %inc, i32* %i, align 4, !dbg !1286
  br label %while.cond, !dbg !1269, !llvm.loop !1287

while.end:                                        ; preds = %while.cond
  %6 = load double, double* %spt, align 8, !dbg !1289
  ret double %6, !dbg !1290
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @getticks.13() #0 !dbg !1291 {
entry:
  %a = alloca i32, align 4
  %d = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !1292, metadata !DIExpression()), !dbg !1293
  call void @llvm.dbg.declare(metadata i32* %d, metadata !1294, metadata !DIExpression()), !dbg !1295
  %0 = call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !dbg !1296, !srcloc !1297
  %asmresult = extractvalue { i32, i32 } %0, 0, !dbg !1296
  %asmresult1 = extractvalue { i32, i32 } %0, 1, !dbg !1296
  store i32 %asmresult, i32* %a, align 4, !dbg !1296
  store i32 %asmresult1, i32* %d, align 4, !dbg !1296
  %1 = load i32, i32* %a, align 4, !dbg !1298
  %conv = zext i32 %1 to i64, !dbg !1299
  %2 = load i32, i32* %d, align 4, !dbg !1300
  %conv2 = zext i32 %2 to i64, !dbg !1301
  %shl = shl i64 %conv2, 32, !dbg !1302
  %or = or i64 %conv, %shl, !dbg !1303
  ret i64 %or, !dbg !1304
}

; Function Attrs: noinline nounwind optnone uwtable
define internal double @elapsed(i64 %t1, i64 %t0) #0 !dbg !1305 {
entry:
  %t1.addr = alloca i64, align 8
  %t0.addr = alloca i64, align 8
  store i64 %t1, i64* %t1.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %t1.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i64 %t0, i64* %t0.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %t0.addr, metadata !1310, metadata !DIExpression()), !dbg !1309
  %0 = load i64, i64* %t1.addr, align 8, !dbg !1309
  %1 = load i64, i64* %t0.addr, align 8, !dbg !1309
  %sub = sub i64 %0, %1, !dbg !1309
  %conv = uitofp i64 %sub to double, !dbg !1309
  ret double %conv, !dbg !1309
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clear_cache() #0 !dbg !1311 {
entry:
  %i = alloca i32, align 4
  %tarray = alloca float*, align 8
  %accum = alloca float, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1314, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.declare(metadata float** %tarray, metadata !1316, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.declare(metadata float* %accum, metadata !1318, metadata !DIExpression()), !dbg !1319
  %call = call noalias align 16 i8* @malloc(i64 5242880) #8, !dbg !1320
  %0 = bitcast i8* %call to float*, !dbg !1321
  store float* %0, float** %tarray, align 8, !dbg !1322
  store i32 0, i32* %i, align 4, !dbg !1323
  store float 0.000000e+00, float* %accum, align 4, !dbg !1325
  br label %for.cond, !dbg !1326

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !1327
  %cmp = icmp slt i32 %1, 1310719, !dbg !1329
  br i1 %cmp, label %for.body, label %for.end, !dbg !1330

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %tarray, align 8, !dbg !1331
  %3 = load i32, i32* %i, align 4, !dbg !1332
  %idxprom = sext i32 %3 to i64, !dbg !1331
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !1331
  store float 1.000000e+00, float* %arrayidx, align 4, !dbg !1333
  br label %for.inc, !dbg !1331

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !1334
  %inc = add nsw i32 %4, 1, !dbg !1334
  store i32 %inc, i32* %i, align 4, !dbg !1334
  br label %for.cond, !dbg !1335, !llvm.loop !1336

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1338
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!19, !2, !26}
!llvm.ident = !{!31, !31, !31}
!llvm.module.flags = !{!32, !33, !34, !35, !36}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "EPSILON", scope: !2, file: !3, line: 8, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project.git 932e3d9960c115d0f6a92b6b4c9529892ade8d32)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !17, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "probe_heat.c", directory: "/root/summer_research/lossy-compression-error-modeling/stencilCode")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__rusage_who", file: !6, line: 158, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/resource.h", directory: "")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "RUSAGE_SELF", value: 0)
!10 = !DIEnumerator(name: "RUSAGE_CHILDREN", value: -1)
!11 = !{!12, !14, !15, !13}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!0}
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project.git 932e3d9960c115d0f6a92b6b4c9529892ade8d32)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !22, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "main.c", directory: "/root/summer_research/lossy-compression-error-modeling/stencilCode")
!21 = !{}
!22 = !{!12, !23}
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "ticks", file: !24, line: 265, baseType: !25)
!24 = !DIFile(filename: "./cycle.h", directory: "/root/summer_research/lossy-compression-error-modeling/stencilCode")
!25 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = distinct !DICompileUnit(language: DW_LANG_C99, file: !27, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project.git 932e3d9960c115d0f6a92b6b4c9529892ade8d32)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !28, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "util.c", directory: "/root/summer_research/lossy-compression-error-modeling/stencilCode")
!28 = !{!29, !13, !30, !23}
!29 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!31 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git 932e3d9960c115d0f6a92b6b4c9529892ade8d32)"}
!32 = !{i32 7, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{i32 1, !"wchar_size", i32 4}
!35 = !{i32 7, !"uwtable", i32 1}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 21, type: !38, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !21)
!38 = !DISubroutineType(types: !39)
!39 = !{!7, !7, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!41 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !20, line: 21, type: !7)
!42 = !DILocation(line: 21, column: 14, scope: !37)
!43 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !20, line: 21, type: !40)
!44 = !DILocation(line: 21, column: 26, scope: !37)
!45 = !DILocalVariable(name: "Anext", scope: !37, file: !20, line: 23, type: !12)
!46 = !DILocation(line: 23, column: 11, scope: !37)
!47 = !DILocalVariable(name: "A0", scope: !37, file: !20, line: 24, type: !12)
!48 = !DILocation(line: 24, column: 11, scope: !37)
!49 = !DILocalVariable(name: "nx", scope: !37, file: !20, line: 25, type: !7)
!50 = !DILocation(line: 25, column: 7, scope: !37)
!51 = !DILocalVariable(name: "ny", scope: !37, file: !20, line: 25, type: !7)
!52 = !DILocation(line: 25, column: 11, scope: !37)
!53 = !DILocalVariable(name: "nz", scope: !37, file: !20, line: 25, type: !7)
!54 = !DILocation(line: 25, column: 15, scope: !37)
!55 = !DILocalVariable(name: "tx", scope: !37, file: !20, line: 25, type: !7)
!56 = !DILocation(line: 25, column: 19, scope: !37)
!57 = !DILocalVariable(name: "ty", scope: !37, file: !20, line: 25, type: !7)
!58 = !DILocation(line: 25, column: 23, scope: !37)
!59 = !DILocalVariable(name: "tz", scope: !37, file: !20, line: 25, type: !7)
!60 = !DILocation(line: 25, column: 27, scope: !37)
!61 = !DILocalVariable(name: "timesteps", scope: !37, file: !20, line: 25, type: !7)
!62 = !DILocation(line: 25, column: 31, scope: !37)
!63 = !DILocalVariable(name: "i", scope: !37, file: !20, line: 26, type: !7)
!64 = !DILocation(line: 26, column: 7, scope: !37)
!65 = !DILocalVariable(name: "t1", scope: !37, file: !20, line: 28, type: !23)
!66 = !DILocation(line: 28, column: 9, scope: !37)
!67 = !DILocalVariable(name: "t2", scope: !37, file: !20, line: 28, type: !23)
!68 = !DILocation(line: 28, column: 13, scope: !37)
!69 = !DILocalVariable(name: "spt", scope: !37, file: !20, line: 29, type: !13)
!70 = !DILocation(line: 29, column: 10, scope: !37)
!71 = !DILocation(line: 32, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !37, file: !20, line: 32, column: 7)
!73 = !DILocation(line: 32, column: 12, scope: !72)
!74 = !DILocation(line: 32, column: 7, scope: !37)
!75 = !DILocation(line: 33, column: 99, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !20, line: 32, column: 17)
!77 = !DILocation(line: 33, column: 5, scope: !76)
!78 = !DILocation(line: 34, column: 5, scope: !76)
!79 = !DILocation(line: 35, column: 5, scope: !76)
!80 = !DILocation(line: 36, column: 5, scope: !76)
!81 = !DILocation(line: 39, column: 13, scope: !37)
!82 = !DILocation(line: 39, column: 8, scope: !37)
!83 = !DILocation(line: 39, column: 6, scope: !37)
!84 = !DILocation(line: 40, column: 13, scope: !37)
!85 = !DILocation(line: 40, column: 8, scope: !37)
!86 = !DILocation(line: 40, column: 6, scope: !37)
!87 = !DILocation(line: 41, column: 13, scope: !37)
!88 = !DILocation(line: 41, column: 8, scope: !37)
!89 = !DILocation(line: 41, column: 6, scope: !37)
!90 = !DILocation(line: 42, column: 13, scope: !37)
!91 = !DILocation(line: 42, column: 8, scope: !37)
!92 = !DILocation(line: 42, column: 6, scope: !37)
!93 = !DILocation(line: 43, column: 13, scope: !37)
!94 = !DILocation(line: 43, column: 8, scope: !37)
!95 = !DILocation(line: 43, column: 6, scope: !37)
!96 = !DILocation(line: 44, column: 13, scope: !37)
!97 = !DILocation(line: 44, column: 8, scope: !37)
!98 = !DILocation(line: 44, column: 6, scope: !37)
!99 = !DILocation(line: 45, column: 20, scope: !37)
!100 = !DILocation(line: 45, column: 15, scope: !37)
!101 = !DILocation(line: 45, column: 13, scope: !37)
!102 = !DILocation(line: 53, column: 9, scope: !37)
!103 = !DILocation(line: 53, column: 7, scope: !37)
!104 = !DILocation(line: 56, column: 45, scope: !37)
!105 = !DILocation(line: 56, column: 43, scope: !37)
!106 = !DILocation(line: 56, column: 50, scope: !37)
!107 = !DILocation(line: 56, column: 48, scope: !37)
!108 = !DILocation(line: 56, column: 55, scope: !37)
!109 = !DILocation(line: 56, column: 53, scope: !37)
!110 = !DILocation(line: 56, column: 21, scope: !37)
!111 = !DILocation(line: 56, column: 11, scope: !37)
!112 = !DILocation(line: 56, column: 9, scope: !37)
!113 = !DILocation(line: 57, column: 42, scope: !37)
!114 = !DILocation(line: 57, column: 40, scope: !37)
!115 = !DILocation(line: 57, column: 47, scope: !37)
!116 = !DILocation(line: 57, column: 45, scope: !37)
!117 = !DILocation(line: 57, column: 52, scope: !37)
!118 = !DILocation(line: 57, column: 50, scope: !37)
!119 = !DILocation(line: 57, column: 18, scope: !37)
!120 = !DILocation(line: 57, column: 8, scope: !37)
!121 = !DILocation(line: 57, column: 6, scope: !37)
!122 = !DILocation(line: 61, column: 10, scope: !123)
!123 = distinct !DILexicalBlock(scope: !37, file: !20, line: 61, column: 3)
!124 = !DILocation(line: 61, column: 8, scope: !123)
!125 = !DILocation(line: 61, column: 15, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !20, line: 61, column: 3)
!127 = !DILocation(line: 61, column: 17, scope: !126)
!128 = !DILocation(line: 61, column: 3, scope: !123)
!129 = !DILocation(line: 62, column: 46, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !20, line: 61, column: 36)
!131 = !DILocation(line: 62, column: 5, scope: !130)
!132 = !DILocation(line: 64, column: 11, scope: !130)
!133 = !DILocation(line: 64, column: 5, scope: !130)
!134 = !DILocation(line: 66, column: 17, scope: !130)
!135 = !DILocation(line: 66, column: 21, scope: !130)
!136 = !DILocation(line: 66, column: 25, scope: !130)
!137 = !DILocation(line: 66, column: 29, scope: !130)
!138 = !DILocation(line: 66, column: 5, scope: !130)
!139 = !DILocalVariable(name: "j", scope: !140, file: !20, line: 69, type: !7)
!140 = distinct !DILexicalBlock(scope: !130, file: !20, line: 69, column: 5)
!141 = !DILocation(line: 69, column: 14, scope: !140)
!142 = !DILocation(line: 69, column: 10, scope: !140)
!143 = !DILocation(line: 69, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !20, line: 69, column: 5)
!145 = !DILocation(line: 69, column: 25, scope: !144)
!146 = !DILocation(line: 69, column: 30, scope: !144)
!147 = !DILocation(line: 69, column: 28, scope: !144)
!148 = !DILocation(line: 69, column: 35, scope: !144)
!149 = !DILocation(line: 69, column: 33, scope: !144)
!150 = !DILocation(line: 69, column: 23, scope: !144)
!151 = !DILocation(line: 69, column: 5, scope: !140)
!152 = !DILocation(line: 70, column: 15, scope: !144)
!153 = !DILocation(line: 70, column: 21, scope: !144)
!154 = !DILocation(line: 70, column: 7, scope: !144)
!155 = !DILocation(line: 70, column: 10, scope: !144)
!156 = !DILocation(line: 70, column: 13, scope: !144)
!157 = !DILocation(line: 69, column: 40, scope: !144)
!158 = !DILocation(line: 69, column: 5, scope: !144)
!159 = distinct !{!159, !151, !160, !161}
!160 = !DILocation(line: 70, column: 22, scope: !140)
!161 = !{!"llvm.loop.mustprogress"}
!162 = !DILocation(line: 79, column: 10, scope: !130)
!163 = !DILocation(line: 79, column: 8, scope: !130)
!164 = !DILocation(line: 82, column: 18, scope: !130)
!165 = !DILocation(line: 82, column: 22, scope: !130)
!166 = !DILocation(line: 82, column: 29, scope: !130)
!167 = !DILocation(line: 82, column: 33, scope: !130)
!168 = !DILocation(line: 82, column: 37, scope: !130)
!169 = !DILocation(line: 82, column: 41, scope: !130)
!170 = !DILocation(line: 82, column: 45, scope: !130)
!171 = !DILocation(line: 82, column: 49, scope: !130)
!172 = !DILocation(line: 82, column: 53, scope: !130)
!173 = !DILocation(line: 82, column: 5, scope: !130)
!174 = !DILocation(line: 84, column: 10, scope: !130)
!175 = !DILocation(line: 84, column: 8, scope: !130)
!176 = !DILocation(line: 85, column: 5, scope: !130)
!177 = !DILocation(line: 87, column: 3, scope: !130)
!178 = !DILocation(line: 61, column: 32, scope: !126)
!179 = !DILocation(line: 61, column: 3, scope: !126)
!180 = distinct !{!180, !128, !181, !161}
!181 = !DILocation(line: 87, column: 3, scope: !123)
!182 = !DILocation(line: 90, column: 8, scope: !37)
!183 = !DILocation(line: 90, column: 3, scope: !37)
!184 = !DILocation(line: 91, column: 8, scope: !37)
!185 = !DILocation(line: 91, column: 3, scope: !37)
!186 = !DILocation(line: 92, column: 3, scope: !37)
!187 = !DILocation(line: 93, column: 1, scope: !37)
!188 = distinct !DISubprogram(name: "getticks", scope: !24, file: !24, line: 267, type: !189, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !21)
!189 = !DISubroutineType(types: !190)
!190 = !{!23}
!191 = !DILocalVariable(name: "a", scope: !188, file: !24, line: 269, type: !192)
!192 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!193 = !DILocation(line: 269, column: 15, scope: !188)
!194 = !DILocalVariable(name: "d", scope: !188, file: !24, line: 269, type: !192)
!195 = !DILocation(line: 269, column: 18, scope: !188)
!196 = !DILocation(line: 270, column: 6, scope: !188)
!197 = !{i32 254289}
!198 = !DILocation(line: 271, column: 21, scope: !188)
!199 = !DILocation(line: 271, column: 14, scope: !188)
!200 = !DILocation(line: 271, column: 35, scope: !188)
!201 = !DILocation(line: 271, column: 28, scope: !188)
!202 = !DILocation(line: 271, column: 38, scope: !188)
!203 = !DILocation(line: 271, column: 24, scope: !188)
!204 = !DILocation(line: 271, column: 6, scope: !188)
!205 = distinct !DISubprogram(name: "StencilProbe", scope: !3, file: !3, line: 16, type: !206, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!206 = !DISubroutineType(types: !207)
!207 = !{null, !12, !12, !7, !7, !7, !7, !7, !7, !7}
!208 = !DILocalVariable(name: "A00", arg: 1, scope: !205, file: !3, line: 16, type: !12)
!209 = !DILocation(line: 16, column: 27, scope: !205)
!210 = !DILocalVariable(name: "Anext0", arg: 2, scope: !205, file: !3, line: 16, type: !12)
!211 = !DILocation(line: 16, column: 40, scope: !205)
!212 = !DILocalVariable(name: "nx", arg: 3, scope: !205, file: !3, line: 16, type: !7)
!213 = !DILocation(line: 16, column: 52, scope: !205)
!214 = !DILocalVariable(name: "ny", arg: 4, scope: !205, file: !3, line: 16, type: !7)
!215 = !DILocation(line: 16, column: 60, scope: !205)
!216 = !DILocalVariable(name: "nz", arg: 5, scope: !205, file: !3, line: 16, type: !7)
!217 = !DILocation(line: 16, column: 68, scope: !205)
!218 = !DILocalVariable(name: "tx", arg: 6, scope: !205, file: !3, line: 17, type: !7)
!219 = !DILocation(line: 17, column: 23, scope: !205)
!220 = !DILocalVariable(name: "ty", arg: 7, scope: !205, file: !3, line: 17, type: !7)
!221 = !DILocation(line: 17, column: 31, scope: !205)
!222 = !DILocalVariable(name: "tz", arg: 8, scope: !205, file: !3, line: 17, type: !7)
!223 = !DILocation(line: 17, column: 39, scope: !205)
!224 = !DILocalVariable(name: "timesteps", arg: 9, scope: !205, file: !3, line: 17, type: !7)
!225 = !DILocation(line: 17, column: 47, scope: !205)
!226 = !DILocalVariable(name: "minxyz", scope: !205, file: !3, line: 22, type: !13)
!227 = !DILocation(line: 22, column: 10, scope: !205)
!228 = !DILocation(line: 22, column: 19, scope: !205)
!229 = !DILocalVariable(name: "fac", scope: !205, file: !3, line: 23, type: !13)
!230 = !DILocation(line: 23, column: 10, scope: !205)
!231 = !DILocation(line: 23, column: 27, scope: !205)
!232 = !DILocation(line: 23, column: 25, scope: !205)
!233 = !DILocalVariable(name: "temp_ptr", scope: !205, file: !3, line: 24, type: !12)
!234 = !DILocation(line: 24, column: 11, scope: !205)
!235 = !DILocalVariable(name: "i", scope: !205, file: !3, line: 25, type: !7)
!236 = !DILocation(line: 25, column: 7, scope: !205)
!237 = !DILocalVariable(name: "j", scope: !205, file: !3, line: 25, type: !7)
!238 = !DILocation(line: 25, column: 10, scope: !205)
!239 = !DILocalVariable(name: "k", scope: !205, file: !3, line: 25, type: !7)
!240 = !DILocation(line: 25, column: 13, scope: !205)
!241 = !DILocalVariable(name: "t", scope: !205, file: !3, line: 25, type: !7)
!242 = !DILocation(line: 25, column: 16, scope: !205)
!243 = !DILocalVariable(name: "fi_config", scope: !205, file: !3, line: 27, type: !244)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "Fault_Injector_Configs", file: !245, line: 44, baseType: !246)
!245 = !DIFile(filename: "./SZ_fault_generator.h", directory: "/root/summer_research/lossy-compression-error-modeling/stencilCode")
!246 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Fault_Injector_ConfigsSt", file: !245, line: 11, size: 640, elements: !247)
!247 = !{!248, !249, !250, !251, !252, !253, !254, !258, !259}
!248 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !246, file: !245, line: 15, baseType: !7, size: 32)
!249 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !246, file: !245, line: 16, baseType: !7, size: 32, offset: 32)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !246, file: !245, line: 17, baseType: !7, size: 32, offset: 64)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "iters", scope: !246, file: !245, line: 22, baseType: !7, size: 32, offset: 96)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "steps", scope: !246, file: !245, line: 22, baseType: !7, size: 32, offset: 128)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "compressor", scope: !246, file: !245, line: 28, baseType: !7, size: 32, offset: 160)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "error_type", scope: !246, file: !245, line: 33, baseType: !255, size: 80, offset: 192)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 10)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "error_bound", scope: !246, file: !245, line: 38, baseType: !13, size: 64, offset: 320)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "error_bound_ch", scope: !246, file: !245, line: 41, baseType: !260, size: 256, offset: 384)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 256, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 32)
!263 = !DILocation(line: 27, column: 26, scope: !205)
!264 = !DILocation(line: 27, column: 38, scope: !205)
!265 = !DILocation(line: 28, column: 3, scope: !205)
!266 = !DILocation(line: 29, column: 56, scope: !205)
!267 = !DILocation(line: 29, column: 46, scope: !205)
!268 = !DILocation(line: 29, column: 78, scope: !205)
!269 = !DILocation(line: 29, column: 68, scope: !205)
!270 = !DILocation(line: 29, column: 3, scope: !205)
!271 = !DILocation(line: 31, column: 25, scope: !205)
!272 = !DILocation(line: 31, column: 13, scope: !205)
!273 = !DILocalVariable(name: "timeNow", scope: !205, file: !3, line: 32, type: !7)
!274 = !DILocation(line: 32, column: 7, scope: !205)
!275 = !DILocalVariable(name: "step", scope: !205, file: !3, line: 32, type: !7)
!276 = !DILocation(line: 32, column: 20, scope: !205)
!277 = !DILocation(line: 32, column: 37, scope: !205)
!278 = !DILocalVariable(name: "Anext", scope: !205, file: !3, line: 33, type: !12)
!279 = !DILocation(line: 33, column: 11, scope: !205)
!280 = !DILocalVariable(name: "A0", scope: !205, file: !3, line: 34, type: !12)
!281 = !DILocation(line: 34, column: 11, scope: !205)
!282 = !DILocation(line: 35, column: 45, scope: !205)
!283 = !DILocation(line: 35, column: 43, scope: !205)
!284 = !DILocation(line: 35, column: 50, scope: !205)
!285 = !DILocation(line: 35, column: 48, scope: !205)
!286 = !DILocation(line: 35, column: 55, scope: !205)
!287 = !DILocation(line: 35, column: 53, scope: !205)
!288 = !DILocation(line: 35, column: 21, scope: !205)
!289 = !DILocation(line: 35, column: 11, scope: !205)
!290 = !DILocation(line: 35, column: 9, scope: !205)
!291 = !DILocation(line: 36, column: 42, scope: !205)
!292 = !DILocation(line: 36, column: 40, scope: !205)
!293 = !DILocation(line: 36, column: 47, scope: !205)
!294 = !DILocation(line: 36, column: 45, scope: !205)
!295 = !DILocation(line: 36, column: 52, scope: !205)
!296 = !DILocation(line: 36, column: 50, scope: !205)
!297 = !DILocation(line: 36, column: 18, scope: !205)
!298 = !DILocation(line: 36, column: 8, scope: !205)
!299 = !DILocation(line: 36, column: 6, scope: !205)
!300 = !DILocation(line: 38, column: 16, scope: !301)
!301 = distinct !DILexicalBlock(scope: !205, file: !3, line: 38, column: 3)
!302 = !DILocation(line: 38, column: 8, scope: !301)
!303 = !DILocation(line: 38, column: 22, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !3, line: 38, column: 3)
!305 = !DILocation(line: 38, column: 33, scope: !304)
!306 = !DILocation(line: 38, column: 30, scope: !304)
!307 = !DILocation(line: 38, column: 3, scope: !301)
!308 = !DILocation(line: 40, column: 12, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !3, line: 40, column: 5)
!310 = distinct !DILexicalBlock(scope: !304, file: !3, line: 39, column: 3)
!311 = !DILocation(line: 40, column: 10, scope: !309)
!312 = !DILocation(line: 40, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !3, line: 40, column: 5)
!314 = !DILocation(line: 40, column: 21, scope: !313)
!315 = !DILocation(line: 40, column: 26, scope: !313)
!316 = !DILocation(line: 40, column: 24, scope: !313)
!317 = !DILocation(line: 40, column: 31, scope: !313)
!318 = !DILocation(line: 40, column: 29, scope: !313)
!319 = !DILocation(line: 40, column: 19, scope: !313)
!320 = !DILocation(line: 40, column: 5, scope: !309)
!321 = !DILocation(line: 42, column: 15, scope: !322)
!322 = distinct !DILexicalBlock(scope: !313, file: !3, line: 41, column: 5)
!323 = !DILocation(line: 42, column: 19, scope: !322)
!324 = !DILocation(line: 42, column: 7, scope: !322)
!325 = !DILocation(line: 42, column: 10, scope: !322)
!326 = !DILocation(line: 42, column: 13, scope: !322)
!327 = !DILocation(line: 43, column: 5, scope: !322)
!328 = !DILocation(line: 40, column: 36, scope: !313)
!329 = !DILocation(line: 40, column: 5, scope: !313)
!330 = distinct !{!330, !320, !331, !161}
!331 = !DILocation(line: 43, column: 5, scope: !309)
!332 = !DILocation(line: 44, column: 12, scope: !333)
!333 = distinct !DILexicalBlock(scope: !310, file: !3, line: 44, column: 5)
!334 = !DILocation(line: 44, column: 10, scope: !333)
!335 = !DILocation(line: 44, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !3, line: 44, column: 5)
!337 = !DILocation(line: 44, column: 21, scope: !336)
!338 = !DILocation(line: 44, column: 26, scope: !336)
!339 = !DILocation(line: 44, column: 24, scope: !336)
!340 = !DILocation(line: 44, column: 31, scope: !336)
!341 = !DILocation(line: 44, column: 29, scope: !336)
!342 = !DILocation(line: 44, column: 19, scope: !336)
!343 = !DILocation(line: 44, column: 5, scope: !333)
!344 = !DILocation(line: 46, column: 18, scope: !345)
!345 = distinct !DILexicalBlock(scope: !336, file: !3, line: 45, column: 5)
!346 = !DILocation(line: 46, column: 25, scope: !345)
!347 = !DILocation(line: 46, column: 7, scope: !345)
!348 = !DILocation(line: 46, column: 13, scope: !345)
!349 = !DILocation(line: 46, column: 16, scope: !345)
!350 = !DILocation(line: 47, column: 5, scope: !345)
!351 = !DILocation(line: 44, column: 36, scope: !336)
!352 = !DILocation(line: 44, column: 5, scope: !336)
!353 = distinct !{!353, !343, !354, !161}
!354 = !DILocation(line: 47, column: 5, scope: !333)
!355 = !DILocation(line: 48, column: 52, scope: !310)
!356 = !DILocation(line: 48, column: 5, scope: !310)
!357 = !DILocation(line: 49, column: 12, scope: !358)
!358 = distinct !DILexicalBlock(scope: !310, file: !3, line: 49, column: 5)
!359 = !DILocation(line: 49, column: 10, scope: !358)
!360 = !DILocation(line: 49, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !3, line: 49, column: 5)
!362 = !DILocation(line: 49, column: 22, scope: !361)
!363 = !DILocation(line: 49, column: 19, scope: !361)
!364 = !DILocation(line: 49, column: 5, scope: !358)
!365 = !DILocation(line: 51, column: 11, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 51, column: 11)
!367 = distinct !DILexicalBlock(scope: !361, file: !3, line: 50, column: 5)
!368 = !DILocation(line: 51, column: 22, scope: !366)
!369 = !DILocation(line: 51, column: 19, scope: !366)
!370 = !DILocation(line: 51, column: 11, scope: !367)
!371 = !DILocalVariable(name: "temp_A0", scope: !372, file: !3, line: 53, type: !12)
!372 = distinct !DILexicalBlock(scope: !366, file: !3, line: 52, column: 7)
!373 = !DILocation(line: 53, column: 17, scope: !372)
!374 = !DILocation(line: 53, column: 44, scope: !372)
!375 = !DILocation(line: 53, column: 49, scope: !372)
!376 = !DILocation(line: 53, column: 47, scope: !372)
!377 = !DILocation(line: 53, column: 54, scope: !372)
!378 = !DILocation(line: 53, column: 52, scope: !372)
!379 = !DILocation(line: 53, column: 57, scope: !372)
!380 = !DILocation(line: 53, column: 37, scope: !372)
!381 = !DILocation(line: 53, column: 27, scope: !372)
!382 = !DILocation(line: 54, column: 41, scope: !372)
!383 = !DILocation(line: 54, column: 46, scope: !372)
!384 = !DILocation(line: 54, column: 44, scope: !372)
!385 = !DILocation(line: 54, column: 51, scope: !372)
!386 = !DILocation(line: 54, column: 49, scope: !372)
!387 = !DILocation(line: 54, column: 55, scope: !372)
!388 = !DILocation(line: 54, column: 19, scope: !372)
!389 = !DILocation(line: 54, column: 17, scope: !372)
!390 = !DILocation(line: 55, column: 16, scope: !391)
!391 = distinct !DILexicalBlock(scope: !372, file: !3, line: 55, column: 9)
!392 = !DILocation(line: 55, column: 14, scope: !391)
!393 = !DILocation(line: 55, column: 21, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !3, line: 55, column: 9)
!395 = !DILocation(line: 55, column: 25, scope: !394)
!396 = !DILocation(line: 55, column: 30, scope: !394)
!397 = !DILocation(line: 55, column: 28, scope: !394)
!398 = !DILocation(line: 55, column: 35, scope: !394)
!399 = !DILocation(line: 55, column: 33, scope: !394)
!400 = !DILocation(line: 55, column: 23, scope: !394)
!401 = !DILocation(line: 55, column: 9, scope: !391)
!402 = !DILocation(line: 57, column: 19, scope: !403)
!403 = distinct !DILexicalBlock(scope: !394, file: !3, line: 56, column: 9)
!404 = !DILocation(line: 57, column: 27, scope: !403)
!405 = !DILocation(line: 57, column: 11, scope: !403)
!406 = !DILocation(line: 57, column: 14, scope: !403)
!407 = !DILocation(line: 57, column: 17, scope: !403)
!408 = !DILocation(line: 58, column: 22, scope: !403)
!409 = !DILocation(line: 58, column: 30, scope: !403)
!410 = !DILocation(line: 58, column: 11, scope: !403)
!411 = !DILocation(line: 58, column: 17, scope: !403)
!412 = !DILocation(line: 58, column: 20, scope: !403)
!413 = !DILocation(line: 59, column: 9, scope: !403)
!414 = !DILocation(line: 55, column: 40, scope: !394)
!415 = !DILocation(line: 55, column: 9, scope: !394)
!416 = distinct !{!416, !401, !417, !161}
!417 = !DILocation(line: 59, column: 9, scope: !391)
!418 = !DILocation(line: 60, column: 14, scope: !372)
!419 = !DILocation(line: 60, column: 9, scope: !372)
!420 = !DILocation(line: 61, column: 7, scope: !372)
!421 = !DILocation(line: 62, column: 14, scope: !422)
!422 = distinct !DILexicalBlock(scope: !367, file: !3, line: 62, column: 7)
!423 = !DILocation(line: 62, column: 12, scope: !422)
!424 = !DILocation(line: 62, column: 19, scope: !425)
!425 = distinct !DILexicalBlock(scope: !422, file: !3, line: 62, column: 7)
!426 = !DILocation(line: 62, column: 23, scope: !425)
!427 = !DILocation(line: 62, column: 26, scope: !425)
!428 = !DILocation(line: 62, column: 21, scope: !425)
!429 = !DILocation(line: 62, column: 7, scope: !422)
!430 = !DILocation(line: 64, column: 16, scope: !431)
!431 = distinct !DILexicalBlock(scope: !432, file: !3, line: 64, column: 9)
!432 = distinct !DILexicalBlock(scope: !425, file: !3, line: 63, column: 7)
!433 = !DILocation(line: 64, column: 14, scope: !431)
!434 = !DILocation(line: 64, column: 21, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !3, line: 64, column: 9)
!436 = !DILocation(line: 64, column: 25, scope: !435)
!437 = !DILocation(line: 64, column: 28, scope: !435)
!438 = !DILocation(line: 64, column: 23, scope: !435)
!439 = !DILocation(line: 64, column: 9, scope: !431)
!440 = !DILocation(line: 66, column: 18, scope: !441)
!441 = distinct !DILexicalBlock(scope: !442, file: !3, line: 66, column: 11)
!442 = distinct !DILexicalBlock(scope: !435, file: !3, line: 65, column: 9)
!443 = !DILocation(line: 66, column: 16, scope: !441)
!444 = !DILocation(line: 66, column: 23, scope: !445)
!445 = distinct !DILexicalBlock(scope: !441, file: !3, line: 66, column: 11)
!446 = !DILocation(line: 66, column: 27, scope: !445)
!447 = !DILocation(line: 66, column: 30, scope: !445)
!448 = !DILocation(line: 66, column: 25, scope: !445)
!449 = !DILocation(line: 66, column: 11, scope: !441)
!450 = !DILocation(line: 80, column: 58, scope: !451)
!451 = distinct !DILexicalBlock(scope: !445, file: !3, line: 67, column: 11)
!452 = !DILocation(line: 80, column: 61, scope: !451)
!453 = !DILocation(line: 80, column: 89, scope: !451)
!454 = !DILocation(line: 80, column: 92, scope: !451)
!455 = !DILocation(line: 80, column: 87, scope: !451)
!456 = !DILocation(line: 80, column: 124, scope: !451)
!457 = !DILocation(line: 80, column: 127, scope: !451)
!458 = !DILocation(line: 80, column: 122, scope: !451)
!459 = !DILocation(line: 80, column: 159, scope: !451)
!460 = !DILocation(line: 80, column: 162, scope: !451)
!461 = !DILocation(line: 80, column: 157, scope: !451)
!462 = !DILocation(line: 80, column: 194, scope: !451)
!463 = !DILocation(line: 80, column: 197, scope: !451)
!464 = !DILocation(line: 80, column: 192, scope: !451)
!465 = !DILocation(line: 80, column: 229, scope: !451)
!466 = !DILocation(line: 80, column: 232, scope: !451)
!467 = !DILocation(line: 80, column: 227, scope: !451)
!468 = !DILocation(line: 80, column: 264, scope: !451)
!469 = !DILocation(line: 80, column: 267, scope: !451)
!470 = !DILocation(line: 80, column: 262, scope: !451)
!471 = !DILocation(line: 80, column: 55, scope: !451)
!472 = !DILocation(line: 80, column: 13, scope: !451)
!473 = !DILocation(line: 80, column: 19, scope: !451)
!474 = !DILocation(line: 80, column: 45, scope: !451)
!475 = !DILocation(line: 90, column: 11, scope: !451)
!476 = !DILocation(line: 66, column: 36, scope: !445)
!477 = !DILocation(line: 66, column: 11, scope: !445)
!478 = distinct !{!478, !449, !479, !161}
!479 = !DILocation(line: 90, column: 11, scope: !441)
!480 = !DILocation(line: 91, column: 9, scope: !442)
!481 = !DILocation(line: 64, column: 34, scope: !435)
!482 = !DILocation(line: 64, column: 9, scope: !435)
!483 = distinct !{!483, !439, !484, !161}
!484 = !DILocation(line: 91, column: 9, scope: !431)
!485 = !DILocation(line: 92, column: 7, scope: !432)
!486 = !DILocation(line: 62, column: 32, scope: !425)
!487 = !DILocation(line: 62, column: 7, scope: !425)
!488 = distinct !{!488, !429, !489, !161}
!489 = !DILocation(line: 92, column: 7, scope: !422)
!490 = !DILocation(line: 93, column: 18, scope: !367)
!491 = !DILocation(line: 93, column: 16, scope: !367)
!492 = !DILocation(line: 94, column: 12, scope: !367)
!493 = !DILocation(line: 94, column: 10, scope: !367)
!494 = !DILocation(line: 95, column: 15, scope: !367)
!495 = !DILocation(line: 95, column: 13, scope: !367)
!496 = !DILocation(line: 96, column: 11, scope: !497)
!497 = distinct !DILexicalBlock(scope: !367, file: !3, line: 96, column: 11)
!498 = !DILocation(line: 96, column: 13, scope: !497)
!499 = !DILocation(line: 96, column: 18, scope: !497)
!500 = !DILocation(line: 96, column: 11, scope: !367)
!501 = !DILocation(line: 98, column: 34, scope: !502)
!502 = distinct !DILexicalBlock(scope: !497, file: !3, line: 97, column: 7)
!503 = !DILocation(line: 98, column: 9, scope: !502)
!504 = !DILocation(line: 99, column: 16, scope: !505)
!505 = distinct !DILexicalBlock(scope: !502, file: !3, line: 99, column: 9)
!506 = !DILocation(line: 99, column: 14, scope: !505)
!507 = !DILocation(line: 99, column: 25, scope: !508)
!508 = distinct !DILexicalBlock(scope: !505, file: !3, line: 99, column: 9)
!509 = !DILocation(line: 99, column: 29, scope: !508)
!510 = !DILocation(line: 99, column: 27, scope: !508)
!511 = !DILocation(line: 99, column: 9, scope: !505)
!512 = !DILocation(line: 100, column: 18, scope: !513)
!513 = distinct !DILexicalBlock(scope: !508, file: !3, line: 100, column: 11)
!514 = !DILocation(line: 100, column: 16, scope: !513)
!515 = !DILocation(line: 100, column: 27, scope: !516)
!516 = distinct !DILexicalBlock(scope: !513, file: !3, line: 100, column: 11)
!517 = !DILocation(line: 100, column: 31, scope: !516)
!518 = !DILocation(line: 100, column: 29, scope: !516)
!519 = !DILocation(line: 100, column: 11, scope: !513)
!520 = !DILocation(line: 101, column: 20, scope: !521)
!521 = distinct !DILexicalBlock(scope: !516, file: !3, line: 101, column: 13)
!522 = !DILocation(line: 101, column: 18, scope: !521)
!523 = !DILocation(line: 101, column: 29, scope: !524)
!524 = distinct !DILexicalBlock(scope: !521, file: !3, line: 101, column: 13)
!525 = !DILocation(line: 101, column: 33, scope: !524)
!526 = !DILocation(line: 101, column: 31, scope: !524)
!527 = !DILocation(line: 101, column: 13, scope: !521)
!528 = !DILocation(line: 102, column: 33, scope: !524)
!529 = !DILocation(line: 102, column: 36, scope: !524)
!530 = !DILocation(line: 102, column: 15, scope: !524)
!531 = !DILocation(line: 101, column: 38, scope: !524)
!532 = !DILocation(line: 101, column: 13, scope: !524)
!533 = distinct !{!533, !527, !534, !161}
!534 = !DILocation(line: 102, column: 61, scope: !521)
!535 = !DILocation(line: 100, column: 36, scope: !516)
!536 = !DILocation(line: 100, column: 11, scope: !516)
!537 = distinct !{!537, !519, !538, !161}
!538 = !DILocation(line: 102, column: 61, scope: !513)
!539 = !DILocation(line: 99, column: 34, scope: !508)
!540 = !DILocation(line: 99, column: 9, scope: !508)
!541 = distinct !{!541, !511, !542, !161}
!542 = !DILocation(line: 102, column: 61, scope: !505)
!543 = !DILocation(line: 103, column: 9, scope: !502)
!544 = !DILocation(line: 104, column: 7, scope: !502)
!545 = !DILocation(line: 105, column: 5, scope: !367)
!546 = !DILocation(line: 49, column: 34, scope: !361)
!547 = !DILocation(line: 49, column: 5, scope: !361)
!548 = distinct !{!548, !364, !549, !161}
!549 = !DILocation(line: 105, column: 5, scope: !358)
!550 = !DILocation(line: 112, column: 3, scope: !310)
!551 = !DILocation(line: 38, column: 55, scope: !304)
!552 = !DILocation(line: 38, column: 65, scope: !304)
!553 = !DILocation(line: 38, column: 52, scope: !304)
!554 = !DILocation(line: 38, column: 3, scope: !304)
!555 = distinct !{!555, !307, !556, !161}
!556 = !DILocation(line: 112, column: 3, scope: !301)
!557 = !DILocation(line: 113, column: 8, scope: !205)
!558 = !DILocation(line: 113, column: 3, scope: !205)
!559 = !DILocation(line: 114, column: 8, scope: !205)
!560 = !DILocation(line: 114, column: 3, scope: !205)
!561 = !DILocation(line: 115, column: 1, scope: !205)
!562 = distinct !DISubprogram(name: "read_fault_injector_config", scope: !245, file: !245, line: 115, type: !563, scopeLine: 116, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!563 = !DISubroutineType(types: !564)
!564 = !{!244}
!565 = !DILocalVariable(name: "config", scope: !562, file: !245, line: 117, type: !244)
!566 = !DILocation(line: 117, column: 28, scope: !562)
!567 = !DILocalVariable(name: "FIcfgFilePath", scope: !562, file: !245, line: 119, type: !568)
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !569, size: 64)
!569 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!570 = !DILocation(line: 119, column: 17, scope: !562)
!571 = !DILocation(line: 120, column: 19, scope: !562)
!572 = !DILocalVariable(name: "fp", scope: !562, file: !245, line: 122, type: !573)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !574, size: 64)
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !575, line: 7, baseType: !576)
!575 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!576 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !577, line: 49, size: 1728, elements: !578)
!577 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!578 = !{!579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !594, !596, !597, !598, !602, !604, !606, !610, !613, !615, !618, !621, !622, !623, !627, !628}
!579 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !576, file: !577, line: 51, baseType: !7, size: 32)
!580 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !576, file: !577, line: 54, baseType: !15, size: 64, offset: 64)
!581 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !576, file: !577, line: 55, baseType: !15, size: 64, offset: 128)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !576, file: !577, line: 56, baseType: !15, size: 64, offset: 192)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !576, file: !577, line: 57, baseType: !15, size: 64, offset: 256)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !576, file: !577, line: 58, baseType: !15, size: 64, offset: 320)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !576, file: !577, line: 59, baseType: !15, size: 64, offset: 384)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !576, file: !577, line: 60, baseType: !15, size: 64, offset: 448)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !576, file: !577, line: 61, baseType: !15, size: 64, offset: 512)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !576, file: !577, line: 64, baseType: !15, size: 64, offset: 576)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !576, file: !577, line: 65, baseType: !15, size: 64, offset: 640)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !576, file: !577, line: 66, baseType: !15, size: 64, offset: 704)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !576, file: !577, line: 68, baseType: !592, size: 64, offset: 768)
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !593, size: 64)
!593 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !577, line: 36, flags: DIFlagFwdDecl)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !576, file: !577, line: 70, baseType: !595, size: 64, offset: 832)
!595 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !576, size: 64)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !576, file: !577, line: 72, baseType: !7, size: 32, offset: 896)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !576, file: !577, line: 73, baseType: !7, size: 32, offset: 928)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !576, file: !577, line: 74, baseType: !599, size: 64, offset: 960)
!599 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !600, line: 152, baseType: !601)
!600 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!601 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!602 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !576, file: !577, line: 77, baseType: !603, size: 16, offset: 1024)
!603 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!604 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !576, file: !577, line: 78, baseType: !605, size: 8, offset: 1040)
!605 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!606 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !576, file: !577, line: 79, baseType: !607, size: 8, offset: 1048)
!607 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 8, elements: !608)
!608 = !{!609}
!609 = !DISubrange(count: 1)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !576, file: !577, line: 81, baseType: !611, size: 64, offset: 1088)
!611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !612, size: 64)
!612 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !577, line: 43, baseType: null)
!613 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !576, file: !577, line: 89, baseType: !614, size: 64, offset: 1152)
!614 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !600, line: 153, baseType: !601)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !576, file: !577, line: 91, baseType: !616, size: 64, offset: 1216)
!616 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !617, size: 64)
!617 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !577, line: 37, flags: DIFlagFwdDecl)
!618 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !576, file: !577, line: 92, baseType: !619, size: 64, offset: 1280)
!619 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !620, size: 64)
!620 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !577, line: 38, flags: DIFlagFwdDecl)
!621 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !576, file: !577, line: 93, baseType: !595, size: 64, offset: 1344)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !576, file: !577, line: 94, baseType: !14, size: 64, offset: 1408)
!623 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !576, file: !577, line: 95, baseType: !624, size: 64, offset: 1472)
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !625, line: 46, baseType: !626)
!625 = !DIFile(filename: "llvm-project/build/lib/clang/13.0.0/include/stddef.h", directory: "/root/summer_research")
!626 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!627 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !576, file: !577, line: 96, baseType: !7, size: 32, offset: 1536)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !576, file: !577, line: 98, baseType: !629, size: 160, offset: 1568)
!629 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 160, elements: !630)
!630 = !{!631}
!631 = !DISubrange(count: 20)
!632 = !DILocation(line: 122, column: 11, scope: !562)
!633 = !DILocation(line: 122, column: 22, scope: !562)
!634 = !DILocation(line: 122, column: 16, scope: !562)
!635 = !DILocation(line: 123, column: 8, scope: !636)
!636 = distinct !DILexicalBlock(scope: !562, file: !245, line: 123, column: 8)
!637 = !DILocation(line: 123, column: 11, scope: !636)
!638 = !DILocation(line: 123, column: 8, scope: !562)
!639 = !DILocation(line: 125, column: 9, scope: !640)
!640 = distinct !DILexicalBlock(scope: !636, file: !245, line: 124, column: 5)
!641 = !DILocation(line: 126, column: 9, scope: !640)
!642 = !DILocalVariable(name: "chunk", scope: !562, file: !245, line: 129, type: !643)
!643 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 2048, elements: !644)
!644 = !{!645}
!645 = !DISubrange(count: 256)
!646 = !DILocation(line: 129, column: 10, scope: !562)
!647 = !DILocation(line: 132, column: 5, scope: !562)
!648 = !DILocation(line: 132, column: 17, scope: !562)
!649 = !DILocation(line: 132, column: 41, scope: !562)
!650 = !DILocation(line: 132, column: 11, scope: !562)
!651 = !DILocation(line: 132, column: 45, scope: !562)
!652 = !DILocation(line: 134, column: 12, scope: !653)
!653 = distinct !DILexicalBlock(scope: !654, file: !245, line: 134, column: 12)
!654 = distinct !DILexicalBlock(scope: !562, file: !245, line: 133, column: 5)
!655 = !DILocation(line: 134, column: 21, scope: !653)
!656 = !DILocation(line: 134, column: 29, scope: !653)
!657 = !DILocation(line: 134, column: 32, scope: !653)
!658 = !DILocation(line: 134, column: 41, scope: !653)
!659 = !DILocation(line: 134, column: 12, scope: !654)
!660 = !DILocalVariable(name: "count_non_space_length", scope: !661, file: !245, line: 137, type: !7)
!661 = distinct !DILexicalBlock(scope: !653, file: !245, line: 135, column: 9)
!662 = !DILocation(line: 137, column: 17, scope: !661)
!663 = !DILocalVariable(name: "i", scope: !664, file: !245, line: 138, type: !7)
!664 = distinct !DILexicalBlock(scope: !661, file: !245, line: 138, column: 13)
!665 = !DILocation(line: 138, column: 21, scope: !664)
!666 = !DILocation(line: 138, column: 17, scope: !664)
!667 = !DILocation(line: 138, column: 26, scope: !668)
!668 = distinct !DILexicalBlock(scope: !664, file: !245, line: 138, column: 13)
!669 = !DILocation(line: 138, column: 35, scope: !668)
!670 = !DILocation(line: 138, column: 28, scope: !668)
!671 = !DILocation(line: 138, column: 27, scope: !668)
!672 = !DILocation(line: 138, column: 13, scope: !664)
!673 = !DILocation(line: 140, column: 26, scope: !674)
!674 = distinct !DILexicalBlock(scope: !675, file: !245, line: 140, column: 20)
!675 = distinct !DILexicalBlock(scope: !668, file: !245, line: 139, column: 13)
!676 = !DILocation(line: 140, column: 20, scope: !674)
!677 = !DILocation(line: 140, column: 29, scope: !674)
!678 = !DILocation(line: 140, column: 36, scope: !674)
!679 = !DILocation(line: 140, column: 45, scope: !674)
!680 = !DILocation(line: 140, column: 39, scope: !674)
!681 = !DILocation(line: 140, column: 48, scope: !674)
!682 = !DILocation(line: 140, column: 20, scope: !675)
!683 = !DILocation(line: 141, column: 43, scope: !674)
!684 = !DILocation(line: 141, column: 21, scope: !674)
!685 = !DILocation(line: 142, column: 13, scope: !675)
!686 = !DILocation(line: 138, column: 44, scope: !668)
!687 = !DILocation(line: 138, column: 13, scope: !668)
!688 = distinct !{!688, !672, !689, !161}
!689 = !DILocation(line: 142, column: 13, scope: !664)
!690 = !DILocalVariable(name: "temp1", scope: !661, file: !245, line: 143, type: !15)
!691 = !DILocation(line: 143, column: 19, scope: !661)
!692 = !DILocation(line: 143, column: 34, scope: !661)
!693 = !DILocalVariable(name: "index", scope: !661, file: !245, line: 144, type: !7)
!694 = !DILocation(line: 144, column: 17, scope: !661)
!695 = !DILocalVariable(name: "i", scope: !696, file: !245, line: 145, type: !7)
!696 = distinct !DILexicalBlock(scope: !661, file: !245, line: 145, column: 13)
!697 = !DILocation(line: 145, column: 21, scope: !696)
!698 = !DILocation(line: 145, column: 17, scope: !696)
!699 = !DILocation(line: 145, column: 26, scope: !700)
!700 = distinct !DILexicalBlock(scope: !696, file: !245, line: 145, column: 13)
!701 = !DILocation(line: 145, column: 35, scope: !700)
!702 = !DILocation(line: 145, column: 28, scope: !700)
!703 = !DILocation(line: 145, column: 27, scope: !700)
!704 = !DILocation(line: 145, column: 13, scope: !696)
!705 = !DILocation(line: 147, column: 26, scope: !706)
!706 = distinct !DILexicalBlock(scope: !707, file: !245, line: 147, column: 20)
!707 = distinct !DILexicalBlock(scope: !700, file: !245, line: 146, column: 13)
!708 = !DILocation(line: 147, column: 20, scope: !706)
!709 = !DILocation(line: 147, column: 29, scope: !706)
!710 = !DILocation(line: 147, column: 36, scope: !706)
!711 = !DILocation(line: 147, column: 45, scope: !706)
!712 = !DILocation(line: 147, column: 39, scope: !706)
!713 = !DILocation(line: 147, column: 48, scope: !706)
!714 = !DILocation(line: 147, column: 20, scope: !707)
!715 = !DILocation(line: 148, column: 21, scope: !706)
!716 = !DILocation(line: 149, column: 38, scope: !707)
!717 = !DILocation(line: 149, column: 32, scope: !707)
!718 = !DILocation(line: 149, column: 17, scope: !707)
!719 = !DILocation(line: 149, column: 23, scope: !707)
!720 = !DILocation(line: 149, column: 30, scope: !707)
!721 = !DILocation(line: 150, column: 22, scope: !707)
!722 = !DILocation(line: 151, column: 13, scope: !707)
!723 = !DILocation(line: 145, column: 44, scope: !700)
!724 = !DILocation(line: 145, column: 13, scope: !700)
!725 = distinct !{!725, !704, !726, !161}
!726 = !DILocation(line: 151, column: 13, scope: !696)
!727 = !DILocation(line: 152, column: 13, scope: !661)
!728 = !DILocation(line: 152, column: 19, scope: !661)
!729 = !DILocation(line: 152, column: 26, scope: !661)
!730 = !DILocation(line: 157, column: 23, scope: !731)
!731 = distinct !DILexicalBlock(scope: !661, file: !245, line: 157, column: 16)
!732 = !DILocation(line: 157, column: 16, scope: !731)
!733 = !DILocation(line: 157, column: 16, scope: !661)
!734 = !DILocalVariable(name: "temp2", scope: !735, file: !245, line: 159, type: !15)
!735 = distinct !DILexicalBlock(scope: !731, file: !245, line: 158, column: 13)
!736 = !DILocation(line: 159, column: 20, scope: !735)
!737 = !DILocation(line: 159, column: 35, scope: !735)
!738 = !DILocation(line: 159, column: 28, scope: !735)
!739 = !DILocation(line: 160, column: 16, scope: !735)
!740 = !DILocation(line: 161, column: 27, scope: !735)
!741 = !DILocation(line: 161, column: 22, scope: !735)
!742 = !DILocation(line: 161, column: 18, scope: !735)
!743 = !DILocation(line: 161, column: 20, scope: !735)
!744 = !DILocation(line: 162, column: 13, scope: !735)
!745 = !DILocation(line: 165, column: 20, scope: !746)
!746 = distinct !DILexicalBlock(scope: !661, file: !245, line: 165, column: 13)
!747 = !DILocation(line: 165, column: 13, scope: !746)
!748 = !DILocation(line: 165, column: 13, scope: !661)
!749 = !DILocalVariable(name: "temp2", scope: !750, file: !245, line: 167, type: !15)
!750 = distinct !DILexicalBlock(scope: !746, file: !245, line: 166, column: 10)
!751 = !DILocation(line: 167, column: 17, scope: !750)
!752 = !DILocation(line: 167, column: 32, scope: !750)
!753 = !DILocation(line: 167, column: 25, scope: !750)
!754 = !DILocation(line: 168, column: 16, scope: !750)
!755 = !DILocation(line: 169, column: 27, scope: !750)
!756 = !DILocation(line: 169, column: 22, scope: !750)
!757 = !DILocation(line: 169, column: 18, scope: !750)
!758 = !DILocation(line: 169, column: 20, scope: !750)
!759 = !DILocation(line: 170, column: 10, scope: !750)
!760 = !DILocation(line: 173, column: 20, scope: !761)
!761 = distinct !DILexicalBlock(scope: !661, file: !245, line: 173, column: 13)
!762 = !DILocation(line: 173, column: 13, scope: !761)
!763 = !DILocation(line: 173, column: 13, scope: !661)
!764 = !DILocalVariable(name: "temp2", scope: !765, file: !245, line: 175, type: !15)
!765 = distinct !DILexicalBlock(scope: !761, file: !245, line: 174, column: 10)
!766 = !DILocation(line: 175, column: 17, scope: !765)
!767 = !DILocation(line: 175, column: 32, scope: !765)
!768 = !DILocation(line: 175, column: 25, scope: !765)
!769 = !DILocation(line: 176, column: 16, scope: !765)
!770 = !DILocation(line: 177, column: 27, scope: !765)
!771 = !DILocation(line: 177, column: 22, scope: !765)
!772 = !DILocation(line: 177, column: 18, scope: !765)
!773 = !DILocation(line: 177, column: 20, scope: !765)
!774 = !DILocation(line: 178, column: 10, scope: !765)
!775 = !DILocation(line: 181, column: 23, scope: !776)
!776 = distinct !DILexicalBlock(scope: !661, file: !245, line: 181, column: 16)
!777 = !DILocation(line: 181, column: 16, scope: !776)
!778 = !DILocation(line: 181, column: 16, scope: !661)
!779 = !DILocalVariable(name: "temp2", scope: !780, file: !245, line: 183, type: !15)
!780 = distinct !DILexicalBlock(scope: !776, file: !245, line: 182, column: 13)
!781 = !DILocation(line: 183, column: 23, scope: !780)
!782 = !DILocation(line: 183, column: 38, scope: !780)
!783 = !DILocation(line: 183, column: 31, scope: !780)
!784 = !DILocation(line: 184, column: 22, scope: !780)
!785 = !DILocation(line: 185, column: 37, scope: !780)
!786 = !DILocation(line: 185, column: 32, scope: !780)
!787 = !DILocation(line: 185, column: 24, scope: !780)
!788 = !DILocation(line: 185, column: 30, scope: !780)
!789 = !DILocation(line: 186, column: 13, scope: !780)
!790 = !DILocation(line: 189, column: 23, scope: !791)
!791 = distinct !DILexicalBlock(scope: !661, file: !245, line: 189, column: 16)
!792 = !DILocation(line: 189, column: 16, scope: !791)
!793 = !DILocation(line: 189, column: 16, scope: !661)
!794 = !DILocalVariable(name: "temp2", scope: !795, file: !245, line: 191, type: !15)
!795 = distinct !DILexicalBlock(scope: !791, file: !245, line: 190, column: 13)
!796 = !DILocation(line: 191, column: 23, scope: !795)
!797 = !DILocation(line: 191, column: 38, scope: !795)
!798 = !DILocation(line: 191, column: 31, scope: !795)
!799 = !DILocation(line: 192, column: 22, scope: !795)
!800 = !DILocation(line: 193, column: 37, scope: !795)
!801 = !DILocation(line: 193, column: 32, scope: !795)
!802 = !DILocation(line: 193, column: 24, scope: !795)
!803 = !DILocation(line: 193, column: 30, scope: !795)
!804 = !DILocation(line: 194, column: 13, scope: !795)
!805 = !DILocation(line: 197, column: 23, scope: !806)
!806 = distinct !DILexicalBlock(scope: !661, file: !245, line: 197, column: 16)
!807 = !DILocation(line: 197, column: 16, scope: !806)
!808 = !DILocation(line: 197, column: 16, scope: !661)
!809 = !DILocalVariable(name: "temp2", scope: !810, file: !245, line: 199, type: !15)
!810 = distinct !DILexicalBlock(scope: !806, file: !245, line: 198, column: 13)
!811 = !DILocation(line: 199, column: 23, scope: !810)
!812 = !DILocation(line: 199, column: 38, scope: !810)
!813 = !DILocation(line: 199, column: 31, scope: !810)
!814 = !DILocation(line: 200, column: 22, scope: !810)
!815 = !DILocation(line: 201, column: 42, scope: !810)
!816 = !DILocation(line: 201, column: 37, scope: !810)
!817 = !DILocation(line: 201, column: 24, scope: !810)
!818 = !DILocation(line: 201, column: 35, scope: !810)
!819 = !DILocation(line: 202, column: 13, scope: !810)
!820 = !DILocation(line: 205, column: 23, scope: !821)
!821 = distinct !DILexicalBlock(scope: !661, file: !245, line: 205, column: 16)
!822 = !DILocation(line: 205, column: 16, scope: !821)
!823 = !DILocation(line: 205, column: 16, scope: !661)
!824 = !DILocalVariable(name: "temp2", scope: !825, file: !245, line: 207, type: !15)
!825 = distinct !DILexicalBlock(scope: !821, file: !245, line: 206, column: 13)
!826 = !DILocation(line: 207, column: 23, scope: !825)
!827 = !DILocation(line: 207, column: 38, scope: !825)
!828 = !DILocation(line: 207, column: 31, scope: !825)
!829 = !DILocation(line: 208, column: 22, scope: !825)
!830 = !DILocation(line: 209, column: 31, scope: !825)
!831 = !DILocation(line: 209, column: 24, scope: !825)
!832 = !DILocation(line: 209, column: 43, scope: !825)
!833 = !DILocation(line: 209, column: 17, scope: !825)
!834 = !DILocation(line: 210, column: 13, scope: !825)
!835 = !DILocation(line: 213, column: 30, scope: !836)
!836 = distinct !DILexicalBlock(scope: !661, file: !245, line: 213, column: 16)
!837 = !DILocation(line: 213, column: 23, scope: !836)
!838 = !DILocation(line: 213, column: 16, scope: !836)
!839 = !DILocation(line: 213, column: 49, scope: !836)
!840 = !DILocation(line: 213, column: 59, scope: !836)
!841 = !DILocation(line: 213, column: 52, scope: !836)
!842 = !DILocation(line: 213, column: 16, scope: !661)
!843 = !DILocalVariable(name: "temp2", scope: !844, file: !245, line: 215, type: !15)
!844 = distinct !DILexicalBlock(scope: !836, file: !245, line: 214, column: 13)
!845 = !DILocation(line: 215, column: 23, scope: !844)
!846 = !DILocation(line: 215, column: 38, scope: !844)
!847 = !DILocation(line: 215, column: 31, scope: !844)
!848 = !DILocation(line: 216, column: 22, scope: !844)
!849 = !DILocation(line: 217, column: 43, scope: !844)
!850 = !DILocation(line: 217, column: 38, scope: !844)
!851 = !DILocation(line: 217, column: 24, scope: !844)
!852 = !DILocation(line: 217, column: 36, scope: !844)
!853 = !DILocation(line: 218, column: 31, scope: !844)
!854 = !DILocation(line: 218, column: 24, scope: !844)
!855 = !DILocation(line: 218, column: 47, scope: !844)
!856 = !DILocation(line: 218, column: 17, scope: !844)
!857 = !DILocation(line: 219, column: 13, scope: !844)
!858 = !DILocation(line: 222, column: 30, scope: !859)
!859 = distinct !DILexicalBlock(scope: !661, file: !245, line: 222, column: 16)
!860 = !DILocation(line: 222, column: 23, scope: !859)
!861 = !DILocation(line: 222, column: 16, scope: !859)
!862 = !DILocation(line: 222, column: 49, scope: !859)
!863 = !DILocation(line: 222, column: 59, scope: !859)
!864 = !DILocation(line: 222, column: 52, scope: !859)
!865 = !DILocation(line: 222, column: 16, scope: !661)
!866 = !DILocalVariable(name: "temp2", scope: !867, file: !245, line: 224, type: !15)
!867 = distinct !DILexicalBlock(scope: !859, file: !245, line: 223, column: 13)
!868 = !DILocation(line: 224, column: 23, scope: !867)
!869 = !DILocation(line: 224, column: 38, scope: !867)
!870 = !DILocation(line: 224, column: 31, scope: !867)
!871 = !DILocation(line: 225, column: 22, scope: !867)
!872 = !DILocation(line: 226, column: 43, scope: !867)
!873 = !DILocation(line: 226, column: 38, scope: !867)
!874 = !DILocation(line: 226, column: 24, scope: !867)
!875 = !DILocation(line: 226, column: 36, scope: !867)
!876 = !DILocation(line: 227, column: 31, scope: !867)
!877 = !DILocation(line: 227, column: 24, scope: !867)
!878 = !DILocation(line: 227, column: 47, scope: !867)
!879 = !DILocation(line: 227, column: 17, scope: !867)
!880 = !DILocation(line: 228, column: 13, scope: !867)
!881 = !DILocation(line: 230, column: 18, scope: !661)
!882 = !DILocation(line: 230, column: 13, scope: !661)
!883 = !DILocation(line: 231, column: 9, scope: !661)
!884 = distinct !{!884, !647, !885, !161}
!885 = !DILocation(line: 232, column: 5, scope: !562)
!886 = !DILocation(line: 234, column: 12, scope: !562)
!887 = !DILocation(line: 234, column: 5, scope: !562)
!888 = !DILocation(line: 236, column: 5, scope: !562)
!889 = distinct !DISubprogram(name: "overwrite_sz_config", scope: !245, file: !245, line: 246, type: !890, scopeLine: 247, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!890 = !DISubroutineType(types: !891)
!891 = !{null, !244}
!892 = !DILocalVariable(name: "config", arg: 1, scope: !889, file: !245, line: 246, type: !244)
!893 = !DILocation(line: 246, column: 49, scope: !889)
!894 = !DILocalVariable(name: "fPtr", scope: !889, file: !245, line: 248, type: !573)
!895 = !DILocation(line: 248, column: 11, scope: !889)
!896 = !DILocalVariable(name: "fTemp", scope: !889, file: !245, line: 249, type: !573)
!897 = !DILocation(line: 249, column: 11, scope: !889)
!898 = !DILocalVariable(name: "SZFIcfgFilePath", scope: !889, file: !245, line: 250, type: !568)
!899 = !DILocation(line: 250, column: 17, scope: !889)
!900 = !DILocation(line: 251, column: 21, scope: !889)
!901 = !DILocalVariable(name: "buffer", scope: !889, file: !245, line: 252, type: !643)
!902 = !DILocation(line: 252, column: 10, scope: !889)
!903 = !DILocation(line: 255, column: 19, scope: !889)
!904 = !DILocation(line: 255, column: 13, scope: !889)
!905 = !DILocation(line: 255, column: 11, scope: !889)
!906 = !DILocation(line: 256, column: 13, scope: !889)
!907 = !DILocation(line: 256, column: 11, scope: !889)
!908 = !DILocation(line: 259, column: 8, scope: !909)
!909 = distinct !DILexicalBlock(scope: !889, file: !245, line: 259, column: 8)
!910 = !DILocation(line: 259, column: 13, scope: !909)
!911 = !DILocation(line: 259, column: 21, scope: !909)
!912 = !DILocation(line: 259, column: 24, scope: !909)
!913 = !DILocation(line: 259, column: 30, scope: !909)
!914 = !DILocation(line: 259, column: 8, scope: !889)
!915 = !DILocation(line: 261, column: 9, scope: !916)
!916 = distinct !DILexicalBlock(scope: !909, file: !245, line: 260, column: 5)
!917 = !DILocation(line: 262, column: 9, scope: !916)
!918 = !DILocation(line: 266, column: 5, scope: !889)
!919 = !DILocation(line: 266, column: 17, scope: !889)
!920 = !DILocation(line: 266, column: 42, scope: !889)
!921 = !DILocation(line: 266, column: 11, scope: !889)
!922 = !DILocation(line: 266, column: 48, scope: !889)
!923 = !DILocation(line: 269, column: 19, scope: !924)
!924 = distinct !DILexicalBlock(scope: !925, file: !245, line: 269, column: 12)
!925 = distinct !DILexicalBlock(scope: !889, file: !245, line: 267, column: 5)
!926 = !DILocation(line: 269, column: 12, scope: !924)
!927 = !DILocation(line: 269, column: 48, scope: !924)
!928 = !DILocation(line: 269, column: 51, scope: !924)
!929 = !DILocation(line: 269, column: 61, scope: !924)
!930 = !DILocation(line: 269, column: 12, scope: !925)
!931 = !DILocation(line: 271, column: 30, scope: !932)
!932 = distinct !DILexicalBlock(scope: !933, file: !245, line: 271, column: 16)
!933 = distinct !DILexicalBlock(scope: !924, file: !245, line: 270, column: 9)
!934 = !DILocation(line: 271, column: 23, scope: !932)
!935 = !DILocation(line: 271, column: 16, scope: !932)
!936 = !DILocation(line: 271, column: 16, scope: !933)
!937 = !DILocation(line: 273, column: 49, scope: !938)
!938 = distinct !DILexicalBlock(scope: !932, file: !245, line: 272, column: 13)
!939 = !DILocation(line: 273, column: 17, scope: !938)
!940 = !DILocation(line: 274, column: 13, scope: !938)
!941 = !DILocation(line: 275, column: 35, scope: !942)
!942 = distinct !DILexicalBlock(scope: !932, file: !245, line: 275, column: 21)
!943 = !DILocation(line: 275, column: 28, scope: !942)
!944 = !DILocation(line: 275, column: 21, scope: !942)
!945 = !DILocation(line: 275, column: 21, scope: !932)
!946 = !DILocation(line: 277, column: 49, scope: !947)
!947 = distinct !DILexicalBlock(scope: !942, file: !245, line: 276, column: 13)
!948 = !DILocation(line: 277, column: 17, scope: !947)
!949 = !DILocation(line: 278, column: 13, scope: !947)
!950 = !DILocation(line: 279, column: 9, scope: !933)
!951 = !DILocation(line: 281, column: 24, scope: !952)
!952 = distinct !DILexicalBlock(scope: !924, file: !245, line: 281, column: 17)
!953 = !DILocation(line: 281, column: 17, scope: !952)
!954 = !DILocation(line: 281, column: 50, scope: !952)
!955 = !DILocation(line: 281, column: 53, scope: !952)
!956 = !DILocation(line: 281, column: 63, scope: !952)
!957 = !DILocation(line: 281, column: 17, scope: !924)
!958 = !DILocation(line: 283, column: 30, scope: !959)
!959 = distinct !DILexicalBlock(scope: !960, file: !245, line: 283, column: 16)
!960 = distinct !DILexicalBlock(scope: !952, file: !245, line: 282, column: 9)
!961 = !DILocation(line: 283, column: 23, scope: !959)
!962 = !DILocation(line: 283, column: 16, scope: !959)
!963 = !DILocation(line: 283, column: 16, scope: !960)
!964 = !DILocalVariable(name: "temp_buffer", scope: !965, file: !245, line: 285, type: !966)
!965 = distinct !DILexicalBlock(scope: !959, file: !245, line: 284, column: 13)
!966 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !967)
!967 = !{!968}
!968 = !DISubrange(count: 40)
!969 = !DILocation(line: 285, column: 22, scope: !965)
!970 = !DILocation(line: 286, column: 24, scope: !965)
!971 = !DILocation(line: 286, column: 44, scope: !965)
!972 = !DILocation(line: 286, column: 37, scope: !965)
!973 = !DILocation(line: 286, column: 17, scope: !965)
!974 = !DILocation(line: 287, column: 36, scope: !965)
!975 = !DILocation(line: 287, column: 29, scope: !965)
!976 = !DILocation(line: 287, column: 17, scope: !965)
!977 = !DILocation(line: 287, column: 50, scope: !965)
!978 = !DILocation(line: 288, column: 23, scope: !965)
!979 = !DILocation(line: 288, column: 36, scope: !965)
!980 = !DILocation(line: 288, column: 17, scope: !965)
!981 = !DILocation(line: 289, column: 13, scope: !965)
!982 = !DILocation(line: 292, column: 23, scope: !983)
!983 = distinct !DILexicalBlock(scope: !959, file: !245, line: 291, column: 13)
!984 = !DILocation(line: 292, column: 31, scope: !983)
!985 = !DILocation(line: 292, column: 17, scope: !983)
!986 = !DILocation(line: 294, column: 9, scope: !960)
!987 = !DILocation(line: 296, column: 24, scope: !988)
!988 = distinct !DILexicalBlock(scope: !952, file: !245, line: 296, column: 17)
!989 = !DILocation(line: 296, column: 17, scope: !988)
!990 = !DILocation(line: 296, column: 52, scope: !988)
!991 = !DILocation(line: 296, column: 55, scope: !988)
!992 = !DILocation(line: 296, column: 65, scope: !988)
!993 = !DILocation(line: 296, column: 72, scope: !988)
!994 = !DILocation(line: 296, column: 75, scope: !988)
!995 = !DILocation(line: 296, column: 85, scope: !988)
!996 = !DILocation(line: 296, column: 17, scope: !952)
!997 = !DILocation(line: 298, column: 30, scope: !998)
!998 = distinct !DILexicalBlock(scope: !999, file: !245, line: 298, column: 16)
!999 = distinct !DILexicalBlock(scope: !988, file: !245, line: 297, column: 9)
!1000 = !DILocation(line: 298, column: 23, scope: !998)
!1001 = !DILocation(line: 298, column: 16, scope: !998)
!1002 = !DILocation(line: 298, column: 16, scope: !999)
!1003 = !DILocalVariable(name: "temp_buffer", scope: !1004, file: !245, line: 300, type: !966)
!1004 = distinct !DILexicalBlock(scope: !998, file: !245, line: 299, column: 13)
!1005 = !DILocation(line: 300, column: 22, scope: !1004)
!1006 = !DILocation(line: 301, column: 24, scope: !1004)
!1007 = !DILocation(line: 301, column: 44, scope: !1004)
!1008 = !DILocation(line: 301, column: 37, scope: !1004)
!1009 = !DILocation(line: 301, column: 17, scope: !1004)
!1010 = !DILocation(line: 302, column: 36, scope: !1004)
!1011 = !DILocation(line: 302, column: 29, scope: !1004)
!1012 = !DILocation(line: 302, column: 17, scope: !1004)
!1013 = !DILocation(line: 302, column: 50, scope: !1004)
!1014 = !DILocation(line: 303, column: 23, scope: !1004)
!1015 = !DILocation(line: 303, column: 36, scope: !1004)
!1016 = !DILocation(line: 303, column: 17, scope: !1004)
!1017 = !DILocation(line: 304, column: 13, scope: !1004)
!1018 = !DILocation(line: 307, column: 23, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !998, file: !245, line: 306, column: 13)
!1020 = !DILocation(line: 307, column: 31, scope: !1019)
!1021 = !DILocation(line: 307, column: 17, scope: !1019)
!1022 = !DILocation(line: 309, column: 9, scope: !999)
!1023 = !DILocation(line: 312, column: 19, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !988, file: !245, line: 311, column: 9)
!1025 = !DILocation(line: 312, column: 27, scope: !1024)
!1026 = !DILocation(line: 312, column: 13, scope: !1024)
!1027 = distinct !{!1027, !918, !1028, !161}
!1028 = !DILocation(line: 314, column: 5, scope: !889)
!1029 = !DILocation(line: 316, column: 12, scope: !889)
!1030 = !DILocation(line: 316, column: 5, scope: !889)
!1031 = !DILocation(line: 317, column: 12, scope: !889)
!1032 = !DILocation(line: 317, column: 5, scope: !889)
!1033 = !DILocation(line: 320, column: 12, scope: !889)
!1034 = !DILocation(line: 320, column: 5, scope: !889)
!1035 = !DILocation(line: 323, column: 38, scope: !889)
!1036 = !DILocation(line: 323, column: 5, scope: !889)
!1037 = !DILocation(line: 324, column: 1, scope: !889)
!1038 = distinct !DISubprogram(name: "SZ_fault_generator_1D", scope: !245, file: !245, line: 73, type: !1039, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!12, !7, !12}
!1041 = !DILocalVariable(name: "length", arg: 1, scope: !1038, file: !245, line: 73, type: !7)
!1042 = !DILocation(line: 73, column: 36, scope: !1038)
!1043 = !DILocalVariable(name: "ori_data", arg: 2, scope: !1038, file: !245, line: 73, type: !12)
!1044 = !DILocation(line: 73, column: 53, scope: !1038)
!1045 = !DILocalVariable(name: "SZcfgFilePath", scope: !1038, file: !245, line: 75, type: !568)
!1046 = !DILocation(line: 75, column: 17, scope: !1038)
!1047 = !DILocalVariable(name: "start_time1", scope: !1038, file: !245, line: 76, type: !13)
!1048 = !DILocation(line: 76, column: 12, scope: !1038)
!1049 = !DILocalVariable(name: "start_time2", scope: !1038, file: !245, line: 77, type: !13)
!1050 = !DILocation(line: 77, column: 12, scope: !1038)
!1051 = !DILocalVariable(name: "compression_time", scope: !1038, file: !245, line: 78, type: !13)
!1052 = !DILocation(line: 78, column: 12, scope: !1038)
!1053 = !DILocalVariable(name: "decompression_time", scope: !1038, file: !245, line: 79, type: !13)
!1054 = !DILocation(line: 79, column: 12, scope: !1038)
!1055 = !DILocation(line: 81, column: 19, scope: !1038)
!1056 = !DILocalVariable(name: "status", scope: !1038, file: !245, line: 82, type: !7)
!1057 = !DILocation(line: 82, column: 9, scope: !1038)
!1058 = !DILocation(line: 82, column: 26, scope: !1038)
!1059 = !DILocation(line: 82, column: 18, scope: !1038)
!1060 = !DILocation(line: 84, column: 8, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1038, file: !245, line: 84, column: 8)
!1062 = !DILocation(line: 84, column: 15, scope: !1061)
!1063 = !DILocation(line: 84, column: 8, scope: !1038)
!1064 = !DILocation(line: 86, column: 9, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1061, file: !245, line: 85, column: 5)
!1066 = !DILocation(line: 87, column: 9, scope: !1065)
!1067 = !DILocalVariable(name: "tar_data", scope: !1038, file: !245, line: 90, type: !12)
!1068 = !DILocation(line: 90, column: 13, scope: !1038)
!1069 = !DILocation(line: 90, column: 40, scope: !1038)
!1070 = !DILocation(line: 90, column: 46, scope: !1038)
!1071 = !DILocation(line: 90, column: 33, scope: !1038)
!1072 = !DILocation(line: 90, column: 24, scope: !1038)
!1073 = !DILocalVariable(name: "SZ_compressed_size", scope: !1038, file: !245, line: 91, type: !624)
!1074 = !DILocation(line: 91, column: 12, scope: !1038)
!1075 = !DILocalVariable(name: "r1", scope: !1038, file: !245, line: 92, type: !624)
!1076 = !DILocation(line: 92, column: 12, scope: !1038)
!1077 = !DILocation(line: 92, column: 17, scope: !1038)
!1078 = !DILocalVariable(name: "r2", scope: !1038, file: !245, line: 92, type: !624)
!1079 = !DILocation(line: 92, column: 25, scope: !1038)
!1080 = !DILocalVariable(name: "r3", scope: !1038, file: !245, line: 92, type: !624)
!1081 = !DILocation(line: 92, column: 33, scope: !1038)
!1082 = !DILocalVariable(name: "r4", scope: !1038, file: !245, line: 92, type: !624)
!1083 = !DILocation(line: 92, column: 41, scope: !1038)
!1084 = !DILocalVariable(name: "r5", scope: !1038, file: !245, line: 92, type: !624)
!1085 = !DILocation(line: 92, column: 49, scope: !1038)
!1086 = !DILocation(line: 95, column: 17, scope: !1038)
!1087 = !DILocation(line: 95, column: 16, scope: !1038)
!1088 = !DILocalVariable(name: "bytes", scope: !1038, file: !245, line: 96, type: !1089)
!1089 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1090, size: 64)
!1090 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1091 = !DILocation(line: 96, column: 17, scope: !1038)
!1092 = !DILocation(line: 96, column: 48, scope: !1038)
!1093 = !DILocation(line: 96, column: 79, scope: !1038)
!1094 = !DILocation(line: 96, column: 83, scope: !1038)
!1095 = !DILocation(line: 96, column: 87, scope: !1038)
!1096 = !DILocation(line: 96, column: 91, scope: !1038)
!1097 = !DILocation(line: 96, column: 95, scope: !1038)
!1098 = !DILocation(line: 96, column: 25, scope: !1038)
!1099 = !DILocation(line: 97, column: 20, scope: !1038)
!1100 = !DILocation(line: 97, column: 30, scope: !1038)
!1101 = !DILocation(line: 97, column: 29, scope: !1038)
!1102 = !DILocation(line: 97, column: 18, scope: !1038)
!1103 = !DILocation(line: 100, column: 17, scope: !1038)
!1104 = !DILocation(line: 100, column: 16, scope: !1038)
!1105 = !DILocalVariable(name: "SZ_decompressed_size", scope: !1038, file: !245, line: 101, type: !624)
!1106 = !DILocation(line: 101, column: 9, scope: !1038)
!1107 = !DILocation(line: 101, column: 62, scope: !1038)
!1108 = !DILocation(line: 101, column: 69, scope: !1038)
!1109 = !DILocation(line: 101, column: 89, scope: !1038)
!1110 = !DILocation(line: 101, column: 99, scope: !1038)
!1111 = !DILocation(line: 101, column: 103, scope: !1038)
!1112 = !DILocation(line: 101, column: 107, scope: !1038)
!1113 = !DILocation(line: 101, column: 111, scope: !1038)
!1114 = !DILocation(line: 101, column: 115, scope: !1038)
!1115 = !DILocation(line: 101, column: 32, scope: !1038)
!1116 = !DILocation(line: 102, column: 22, scope: !1038)
!1117 = !DILocation(line: 102, column: 32, scope: !1038)
!1118 = !DILocation(line: 102, column: 31, scope: !1038)
!1119 = !DILocation(line: 102, column: 20, scope: !1038)
!1120 = !DILocation(line: 104, column: 2, scope: !1038)
!1121 = !DILocation(line: 106, column: 9, scope: !1038)
!1122 = !DILocation(line: 106, column: 2, scope: !1038)
!1123 = distinct !DISubprogram(name: "mytimer", scope: !245, file: !245, line: 57, type: !1124, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{!13}
!1126 = !DILocalVariable(name: "ruse", scope: !1123, file: !245, line: 59, type: !1127)
!1127 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rusage", file: !1128, line: 33, size: 1152, elements: !1129)
!1128 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_rusage.h", directory: "")
!1129 = !{!1130, !1138, !1139, !1145, !1150, !1155, !1160, !1165, !1170, !1175, !1180, !1185, !1190, !1195, !1200, !1205}
!1130 = !DIDerivedType(tag: DW_TAG_member, name: "ru_utime", scope: !1127, file: !1128, line: 36, baseType: !1131, size: 128)
!1131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !1132, line: 8, size: 128, elements: !1133)
!1132 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "")
!1133 = !{!1134, !1136}
!1134 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1131, file: !1132, line: 10, baseType: !1135, size: 64)
!1135 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !600, line: 160, baseType: !601)
!1136 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !1131, file: !1132, line: 11, baseType: !1137, size: 64, offset: 64)
!1137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !600, line: 162, baseType: !601)
!1138 = !DIDerivedType(tag: DW_TAG_member, name: "ru_stime", scope: !1127, file: !1128, line: 38, baseType: !1131, size: 128, offset: 128)
!1139 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 40, baseType: !1140, size: 64, offset: 256)
!1140 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 40, size: 64, elements: !1141)
!1141 = !{!1142, !1143}
!1142 = !DIDerivedType(tag: DW_TAG_member, name: "ru_maxrss", scope: !1140, file: !1128, line: 42, baseType: !601, size: 64)
!1143 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_maxrss_word", scope: !1140, file: !1128, line: 43, baseType: !1144, size: 64)
!1144 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !600, line: 196, baseType: !601)
!1145 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 47, baseType: !1146, size: 64, offset: 320)
!1146 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 47, size: 64, elements: !1147)
!1147 = !{!1148, !1149}
!1148 = !DIDerivedType(tag: DW_TAG_member, name: "ru_ixrss", scope: !1146, file: !1128, line: 49, baseType: !601, size: 64)
!1149 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_ixrss_word", scope: !1146, file: !1128, line: 50, baseType: !1144, size: 64)
!1150 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 53, baseType: !1151, size: 64, offset: 384)
!1151 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 53, size: 64, elements: !1152)
!1152 = !{!1153, !1154}
!1153 = !DIDerivedType(tag: DW_TAG_member, name: "ru_idrss", scope: !1151, file: !1128, line: 55, baseType: !601, size: 64)
!1154 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_idrss_word", scope: !1151, file: !1128, line: 56, baseType: !1144, size: 64)
!1155 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 59, baseType: !1156, size: 64, offset: 448)
!1156 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 59, size: 64, elements: !1157)
!1157 = !{!1158, !1159}
!1158 = !DIDerivedType(tag: DW_TAG_member, name: "ru_isrss", scope: !1156, file: !1128, line: 61, baseType: !601, size: 64)
!1159 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_isrss_word", scope: !1156, file: !1128, line: 62, baseType: !1144, size: 64)
!1160 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 66, baseType: !1161, size: 64, offset: 512)
!1161 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 66, size: 64, elements: !1162)
!1162 = !{!1163, !1164}
!1163 = !DIDerivedType(tag: DW_TAG_member, name: "ru_minflt", scope: !1161, file: !1128, line: 68, baseType: !601, size: 64)
!1164 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_minflt_word", scope: !1161, file: !1128, line: 69, baseType: !1144, size: 64)
!1165 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 72, baseType: !1166, size: 64, offset: 576)
!1166 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 72, size: 64, elements: !1167)
!1167 = !{!1168, !1169}
!1168 = !DIDerivedType(tag: DW_TAG_member, name: "ru_majflt", scope: !1166, file: !1128, line: 74, baseType: !601, size: 64)
!1169 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_majflt_word", scope: !1166, file: !1128, line: 75, baseType: !1144, size: 64)
!1170 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 78, baseType: !1171, size: 64, offset: 640)
!1171 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 78, size: 64, elements: !1172)
!1172 = !{!1173, !1174}
!1173 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nswap", scope: !1171, file: !1128, line: 80, baseType: !601, size: 64)
!1174 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_nswap_word", scope: !1171, file: !1128, line: 81, baseType: !1144, size: 64)
!1175 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 85, baseType: !1176, size: 64, offset: 704)
!1176 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 85, size: 64, elements: !1177)
!1177 = !{!1178, !1179}
!1178 = !DIDerivedType(tag: DW_TAG_member, name: "ru_inblock", scope: !1176, file: !1128, line: 87, baseType: !601, size: 64)
!1179 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_inblock_word", scope: !1176, file: !1128, line: 88, baseType: !1144, size: 64)
!1180 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 91, baseType: !1181, size: 64, offset: 768)
!1181 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 91, size: 64, elements: !1182)
!1182 = !{!1183, !1184}
!1183 = !DIDerivedType(tag: DW_TAG_member, name: "ru_oublock", scope: !1181, file: !1128, line: 93, baseType: !601, size: 64)
!1184 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_oublock_word", scope: !1181, file: !1128, line: 94, baseType: !1144, size: 64)
!1185 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 97, baseType: !1186, size: 64, offset: 832)
!1186 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 97, size: 64, elements: !1187)
!1187 = !{!1188, !1189}
!1188 = !DIDerivedType(tag: DW_TAG_member, name: "ru_msgsnd", scope: !1186, file: !1128, line: 99, baseType: !601, size: 64)
!1189 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_msgsnd_word", scope: !1186, file: !1128, line: 100, baseType: !1144, size: 64)
!1190 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 103, baseType: !1191, size: 64, offset: 896)
!1191 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 103, size: 64, elements: !1192)
!1192 = !{!1193, !1194}
!1193 = !DIDerivedType(tag: DW_TAG_member, name: "ru_msgrcv", scope: !1191, file: !1128, line: 105, baseType: !601, size: 64)
!1194 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_msgrcv_word", scope: !1191, file: !1128, line: 106, baseType: !1144, size: 64)
!1195 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 109, baseType: !1196, size: 64, offset: 960)
!1196 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 109, size: 64, elements: !1197)
!1197 = !{!1198, !1199}
!1198 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nsignals", scope: !1196, file: !1128, line: 111, baseType: !601, size: 64)
!1199 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_nsignals_word", scope: !1196, file: !1128, line: 112, baseType: !1144, size: 64)
!1200 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 117, baseType: !1201, size: 64, offset: 1024)
!1201 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 117, size: 64, elements: !1202)
!1202 = !{!1203, !1204}
!1203 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nvcsw", scope: !1201, file: !1128, line: 119, baseType: !601, size: 64)
!1204 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_nvcsw_word", scope: !1201, file: !1128, line: 120, baseType: !1144, size: 64)
!1205 = !DIDerivedType(tag: DW_TAG_member, scope: !1127, file: !1128, line: 124, baseType: !1206, size: 64, offset: 1088)
!1206 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1127, file: !1128, line: 124, size: 64, elements: !1207)
!1207 = !{!1208, !1209}
!1208 = !DIDerivedType(tag: DW_TAG_member, name: "ru_nivcsw", scope: !1206, file: !1128, line: 126, baseType: !601, size: 64)
!1209 = !DIDerivedType(tag: DW_TAG_member, name: "__ru_nivcsw_word", scope: !1206, file: !1128, line: 127, baseType: !1144, size: 64)
!1210 = !DILocation(line: 59, column: 18, scope: !1123)
!1211 = !DILocation(line: 60, column: 4, scope: !1123)
!1212 = !DILocation(line: 61, column: 26, scope: !1123)
!1213 = !DILocation(line: 61, column: 35, scope: !1123)
!1214 = !DILocation(line: 61, column: 21, scope: !1123)
!1215 = !DILocation(line: 61, column: 47, scope: !1123)
!1216 = !DILocation(line: 61, column: 56, scope: !1123)
!1217 = !DILocation(line: 61, column: 42, scope: !1123)
!1218 = !DILocation(line: 61, column: 64, scope: !1123)
!1219 = !DILocation(line: 61, column: 41, scope: !1123)
!1220 = !DILocation(line: 61, column: 4, scope: !1123)
!1221 = distinct !DISubprogram(name: "StencilInit", scope: !27, file: !27, line: 19, type: !1222, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !21)
!1222 = !DISubroutineType(types: !1223)
!1223 = !{null, !7, !7, !7, !12}
!1224 = !DILocalVariable(name: "nx", arg: 1, scope: !1221, file: !27, line: 19, type: !7)
!1225 = !DILocation(line: 19, column: 22, scope: !1221)
!1226 = !DILocalVariable(name: "ny", arg: 2, scope: !1221, file: !27, line: 19, type: !7)
!1227 = !DILocation(line: 19, column: 30, scope: !1221)
!1228 = !DILocalVariable(name: "nz", arg: 3, scope: !1221, file: !27, line: 19, type: !7)
!1229 = !DILocation(line: 19, column: 38, scope: !1221)
!1230 = !DILocalVariable(name: "A", arg: 4, scope: !1221, file: !27, line: 20, type: !12)
!1231 = !DILocation(line: 20, column: 26, scope: !1221)
!1232 = !DILocalVariable(name: "last", scope: !1221, file: !27, line: 21, type: !601)
!1233 = !DILocation(line: 21, column: 8, scope: !1221)
!1234 = !DILocation(line: 21, column: 15, scope: !1221)
!1235 = !DILocation(line: 21, column: 20, scope: !1221)
!1236 = !DILocation(line: 21, column: 18, scope: !1221)
!1237 = !DILocation(line: 21, column: 25, scope: !1221)
!1238 = !DILocation(line: 21, column: 23, scope: !1221)
!1239 = !DILocalVariable(name: "i", scope: !1221, file: !27, line: 22, type: !601)
!1240 = !DILocation(line: 22, column: 8, scope: !1221)
!1241 = !DILocation(line: 24, column: 10, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1221, file: !27, line: 24, column: 3)
!1243 = !DILocation(line: 24, column: 8, scope: !1242)
!1244 = !DILocation(line: 24, column: 15, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !27, line: 24, column: 3)
!1246 = !DILocation(line: 24, column: 19, scope: !1245)
!1247 = !DILocation(line: 24, column: 17, scope: !1245)
!1248 = !DILocation(line: 24, column: 3, scope: !1242)
!1249 = !DILocation(line: 28, column: 19, scope: !1245)
!1250 = !DILocation(line: 28, column: 12, scope: !1245)
!1251 = !DILocation(line: 28, column: 26, scope: !1245)
!1252 = !DILocation(line: 28, column: 5, scope: !1245)
!1253 = !DILocation(line: 28, column: 7, scope: !1245)
!1254 = !DILocation(line: 28, column: 10, scope: !1245)
!1255 = !DILocation(line: 24, column: 26, scope: !1245)
!1256 = !DILocation(line: 24, column: 3, scope: !1245)
!1257 = distinct !{!1257, !1248, !1258, !161}
!1258 = !DILocation(line: 28, column: 28, scope: !1242)
!1259 = !DILocation(line: 33, column: 1, scope: !1221)
!1260 = distinct !DISubprogram(name: "seconds_per_tick", scope: !27, file: !27, line: 39, type: !1124, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !21)
!1261 = !DILocalVariable(name: "t0", scope: !1260, file: !27, line: 41, type: !23)
!1262 = !DILocation(line: 41, column: 9, scope: !1260)
!1263 = !DILocalVariable(name: "t1", scope: !1260, file: !27, line: 41, type: !23)
!1264 = !DILocation(line: 41, column: 13, scope: !1260)
!1265 = !DILocalVariable(name: "i", scope: !1260, file: !27, line: 42, type: !192)
!1266 = !DILocation(line: 42, column: 16, scope: !1260)
!1267 = !DILocalVariable(name: "spt", scope: !1260, file: !27, line: 43, type: !13)
!1268 = !DILocation(line: 43, column: 10, scope: !1260)
!1269 = !DILocation(line: 45, column: 3, scope: !1260)
!1270 = !DILocation(line: 45, column: 10, scope: !1260)
!1271 = !DILocation(line: 45, column: 14, scope: !1260)
!1272 = !DILocation(line: 48, column: 10, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1260, file: !27, line: 46, column: 3)
!1274 = !DILocation(line: 48, column: 8, scope: !1273)
!1275 = !DILocation(line: 49, column: 11, scope: !1273)
!1276 = !DILocation(line: 49, column: 5, scope: !1273)
!1277 = !DILocation(line: 50, column: 10, scope: !1273)
!1278 = !DILocation(line: 50, column: 8, scope: !1273)
!1279 = !DILocation(line: 51, column: 19, scope: !1273)
!1280 = !DILocation(line: 51, column: 11, scope: !1273)
!1281 = !DILocation(line: 51, column: 31, scope: !1273)
!1282 = !DILocation(line: 51, column: 35, scope: !1273)
!1283 = !DILocation(line: 51, column: 23, scope: !1273)
!1284 = !DILocation(line: 51, column: 21, scope: !1273)
!1285 = !DILocation(line: 51, column: 9, scope: !1273)
!1286 = !DILocation(line: 52, column: 6, scope: !1273)
!1287 = distinct !{!1287, !1269, !1288, !161}
!1288 = !DILocation(line: 54, column: 3, scope: !1260)
!1289 = !DILocation(line: 56, column: 10, scope: !1260)
!1290 = !DILocation(line: 56, column: 3, scope: !1260)
!1291 = distinct !DISubprogram(name: "getticks", scope: !24, file: !24, line: 267, type: !189, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !26, retainedNodes: !21)
!1292 = !DILocalVariable(name: "a", scope: !1291, file: !24, line: 269, type: !192)
!1293 = !DILocation(line: 269, column: 15, scope: !1291)
!1294 = !DILocalVariable(name: "d", scope: !1291, file: !24, line: 269, type: !192)
!1295 = !DILocation(line: 269, column: 18, scope: !1291)
!1296 = !DILocation(line: 270, column: 6, scope: !1291)
!1297 = !{i32 253256}
!1298 = !DILocation(line: 271, column: 21, scope: !1291)
!1299 = !DILocation(line: 271, column: 14, scope: !1291)
!1300 = !DILocation(line: 271, column: 35, scope: !1291)
!1301 = !DILocation(line: 271, column: 28, scope: !1291)
!1302 = !DILocation(line: 271, column: 38, scope: !1291)
!1303 = !DILocation(line: 271, column: 24, scope: !1291)
!1304 = !DILocation(line: 271, column: 6, scope: !1291)
!1305 = distinct !DISubprogram(name: "elapsed", scope: !24, file: !24, line: 274, type: !1306, scopeLine: 274, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !26, retainedNodes: !21)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!13, !23, !23}
!1308 = !DILocalVariable(name: "t1", arg: 1, scope: !1305, file: !24, line: 274, type: !23)
!1309 = !DILocation(line: 274, column: 1, scope: !1305)
!1310 = !DILocalVariable(name: "t0", arg: 2, scope: !1305, file: !24, line: 274, type: !23)
!1311 = distinct !DISubprogram(name: "clear_cache", scope: !27, file: !27, line: 63, type: !1312, scopeLine: 64, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !21)
!1312 = !DISubroutineType(types: !1313)
!1313 = !{null}
!1314 = !DILocalVariable(name: "i", scope: !1311, file: !27, line: 65, type: !7)
!1315 = !DILocation(line: 65, column: 7, scope: !1311)
!1316 = !DILocalVariable(name: "tarray", scope: !1311, file: !27, line: 66, type: !30)
!1317 = !DILocation(line: 66, column: 10, scope: !1311)
!1318 = !DILocalVariable(name: "accum", scope: !1311, file: !27, line: 66, type: !29)
!1319 = !DILocation(line: 66, column: 18, scope: !1311)
!1320 = !DILocation(line: 68, column: 22, scope: !1311)
!1321 = !DILocation(line: 68, column: 12, scope: !1311)
!1322 = !DILocation(line: 68, column: 10, scope: !1311)
!1323 = !DILocation(line: 69, column: 10, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1311, file: !27, line: 69, column: 3)
!1325 = !DILocation(line: 69, column: 21, scope: !1324)
!1326 = !DILocation(line: 69, column: 8, scope: !1324)
!1327 = !DILocation(line: 69, column: 26, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1324, file: !27, line: 69, column: 3)
!1329 = !DILocation(line: 69, column: 28, scope: !1328)
!1330 = !DILocation(line: 69, column: 3, scope: !1324)
!1331 = !DILocation(line: 70, column: 5, scope: !1328)
!1332 = !DILocation(line: 70, column: 12, scope: !1328)
!1333 = !DILocation(line: 70, column: 15, scope: !1328)
!1334 = !DILocation(line: 69, column: 40, scope: !1328)
!1335 = !DILocation(line: 69, column: 3, scope: !1328)
!1336 = distinct !{!1336, !1330, !1337, !161}
!1337 = !DILocation(line: 70, column: 17, scope: !1324)
!1338 = !DILocation(line: 72, column: 1, scope: !1311)
