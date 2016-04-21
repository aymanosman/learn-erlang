-module(cb).

-behaviour(beh).

-export([start_link/0,
         call/1
        ]).

-export([init/0,
        handle_call/1
        ]).

-define(SERVER, ?MODULE).

-record(state, {}).

start_link() ->
  beh:start_link({local, ?SERVER}, ?MODULE).

init() ->
  {ok, #state{}}.

handle_call(Msg) ->
  {got, Msg}.

call(Msg) ->
  beh:call(?SERVER, Msg).

