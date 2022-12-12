<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE stylesheet
 SYSTEM "xslt.dtd">

<s:stylesheet
 exclude-result-prefixes="e i"
 extension-element-prefixes="e"
 version="1.0"
 xmlns:e="&exslt;"
 xmlns:i="&xinclude;"
 xmlns:s="&xslt;"
 >

 <s:output
  encoding="utf-8"
  method="text"
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

 <template match="style" xmlns="&xslt;">
  <value-of select="normalize-space(.)"/>
 </template>

</s:stylesheet>
