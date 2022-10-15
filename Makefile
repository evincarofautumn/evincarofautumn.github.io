XMLS := $(wildcard src/*.xml)
XSLS := $(wildcard src/*.xsl)
HTMLS := $(XMLS:src/%.xml=dst/%.html)

.PHONY: build

build: $(HTMLS)

$(HTMLS): $(XMLS)

$(XMLS): $(XSLS)

$(HTMLS): dst/%.html: src/%.xml
	mkdir -p dst
	xsltproc --verbose "$<" --output "$@"

.PHONY: clean

clean:
	rm -r dst
