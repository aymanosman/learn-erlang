-module(parse).
-export([parse/1,
         is_num/1,
         take_while/2
        ]).

parse([$( | Rest]) ->
  {E1, Rest1} = parse(Rest),
  [Op | Rest2] = Rest1,
  {E2, Rest3} = parse(Rest2),
  [$) | RestFinal] = Rest3,
  {case Op of
    $+ -> {add, E1, E2};
    $- -> {mul, E1, E2}
   end,
   RestFinal};
parse(L) ->
  {Num, Rest} = take_while(fun is_num/1, L),
  {{num, list_to_integer(Num)}, Rest}.

is_num(A) ->
  $1 =< A andalso A =< $9.

take_while(Pred, L) ->
  take_while(Pred, [], L).

take_while(Pred, Acc, [A | Rest] = L) ->
  case Pred(A) of
    true ->
      take_while(Pred, [A | Acc], Rest);
    _ ->
      io:format("hello~n"),
      {lists:reverse(Acc), L}
  end.

