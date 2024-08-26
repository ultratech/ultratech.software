.PHONY: all copy modify deploy

.SILENT:

SHELL := bash -eou pipefail

all: copy modify

copy:
	rm -f index.html
	cp ~/Documents/Ultratech/index.html .

modify:
	sed -i '' 's/^[[:space:]]*<html>/<html lang="en">/' index.html
	sed -i '' '/bear-note-unique-identifier/d' index.html
	printf '%s\n' '/<meta.*viewport.*>/a\' '<meta name="description" content="Ultratech Software is a company specializing in cutting-edge technology consulting, including embedded development, full stack and backend development, machine learning, and artificial intelligence.">' | sed -i '' -f - index.html
	npx --yes @divriots/jampack .
	rm -rf .jampack
	rm -rf  _jampack
