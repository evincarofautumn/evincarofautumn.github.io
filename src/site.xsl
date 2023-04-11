<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE stylesheet
 SYSTEM "xslt.dtd">

<s:stylesheet
 exclude-result-prefixes="g h"
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
  method="xml"
  version="1.0"
  />

 <s:namespace-alias
  result-prefix="#default"
  stylesheet-prefix="g"
  />

 <template match="/" xmlns="&xslt;">
  <apply-templates/>
 </template>

 <template match="/site" xmlns="&xslt;">
  <for-each select="page">
   <e:document
    doctype-system="page.dtd"
    encoding="utf-8"
    href="{ @id }.xml"
    method="xml"
    >
    <processing-instruction name="xsl-stylesheet"><!--
     -->href="page.xsl" type="text/xsl"<!--
    --></processing-instruction>
    <copy-of select="."/>
   </e:document>
  </for-each>
 </template>

</s:stylesheet>
