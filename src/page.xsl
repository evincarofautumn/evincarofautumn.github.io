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
     <s:value-of select="title"/>
    </title>
    <link
     href="/style.css"
     rel="stylesheet"
     type="text/css"
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

 <template match="title" xmlns="&xslt;">
  <h1 xmlns="&html;"><s:value-of select="."/></h1>
 </template>

 <template match="subtitle" xmlns="&xslt;">
  <p xmlns="&html;"><s:value-of select="."/></p>
 </template>

 <template match="body" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="body/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="defs" xmlns="&xslt;">
  <dl xmlns="&html;">
   <s:apply-templates/>
  </dl>
 </template>

 <template match="def" xmlns="&xslt;">
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

 <template match="val" xmlns="&xslt;">
  <dd xmlns="&html;">
   <s:apply-templates/>
  </dd>
 </template>

 <template match="val/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="link" xmlns="&xslt;">
  <choose>
   <when test="@to = 'home'">
    <a href="/" xmlns="&html;">
     <s:value-of select="."/>
    </a>
   </when>
   <otherwise>
    <a href="/{ @to }/" xmlns="&html;">
     <s:value-of select="."/>
    </a>
   </otherwise>
  </choose>
 </template>

 <template match="para" xmlns="&xslt;">
  <p xmlns="&html;">
   <s:apply-templates/>
  </p>
 </template>

 <template match="para/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
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
  <span class="todo" xmlns="&html;">
   <s:text>TODO</s:text>
   <if test="./*" xmlns="&xslt;">
    <text>: </text>
    <value-of select="."/>
   </if>
  </span>
 </template>

 <template match="table" xmlns="&xslt;">
  <table xmlns="&html;">
   <thead>
    <s:apply-templates select="fmt"/>
   </thead>
   <tbody>
    <s:apply-templates select="row"/>
   </tbody>
  </table>
 </template>

 <template match="fmt" xmlns="&xslt;">
  <tr xmlns="&html;">
   <s:apply-templates select="fld"/>
  </tr>
 </template>

 <template match="fld" xmlns="&xslt;">
  <th xmlns="&html;">
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

 <template match="cell" xmlns="&xslt;">
  <td xmlns="&html;">
   <s:apply-templates/>
  </td>
 </template>

 <template match="cell/text()" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

 <template match="code" xmlns="&xslt;">
  <code xmlns="&html;">
   <s:apply-templates/>
  </code>
 </template>

 <template match="code/text()" xmlns="&xslt;">
  <value-of select="."/>
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
   <for-each select="./* | ./text()" xmlns="&xslt;">
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
  <span class="grp" xmlns="&html;">
   <s:text>(</s:text>
   <s:apply-templates/>
   <s:text>)</s:text>
  </span>
 </template>

 <template match="text" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

</s:stylesheet>
