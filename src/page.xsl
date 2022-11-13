<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE stylesheet
 SYSTEM "style.dtd">

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

 <template match="/" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="/page" xmlns="&xslt;">
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
    <s:apply-templates select="/page/head"/>
    <s:apply-templates select="/page/body"/>
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
  <h1 xmlns="&html;"><s:value-of select="."/></h1>
 </template>

 <template match="head/subtitle" xmlns="&xslt;">
  <p xmlns="&html;"><s:value-of select="."/></p>
 </template>

 <template match="body" xmlns="&xslt;">
  <s:apply-templates/>
 </template>

 <template match="defs" xmlns="&xslt;">
  <dl xmlns="&html;">
   <s:apply-templates/>
  </dl>
 </template>

 <template match="defs/key" xmlns="&xslt;">
  <dt xmlns="&html;">
   <s:apply-templates/>
  </dt>
 </template>

 <template match="defs/val" xmlns="&xslt;">
  <dd xmlns="&html;">
   <s:apply-templates/>
  </dd>
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
  <value-of select="."/>
 </template>

</s:stylesheet>
