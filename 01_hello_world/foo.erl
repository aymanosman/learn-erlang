-module(foo).

-export([demo/1]).

demo([Msg]) ->
  io:format("Hello ~p~n", [Msg]).
