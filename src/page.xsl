<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE stylesheet
 SYSTEM "xslt.dtd" [

<!ENTITY inline-normalized-text
 ' back/text()
 | big/text()
 | body/text()
 | bold/text()
 | cat/text()
 | cell/text()
 | cite/text()
 | data/text()
 | del/text()
 | email/text()
 | emph/text()
 | err/text()
 | fix/text()
 | fld/text()
 | grp/text()
 | ins/text()
 | ital/text()
 | key/text()
 | link/text()
 | lit/text()
 | meta/text()
 | note/text()
 | para/text()
 | scap/text()
 | sep/text()
 | str/text()
 | sub/text()
 | subtitle/text()
 | sup/text()
 | title/text()
 | todo/text()
 | val/text()
 | warn/text()
 | code/text()
 | line/text()
 '>

<!ENTITY inline-verbatim-text
 ' x
 '>

]>

<s:stylesheet
 exclude-result-prefixes="e g h i"
 extension-element-prefixes="e"
 version="1.0"
 xmlns:e="&exslt;"
 xmlns:g="&generic;"
 xmlns:h="&html;"
 xmlns:i="&xinclude;"
 xmlns:s="&xslt;"
 >

 <s:output
  encoding="utf-8"
  indent="no"
  method="html"
  version="5"
  doctype-system="about:legacy-compat"
  />

 <s:namespace-alias
  result-prefix="#default"
  stylesheet-prefix="h"
  />

 <s:preserve-space
  elements="x"
  />

 <s:strip-space
  elements="*"
  />

 <template match="text()" xmlns="&xslt;">
  <message terminate="yes" xmlns:saxon="&saxon;">
   <value-of select="saxon:systemId()"/>
   <text>:</text>
   <value-of select="saxon:line-number(.)"/>
   <text>: error: no template for '</text>
   <value-of select="local-name(..)"/>
   <text>/text()'</text>
  </message>
 </template>

 <template match="*" xmlns="&xslt;">
  <message terminate="yes" xmlns:saxon="&saxon;">
   <value-of select="saxon:systemId()"/>
   <text>:</text>
   <value-of select="saxon:line-number(.)"/>
   <text>: error: no template for '</text>
   <value-of select="local-name(.)"/>
   <text>'</text>
  </message>
 </template>

 <template match="/" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="page" xmlns="&xslt;">
  <html xmlns="&html;">
   <head>
    <title>
     <value-of
      select="normalize-space(head/title)"
      xmlns="&xslt;"/>
     <for-each select="head/subtitle" xmlns="&xslt;">
      <text>:&sp;</text>
      <value-of select="normalize-space(.)"/>
     </for-each>
     <for-each select="head/back" xmlns="&xslt;">
      <sort
       select="position()"
       data-type="number"
       order="descending"
       />
      <text>&sp;·&sp;</text>
      <value-of select="."/>
     </for-each>
    </title>
    <link
     href="/style.css"
     rel="stylesheet"
     type="text/css"
     />
    <link
     href="/favicon.ico"
     rel="shortcut icon"
     />
   </head>
   <body>
    <main>
     <s:apply-templates/>
    </main>
   </body>
  </html>
 </template>

 <template match="sect" xmlns="&xslt;">
  <section xmlns="&html;">
   <s:apply-templates/>
  </section>
 </template>

 <template match="head" xmlns="&xslt;">
  <heading xmlns="&html;">
   <nav>
    <ol role="list">
     <s:apply-templates select="back"/>
    </ol>
   </nav>
   <s:apply-templates select="title | subtitle"/>
  </heading>
 </template>

 <template match="back" xmlns="&xslt;">
  <li xmlns="&html;">
   <call-template name="link_to" xmlns="&xslt;">
    <with-param name="id" select="@to"/>
   </call-template>
  </li>
 </template>

 <template match="head/title" xmlns="&xslt;">
  <h1 xmlns="&html;"><s:apply-templates/></h1>
 </template>

 <template match="table/title" xmlns="&xslt;">
  <figcaption xmlns="&html;">
   <s:apply-templates/>
  </figcaption>
 </template>

 <template match="head/subtitle" xmlns="&xslt;">
  <p xmlns="&html;"><s:apply-templates/></p>
 </template>

 <template match="body" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="map" xmlns="&xslt;">
  <dl xmlns="&html;">
   <s:apply-templates/>
  </dl>
 </template>

 <template match="assn" xmlns="&xslt;">
  <apply-templates select="key"/>
  <apply-templates select="val"/>
 </template>

 <template match="key" xmlns="&xslt;">
  <dt xmlns="&html;">
   <if test="position() = 1" xmlns="&xslt;">
    <attribute name="id">
     <value-of select="../@id"/>
    </attribute>
   </if>
   <s:apply-templates/>
  </dt>
 </template>

 <template match="assn/val" xmlns="&xslt;">
  <dd xmlns="&html;">
   <s:apply-templates/>
  </dd>
 </template>

 <template match="seq" xmlns="&xslt;">
  <ol xmlns="&html;">
   <s:apply-templates/>
  </ol>
 </template>

 <template match="set" xmlns="&xslt;">
  <ul xmlns="&html;">
   <s:apply-templates/>
  </ul>
 </template>

 <template match="set/val|seq/val" xmlns="&xslt;">
  <li xmlns="&html;">
   <s:apply-templates/>
  </li>
 </template>

 <template match="about" xmlns="&xslt;">
  <ruby xmlns="&html;">
   <s:apply-templates select="data"/>
   <s:apply-templates select="meta"/>
  </ruby>
 </template>

 <template match="about/data" xmlns="&xslt;">
  <span class="about-data" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="about/meta" xmlns="&xslt;">
  <h:rp>(</h:rp>
  <h:rt class="about-meta"><apply-templates/></h:rt>
  <h:rp>)</h:rp>
 </template>

 <template match="cite" xmlns="&xslt;">
  <a href="{ @of }" xmlns="&html;">
   <s:apply-templates/>
  </a>
 </template>

 <template match="kwd" xmlns="&xslt;">
  <span class="kwd" xmlns="&html;">
   <s:value-of select="."/>
  </span>
 </template>

 <template match="link" xmlns="&xslt;">
  <call-template name="link_to">
   <with-param name="id" select="@to"/>
  </call-template>
 </template>

 <template name="link_to" xmlns="&xslt;">
  <variable name="url">
   <call-template name="page_id_to_url">
    <with-param name="id" select="@to"/>
   </call-template>
  </variable>
  <a href="{ $url }" xmlns="&html;">
   <s:apply-templates/>
  </a>
 </template>

 <template name="page_id_to_url" xmlns="&xslt;">
  <param name="id" as="string"/>
  <variable name="path" select="translate($id, '_', '/')"/>
  <choose>
   <when test="contains($path, '/index')">
    <variable name="prefix" select="substring-before($path, '/index')"/>
    <variable name="suffix" select="substring-after($path, '/index')"/>
    <choose>
     <when test=" $suffix = '' ">
      <value-of select="concat($prefix, '/')"/>
     </when>
     <otherwise>
      <message terminate="yes" xmlns:saxon="&saxon;">
       <value-of select="saxon:systemId()"/>
       <text>:</text>
       <value-of select="saxon:line-number(.)"/>
       <text>: error: ill-made page id '</text>
       <value-of select="local-name(.)"/>
       <text>'</text>
      </message>
     </otherwise>
    </choose>
   </when>
   <otherwise>
    <value-of select="$path"/>
   </otherwise>
  </choose>
 </template>

 <template match="lit" xmlns="&xslt;">
  <mark xmlns="&html;">
   <s:apply-templates/>
  </mark>
 </template>

 <template match="para" xmlns="&xslt;">
  <p xmlns="&html;">
   <s:apply-templates/>
  </p>
 </template>

 <template match="prog" xmlns="&xslt;">
  <pre xmlns="&html;">
   <for-each select="./*" xmlns="&xslt;">
    <if test="position() != 1">
     <text>&lf;</text>
    </if>
    <choose>
     <when test="../@nest-by and not(@by)">
      <apply-templates select=".">
       <with-param name="by" select="../@nest-by"/>
      </apply-templates>
     </when>
     <otherwise>
      <apply-templates select="."/>
     </otherwise>
    </choose>
   </for-each>
  </pre>
 </template>

 <template match="line" xmlns="&xslt;">
  <param name="at" as="string" select=" '' "/>
  <h:code>
   <choose>
    <when test="node()">
     <!-- skip prefix for empty line regardless of nesting -->
     <value-of select="$at"/>
     <apply-templates/>
    </when>
   </choose>
  </h:code>
 </template>

 <template match="nest" xmlns="&xslt;">
  <param name="at" as="string" select=" '' "/>
  <param name="by" as="string">
   <choose>
    <when test="@by">
     <value-of select="string(@by)"/>
    </when>
    <otherwise>
     <text>&sp;&sp;</text>
    </otherwise>
   </choose>
  </param>
  <for-each select="./*">
   <if test="position() != 1">
    <text>&lf;</text>
   </if>
   <apply-templates select=".">
    <with-param name="at" select="concat($by, $at)"/>
    <with-param name="by" select="$by"/>
   </apply-templates>
  </for-each>
 </template>

 <template match="ref[@to]" xmlns="&xslt;">
  <a class="ref" href="#{ @to }" xmlns="&html;">
   <s:value-of select="."/>
  </a>
 </template>

 <template match="ref[not(@to)]" xmlns="&xslt;">
  <span class="ref todo" xmlns="&html;">
   <s:value-of select="."/>
  </span>
 </template>

 <template match="var" xmlns="&xslt;">
  <var xmlns="&html;">
   <s:value-of select="normalize-space(.)"/>
  </var>
 </template>

 <template match="abbr" xmlns="&xslt;">
  <abbr xmlns="&html;"><s:value-of select="."/></abbr>
 </template>

 <template match="big" xmlns="&xslt;">
  <span class="big" xmlns="&html;"><s:apply-templates/></span>
 </template>

 <template match="bold" xmlns="&xslt;">
  <b xmlns="&html;">
   <s:apply-templates/>
  </b>
 </template>

 <template match="todo" xmlns="&xslt;">
  <message terminate="no" xmlns:saxon="&saxon;">
   <value-of select="saxon:systemId()"/>
   <text>:</text>
   <value-of select="saxon:line-number(.)"/>
   <text>: todo</text>
  </message>
  <span class="todo" title="TODO" xmlns="&html;">
   <choose xmlns="&xslt;">
    <when test="./node()">
     <apply-templates/>
    </when>
    <otherwise>
     <text>[…]</text>
    </otherwise>
   </choose>
  </span>
 </template>

 <template match="table" xmlns="&xslt;">
  <figure xmlns="&html;">
   <table class="{ @class }">
    <thead>
     <s:apply-templates select="fmt"/>
    </thead>
    <tbody>
     <s:apply-templates select="row"/>
    </tbody>
   </table>
   <s:apply-templates select="title"/>
  </figure>
 </template>

 <template match="fmt" xmlns="&xslt;">
  <tr xmlns="&html;">
   <s:apply-templates select="fld"/>
  </tr>
 </template>

 <template match="fld" xmlns="&xslt;">
  <th
   colspan="{ @cols }"
   rowspan="{ @rows }"
   xmlns="&html;">
   <s:apply-templates/>
  </th>
 </template>

 <template match="row" xmlns="&xslt;">
  <tr xmlns="&html;">
   <s:apply-templates/>
  </tr>
 </template>

 <template match="brk | cell | gap" xmlns="&xslt;">
  <variable name="has_content" select="name() = 'cell'"/>
  <h:td
   class="{ name() } { @class }"
   colspan="{ @cols }"
   rowspan="{ @rows }">
   <if test="$has_content">
    <s:apply-templates/>
   </if>
  </h:td>
 </template>

 <template match="code" xmlns="&xslt;">
  <code xmlns="&html;">
   <s:apply-templates/>
  </code>
 </template>

 <template match="code//note|prog//note" xmlns="&xslt;">
  <span class="note" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="del" xmlns="&xslt;">
  <del xmlns="&html;">
   <s:apply-templates/>
  </del>
 </template>

 <template match="email" xmlns="&xslt;">
  <span class="email" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="emph" xmlns="&xslt;">
  <em xmlns="&html;">
   <s:apply-templates/>
  </em>
 </template>

 <template match="err" xmlns="&xslt;">
  <span class="err" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="scap" xmlns="&xslt;">
  <span class="scap" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="warn" xmlns="&xslt;">
  <span class="warn" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="str" xmlns="&xslt;">
  <span class="str" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="sub" xmlns="&xslt;">
  <sub xmlns="&html;">
   <s:apply-templates/>
  </sub>
 </template>

 <template match="sup" xmlns="&xslt;">
  <sup xmlns="&html;">
   <s:apply-templates/>
  </sup>
 </template>

 <template match="cat" xmlns="&xslt;">
  <span class="cat" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="fix" xmlns="&xslt;">
  <span class="fix" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="sep" xmlns="&xslt;">
  <span class="sep" xmlns="&html;">
   <for-each select="./node()" xmlns="&xslt;">
    <if test="position() != 1">
     <text>&sp;</text>
    </if>
    <apply-templates select="."/>
   </for-each>
  </span>
 </template>

 <template match="grp" xmlns="&xslt;">
  <variable name="padding">
   <if test=".//grp">
    <text>&sp;</text>
   </if>
  </variable>
  <h:span class="grp">
   <text>[</text>
   <value-of select="$padding"/>
   <apply-templates/>
   <value-of select="$padding"/>
   <text>]</text>
  </h:span>
 </template>

 <template match="ins" xmlns="&xslt;">
  <ins xmlns="&html;">
   <s:apply-templates/>
  </ins>
 </template>

 <template match="ital" xmlns="&xslt;">
  <i xmlns="&html;">
   <s:apply-templates/>
  </i>
 </template>

 <template match="youtube" xmlns="&xslt;">
  <h:div class="youtube">
   <h:iframe
    width="560"
    height="315"
    src="https://www.youtube-nocookie.com/embed/{ normalize-space(.) }"
    title="YouTube video player"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
    >
    <attribute name="allowfullscreen"/>
   </h:iframe>
  </h:div>
 </template>

 <template match="&inline-normalized-text;" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="&inline-verbatim-text;" xmlns="&xslt;">
  <value-of select="."/>
 </template>

</s:stylesheet>
