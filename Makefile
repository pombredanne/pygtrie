all: test lint docs

test: test2 test3

test2: test.py pygtrie.py
	python2 $<

test3: test.py pygtrie.py
	python3 $<

lint: .pylintrc pygtrie.py test.py example.py
	lint=$$(which pylint3 2>/dev/null) || lint=$$(which pylint) && \
	"$$lint" --rcfile $^

docs:
	sphinx-build . html

.PHONY: all test test2 test3 lint docs
