-module(procs).

-export([one/0, two/0, three/0, four/0
        ]).

%% spawn ... init,loop,stop ... terminate

%% e.g.
%% > P = spawn(procs, one, []).
%% > is_process_alive(P).

% terminate
one() ->
  io:format("Hello once~n").

% loop
two() ->
  io:format("Hello many times~n"),
  timer:sleep(1000),
  two().

% init, loop
three() ->
  State = 0,
  three_loop(State).

three_loop(State) ->
  io:format("Hello ~p times~n", [State]),
  timer:sleep(1000),
  three_loop(State+1).

% init, (loop+receive)
four() ->
  State = 0,
  four_loop(State).

four_loop(State) ->
  io:format("Counter: ~p (hint: P ! add)~n", [State]),
  receive
  	add ->
      NewState = State + 1,
      four_loop(NewState)
  after
    1000 ->
      four_loop(State)
  end.


