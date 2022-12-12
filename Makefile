################################################################

XSLTFLAGS ?= --verbose

################################################################

.PHONY: build

build: \
    dst/web/index.html \
    dst/web/loops/index.html \
    dst/web/style.css

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
    src/web/home.xml \
    src/web/loops.xml

################################################################

src/css.xsl: \
	src/xslt.dtd

src/page.xsl: \
    src/xslt.dtd

src/site.xsl: \
    src/xslt.dtd

################################################################

# call xsltproc target,stylesheet,source
define xsltproc
xsltproc \
    $(XSLTFLAGS) \
    --path src/ \
    --path src/web \
    --xinclude \
    --output $(1) \
    $(2) \
    $(3)
endef

dst/web/index.html: \
    dst/home.xml \
    src/page.xsl \
    src/page.dtd
	mkdir -p dst/web; \
	$(call xsltproc,$@,src/page.xsl,$<)

dst/web/loops/index.html: \
    dst/loops.xml \
    src/page.xsl \
    src/page.dtd
	mkdir -p dst/web/loops; \
	$(call xsltproc,$@,src/page.xsl,$<)

dst/web/style.css: \
    src/web/style.xml \
    src/css.xsl \
    src/css.dtd
	mkdir -p dst/web; \
	$(call xsltproc,$@,src/css.xsl,$<)

################################################################

dst/%.xml: src/web/%.xml src/site.xml src/site.xsl
	mkdir -p dst/web; \
	$(call xsltproc,dst/,src/site.xsl,src/site.xml)

################################################################

# call xmllint,source
define xmllint
xmllint \
    --noent \
    --noout \
    --path src \
    --path src/web \
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
