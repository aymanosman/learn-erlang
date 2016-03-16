The `-pa Dir1 Dir2` flag adds the specified directories to the beginning of the
code path. '-pz' adds the directories to the end.

```sh
$ erlc foo.erl
$ erl -pa .
Erlang/OTP 18 [erts-7.2.1] [source] [64-bit] [smp:4:4] [async-threads:10]
[hipe] [kernel-poll:false] [dtrace]

Eshell V7.2.1  (abort with ^G)
1> foo:add(1,2).
{lol,3}
2>
```
