```sh
$ erl -emu_args
Executing: /usr/local/Cellar/erlang/18.2.1/lib/erlang/erts-7.2.1/bin/beam.smp
/usr/local/Cellar/erlang/18.2.1/lib/erlang/erts-7.2.1/bin/beam.smp -- -root
/usr/local/Cellar/erlang/18.2.1/lib/erlang -progname erl -- -home /Users/aosman
--

Erlang/OTP 18 [erts-7.2.1] [source] [64-bit] [smp:4:4] [async-threads:10]
[hipe] [kernel-poll:false] [dtrace]

Eshell V7.2.1  (abort with ^G)
1>
```

```sh
$ erl -init_debug
{progress,preloaded}
{progress,kernel_load_completed}
{progress,modules_loaded}
{start,heart}
{start,error_logger}
{start,application_controller}
{progress,init_kernel_started}
{apply,{application,load,[{application,stdlib,[{description,"ERTS  CXC 138 10"},{vsn,"2.7"},{id,[]},{modules,[array,base64,beam_lib,binary,c,calendar,dets,dets_server,dets_sup,dets_utils,dets_v8,dets_v9,dict,digraph,digraph_utils,edlin,edlin_expand,epp,eval_bits,erl_anno,erl_bits,erl_compile,erl_eval,erl_expand_records,erl_internal,erl_lint,erl_parse,erl_posix_msg,erl_pp,erl_scan,erl_tar,error_logger_file_h,error_logger_tty_h,escript,ets,file_sorter,filelib,filename,gb_trees,gb_sets,gen,gen_event,gen_fsm,gen_server,io,io_lib,io_lib_format,io_lib_fread,io_lib_pretty,lib,lists,log_mf_h,maps,math,ms_transform,orddict,ordsets,otp_internal,pool,proc_lib,proplists,qlc,qlc_pt,queue,rand,random,re,sets,shell,shell_default,slave,sofs,string,supervisor,supervisor_bridge,sys,timer,unicode,win32reg,zip]},{registered,[timer_server,rsh_starter,take_over_monitor,pool_master,dets]},{applications,[kernel]},{included_applications,[]},{env,[]},{maxT,infinity},{maxP,infinity}]}]}}
{progress,applications_loaded}
{apply,{application,start_boot,[kernel,permanent]}}
Erlang/OTP 18 [erts-7.2.1] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

{apply,{application,start_boot,[stdlib,permanent]}}
{apply,{c,erlangrc,[]}}
{progress,started}
Eshell V7.2.1  (abort with ^G)
1>
```

```sh
$ erl -a b c -a d
Erlang/OTP 18 [erts-7.2.1] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

Eshell V7.2.1  (abort with ^G)
1> init:get_argument(a).
{ok,[["b","c"],["d"]]}
2> init:get_arguments().
[{root,["/usr/local/Cellar/erlang/18.2.1/lib/erlang"]},
 {progname,["erl"]},
 {home,["/Users/aosman"]},
 {a,["b","c"]},
 {a,["d"]}]
3>
```

