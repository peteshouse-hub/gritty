.DEFAULT_GOAL := all
.PHONY: all clean distclean

all:
	bash scripts/build_all.sh

clean:
	rm -rf build

distclean: clean
	rm -f dist/*.pdf
