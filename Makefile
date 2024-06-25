# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

compile:
	odin build src \
		-out=build/aps_debug \
		-debug \
		-strict-style \
		-vet \
		-o:none \
		-max-error-count:1

run:
	odin run src \
		-out=build/aps_debug \
		-debug \
		-strict-style \
		-vet \
		-o:none \
		-max-error-count:1 \
		-- $(RUN_ARGS)
