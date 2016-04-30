-module(sups).

-export([f/0,
         x/0,
         xx/0,
         init_it/1,
         start_link_supervisor/0,
         init/1]).

f() -> 8.

x() ->
  proc_lib:start_link(?MODULE, init_it, [self()]).

init_it(Parent) ->
  proc_lib:init_ack(Parent, {ok, self()}),
  xx().

% x() ->
%   Pid = spawn_link(fun xx/0),
%   {ok, Pid}.

xx() ->
  X = ?MODULE:f(),
  % F = fun() -> f() end,
  % X = F(),
  io:format("GG: ~p~n", [X]),
  timer:sleep(1000),
  xx().

init([]) -> % supervisor callback
  Child = #{id => xx,
            start => {?MODULE, x, []}
            },
  {ok, {{one_for_one, 1, 1}, [Child]}}.

start_link_supervisor() ->
  supervisor:start_link(?MODULE, []).

