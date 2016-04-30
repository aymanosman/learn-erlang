-module(sigs).

-export([make_b/1,
         is_abc_alive/0,
         spawn_link/0
        ]).

spawn_link() ->
  B = spawn_link(?MODULE, make_b, [self()]),
  receive
    {A, C} ->
      put('$abc', [A, B, C]),
      {A, B, C}
  end.

is_abc_alive() ->
  Abc = get('$abc'),
  [{P, is_process_alive(P)} || P <- Abc].

make_b(Parent) ->
  process_flag(trap_exit, true),
  A = spawn_link(fun() -> loop_a(Parent) end),
  C = spawn_link(fun() -> loop_c(Parent) end),
  Parent ! {A, C},
  loop_b().

loop_b() ->
  receive
    _ ->
      ok,
      loop_b()
  end.

loop_a(Parent) ->
  receive
  	X ->
      Parent ! {from_a, X},
      loop_a(Parent)
  end.

loop_c(Parent) ->
  process_flag(trap_exit, true),
  receive
  	X ->
      Parent ! {from_b, X},
      loop_c(Parent)
  end.


