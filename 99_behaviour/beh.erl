-module(beh).

-export([behaviour_info/1,
         start_link/2,
         call/2
        ]).

behaviour_info(callbacks) ->
  [{init, 0},
   {handle_call, 1}
  ].

start_link({local, ServerName}, Callback) ->
  {ok, State} = Callback:init(),
  Child = spawn_link(fun() -> loop(Callback, State) end),
  register(ServerName, Child),
  ok.

loop(Callback, State) ->
  receive
    {From, Msg} ->
      io:format("Got Msg ~p from ~p~n", [Msg, From]),
      Ans = Callback:handle_call(Msg),
      io:format("Produced Ans ~p~n", [Ans]),
      From ! Ans,
      loop(Callback, State)
  end.

call(ServerName, Msg) ->
  P = whereis(ServerName),
  P ! {self(), Msg},
  receive
  	Reply ->
      Reply
  end.

