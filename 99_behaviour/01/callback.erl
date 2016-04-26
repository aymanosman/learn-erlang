-module(callback).

-behaviour(behaviour).

%% API
-export([start_link/0,
         call/1
        ]).

%% Callbacks
-export([handle_call/1
        ]).

-define(SERVER, ?MODULE).

start_link() ->
  behaviour:start_link({local, ?SERVER}, ?MODULE).

handle_call(Msg) ->
  {got, Msg}.

call(Msg) ->
  behaviour:call(?SERVER, Msg).

