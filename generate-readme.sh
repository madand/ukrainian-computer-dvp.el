#!/usr/bin/env sh

# See https://github.com/mgalgs/make-readme-markdown
download_url='https://raw.githubusercontent.com/mgalgs/make-readme-markdown/3f894c476faa93608ff908086002a5c5eb4b45f6/make-readme-markdown.el'

if [ ! -f make-readme-markdown.el ]; then
    echo 'make-readme-markdown.el not found in current directory!'
    echo 'You may download it with the following command:'
    echo "wget -q '${download_url}'"
    exit 1
fi

emacs -q --script make-readme-markdown.el <'ukrainian-computer-dvp.el' >README.md
