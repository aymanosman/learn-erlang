-module(heap).

-export([singleton/1,
         random_list/0,
         to_list/1,
         test/0,
         from_list/1
        ]).

-type heap() ::
  {'node', term(), heap(), heap()}
  | 'empty'.

-spec singleton(term()) -> heap().
singleton(A) ->
  {node, A, empty, empty}.

-spec from_list([term()]) -> heap().
from_list([]) ->
  empty;
from_list([A | Rest]) ->
  merge(singleton(A), from_list(Rest)).

-spec to_list(heap()) -> [term()].
to_list(empty) -> [];
to_list({node, A, L, R}) ->
  [A | to_list(merge(L, R))].

merge(empty, H) -> H;
merge(H, empty) -> H;
merge({node, A, L, R} = H, {node, B, L2, R2} = G) ->
  if
    A =< B ->
      {node, A, merge(L, G), R};
    true ->
      {node, B, merge(L2, H), R2}
  end.

random_list() ->
  [random:uniform(10) || _ <- lists:seq(1, 10)].

test() ->
  L = random_list(),
  lists:sort(L) == heap:to_list(heap:from_list(L)).

% TODO quicheck
