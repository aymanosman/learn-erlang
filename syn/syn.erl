
behaviour gen_server where
  init :: Any -> {ok, Any} | ignore | ...
  handle_call :: Any -> From -> State -> {reply, Reply, State} | ...
  handle_cast :: ...
  terminate ...

  init [] =
    {ok, []}

instance gen_server syn where
  handle_call = handle_call

handle_call pop _ (x:xs) =
  {reply, x, xs}

handle_call {push, x} _ s =
  {reply, ok, x:s}

