all: compile run

compile:
	erlc foo.erl

run:
	erl -noshell \
		-s foo demo Erlang \
		-s erlang halt
