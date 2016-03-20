compile:
	erlc mod.erl

joe: compile
	erl -sname joe@localhost -s mod start_pong

mike: compile
	erl -sname mike@localhost -s mod start_ping2 joe@localhost
