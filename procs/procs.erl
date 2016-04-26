-module(procs).

-export([one/0, two/0, three/0, four/0
        ]).

%% e.g. P = spawn(procs, one, []).

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

four() ->
  State = 0,
  four_loop(State).

four_loop(State) ->
  io:format("Hello ~p times~n", [State]),
  receive
  	add ->
      NewState = State + 1,
      four_loop(NewState)
  after
    1000 ->
      four_loop(State)
  end.


