component = ./node_modules/component-hooks/node_modules/.bin/component

default: node_modules components public

node_modules:
	@npm install

components:
	@$(component) install --dev

public: $(shell find lib -type f) component.json
	$(component) build --dev -n $@ -o $@
	@touch $@

example: default
	@xdg-open example/index.html

clean:
	@rm -rf public

.PHONY: clean example