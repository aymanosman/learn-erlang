-module(procs_sync).

-export([demo1/0,
         demo2/0,
         two_init/1,
         two_loop/0,
         one/0
        ]).

% demo non synchronous start up
demo1() ->
  P = spawn(?MODULE, one, []),
  P ! {self(), hello},
  receive
  	Reply ->
      io:format("Got ~p~n", [Reply])
  after
    0 -> % Don't wait of message
      io:format("Got nothing :(~n")
  end.

one() ->
  _ = slow_init(),
  receive
    {From, hello} ->
      From ! hi
  end.


% demo synchronous start up
demo2() ->
  {ok, P} = sync_spawn(?MODULE, two_init, [self()]),
  P ! {self(), hello},
  receive
  	Reply ->
      io:format("Got ~p~n", [Reply])
  after
    0 -> % Don't wait for message
      io:format("Got nothing :(~n")
  end.

two_init(Parent) ->
  _ = slow_init(),
  Parent ! ready,
  two_loop().

two_loop() ->
  receive
    {From, hello} ->
      From ! hi,
      two_loop()
  end.

sync_spawn(Mod, Fun, Args) ->
  P = spawn(Mod, Fun, Args),
  receive
  	ready ->
      {ok, P}
  after
    5000 -> % timeout
      error
  end.

slow_init() ->
  timer:sleep(1000). % simulate slow initialization
