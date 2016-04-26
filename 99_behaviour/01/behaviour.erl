-module(behaviour).

-export([start_link/2,
         % behaviour_info/1,
         call/2
        ]).

-callback handle_call(Msg :: term()) ->
  {got, Reply :: term()}.

% behaviour_info(callbacks) ->
%   [{handle_call, 1}
%   ].


start_link({local, ServerName}, Callback) ->
  Child = spawn_link(fun() -> loop(Callback) end),
  register(ServerName, Child),
  ok.

loop(Callback) ->
  receive
    {From, Msg} ->
      io:format("Got Msg ~p from ~p~n", [Msg, From]),
      Ans = Callback:handle_call(Msg),
      io:format("Produced Ans ~p~n", [Ans]),
      From ! Ans,
      loop(Callback)
  end.

call(ServerName, Msg) ->
  P = whereis(ServerName),
  P ! {self(), Msg},
  receive Reply -> Reply end.

