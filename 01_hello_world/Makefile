all: compile run

compile:
	erlc foo.erl

run:
	erl -boot start_clean -pa . \
		-s foo demo Erlang \
		-s erlang halt
