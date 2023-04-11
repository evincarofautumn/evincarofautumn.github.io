<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE stylesheet
 SYSTEM "xslt.dtd">

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
  indent="yes"
  method="html"
  version="5"
  doctype-system="about:legacy-compat"
  />

 <s:namespace-alias
  result-prefix="#default"
  stylesheet-prefix="h"
  />

 <s:strip-space
  elements="*"
  />

 <template match="text()" xmlns="&xslt;">
  <message terminate="yes">
   <text>error: no template for '</text>
   <value-of select="local-name(..)"/>
   <text>/text()'</text>
  </message>
 </template>

 <template match="*" xmlns="&xslt;">
  <message terminate="yes">
   <text>error: no template for '</text>
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
      <for-each select="head/subtitle" xmlns="&xslt;">
        <sort
         select="position()"
         data-type="number"
         order="descending"
         />
        <value-of select="."/>
        <text>&sp;·&sp;</text>
      </for-each>
      <value-of select="head/title" xmlns="&xslt;"/>
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
   <s:apply-templates/>
  </heading>
 </template>

 <template match="head/title" xmlns="&xslt;">
  <h1 xmlns="&html;"><s:apply-templates/></h1>
 </template>

 <template match="table/title" xmlns="&xslt;">
  <figcaption xmlns="&html;">
   <s:apply-templates/>
  </figcaption>
 </template>

 <template match="title/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="head/subtitle" xmlns="&xslt;">
  <p xmlns="&html;"><s:apply-templates/></p>
 </template>

 <template match="subtitle/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="body" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="body/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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

 <template match="key/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="assn/val" xmlns="&xslt;">
  <dd xmlns="&html;">
   <s:apply-templates/>
  </dd>
 </template>

 <template match="val/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="set" xmlns="&xslt;">
  <ul xmlns="&html;">
   <s:apply-templates/>
  </ul>
 </template>

 <template match="set/val" xmlns="&xslt;">
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

 <template match="data/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="about/meta" xmlns="&xslt;">
  <h:rp>(</h:rp>
  <h:rt class="about-meta"><apply-templates/></h:rt>
  <h:rp>)</h:rp>
 </template>

 <template match="meta/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="cite" xmlns="&xslt;">
  <a href="{ @of }" xmlns="&html;">
   <s:apply-templates/>
  </a>
 </template>

 <template match="cite/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="kwd" xmlns="&xslt;">
  <span class="kwd" xmlns="&html;">
   <s:value-of select="."/>
  </span>
 </template>

 <template match="link" xmlns="&xslt;">
  <choose>
   <when test="@to = 'home'">
    <a href="/" xmlns="&html;">
     <s:apply-templates/>
    </a>
   </when>
   <otherwise>
    <a href="/{ translate(@to, '-', '/') }/" xmlns="&html;">
     <s:apply-templates/>
    </a>
   </otherwise>
  </choose>
 </template>

 <template match="link/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="lit" xmlns="&xslt;">
  <mark xmlns="&html;">
   <s:apply-templates/>
  </mark>
 </template>

 <template match="lit/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="para" xmlns="&xslt;">
  <p xmlns="&html;">
   <s:apply-templates/>
  </p>
 </template>

 <template match="para/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="prog" xmlns="&xslt;">
  <figure xmlns="&html;">
   <pre>
    <code>
     <s:apply-templates/>
    </code>
   </pre>
  </figure>
 </template>

 <template match="prog/text()" xmlns="&xslt;">
  <value-of select="."/>
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

 <template match="todo/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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

 <template match="fld/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="row" xmlns="&xslt;">
  <tr xmlns="&html;">
   <s:apply-templates/>
  </tr>
 </template>

 <template match="cell/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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

 <template match="code/text()" xmlns="&xslt;">
  <value-of select="."/>
 </template>

 <template match="code//note" xmlns="&xslt;">
  <span class="note" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="email" xmlns="&xslt;">
  <span class="email" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="email/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="emph" xmlns="&xslt;">
  <strong xmlns="&html;">
   <s:apply-templates/>
  </strong>
 </template>

 <template match="emph/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="err" xmlns="&xslt;">
  <span class="err" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="err/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="warn" xmlns="&xslt;">
  <span class="warn" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="warn/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="note/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="sub" xmlns="&xslt;">
  <sub xmlns="&html;">
   <s:apply-templates/>
  </sub>
 </template>

 <template match="sub/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="sup" xmlns="&xslt;">
  <sup xmlns="&html;">
   <s:apply-templates/>
  </sup>
 </template>

 <template match="sup/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="cat" xmlns="&xslt;">
  <span class="cat" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="cat/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="fix" xmlns="&xslt;">
  <span class="fix" xmlns="&html;">
   <s:apply-templates/>
  </span>
 </template>

 <template match="fix/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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

 <template match="sep/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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

 <template match="grp/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="text" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="ital" xmlns="&xslt;">
  <i xmlns="&html;">
   <s:apply-templates/>
  </i>
 </template>

 <template match="ital/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

</s:stylesheet>
