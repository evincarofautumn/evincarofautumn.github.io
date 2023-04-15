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

 <template match="site" xmlns="&xslt;">
  <apply-templates select="page"/>
 </template>

 <template match="page" xmlns="&xslt;">
  <e:document
   href="./{ translate(@id, '_', '/') }.xml"
   doctype-system="page.dtd"
   encoding="utf-8"
   indent="no"
   method="xml"
   >
   <processing-instruction name="xsl-stylesheet"><!--
    -->href="page.xsl" type="text/xsl"<!--
   --></processing-instruction>
   <copy-of select="."/>
  </e:document>
 </template>

</s:stylesheet>
