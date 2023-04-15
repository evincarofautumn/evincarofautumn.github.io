################################################################

XSLTFLAGS ?= --verbose

################################################################

page_names := \
    index \
        code/index \
            code/glossary \
            code/haskell/what \
        credits \
        cv \
        loops/index

page_src_xmls := \
    $(page_names:%=src/web/%.xml)

page_dst_htmls := \
    $(page_names:%=dst/web/%.html)

page_dst_xmls := \
    $(page_names:%=dst/%.xml)

resource_files := \
	favicon.ico \
	hatch-dark.svg \
	hatch-light.svg \
	hatch-medium.svg

resource_dst_files := \
    $(resource_files:%=dst/web/%)

style_names := \
    style

style_dst_csss := \
    $(style_names:%=dst/web/%.css)

$(info page_names         = $(strip $(page_names)))
$(info page_src_xmls      = $(strip $(page_src_xmls)))
$(info page_dst_htmls     = $(strip $(page_dst_htmls)))
$(info page_dst_xmls      = $(strip $(page_dst_xmls)))
$(info resource_files     = $(strip $(resource_files)))
$(info resource_dst_files = $(strip $(resource_dst_files)))
$(info style_names        = $(strip $(style_names)))
$(info style_dst_csss     = $(strip $(style_dst_csss)))

################################################################

.PHONY: build

build: \
    $(page_dst_htmls) \
    $(resource_dst_files) \
    $(style_dst_csss)

################################################################

src/css.dtd: \
    src/entities.dtd

src/page.dtd: \
    src/entities.dtd

src/site.dtd: \
    src/entities.dtd \
    src/page.dtd

src/xslt.dtd: \
    src/entities.dtd

################################################################

src/site.xml: \
    $(page_src_xmls)

################################################################

src/css.xsl: \
	src/xslt.dtd

src/page.xsl: \
    src/xslt.dtd

src/site.xsl: \
    src/xslt.dtd

################################################################

$(resource_dst_files): dst/web/%: \
    src/web/%
	mkdir -p $(dir $@); \
	cp $< $@

################################################################

# call xsltproc target,stylesheet,source
define xsltproc
xsltproc \
    $(XSLTFLAGS) \
    --path src/ \
    --path src/web/ \
    --xinclude \
    --output $(1) \
    $(2) \
    $(3)
endef

# every page_dst_xml is made together
$(page_dst_xmls) &: \
    src/site.xml \
    src/site.xsl \
    $(page_src_xmls)
	mkdir -p $(dir $@); \
	$(call xsltproc,dst/,src/site.xsl,$<)

# each page_dst_html is made from the sibling page_dst_xml
$(page_dst_htmls): dst/web/%.html: \
    dst/%.xml \
    src/page.xsl \
    src/page.dtd
	mkdir -p $(dir $@); \
	$(call xsltproc,$@,src/page.xsl,$<)

$(style_dst_csss): dst/web/%.css: \
    src/web/%.xml \
    src/css.xsl \
    src/css.dtd
	mkdir -p dst/web; \
	$(call xsltproc,$@,src/css.xsl,$<)

################################################################

# call xmllint,source
define xmllint
xmllint \
    --noent \
    --noout \
    --path src/ \
    --path src/web/ \
    --postvalid \
    --xinclude \
    $(1)
endef

.PHONY: lint

lint: src/site.xml
	$(call xmllint,src/site.xml)

################################################################

.PHONY: clean

clean:
	rm -r dst

################################################################
