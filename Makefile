reveal_theme := simple
pandoc_args := -t revealjs -s -V revealjs-url=./reveal.js -V theme=$(reveal_theme)
pandoc_args += -f markdown+fenced_divs+link_attributes

.PHONY: serve site

site: docs/index.html docs/reveal.js

serve: site
	cd docs && python -m http.server

docs/index.html: presentation.md Makefile
	pandoc $(pandoc_args) $< -o $@

docs/reveal.js: reveal.js/dist reveal.js/plugin
	mkdir -p docs/reveal.js
	cp -r $^ $@
