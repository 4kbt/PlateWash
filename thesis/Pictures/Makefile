#include ../../Makefile.inc

FILES := $(wildcard *.jpg)
SMALLTARGS := $(addprefix small/,${FILES})

all: $(SMALLTARGS)


small/%.jpg : %.jpg
	convert $< -resize 800x600 $@ 
