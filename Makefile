all: README.md

README.md: ukrainian-computer-dvp.el
	./generate-readme.sh

publish: README.md
	git add README.md
	git commit --amend --no-edit
	git push

.PHONY: publish
