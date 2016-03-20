-module(foo).
-export([demo/1, add/2]).

demo([A]) ->
  io:format("Hello ~w~n", [A]).

add(A, B) ->
  {lol, A+B}.
