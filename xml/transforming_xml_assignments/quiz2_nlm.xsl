<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" />
  <xsl:template match="/article">
    <xsl:apply-templates select="//ref-list" />
  </xsl:template>
  <xsl:template match="//ref-list">
    <xsl:element name="nlm-citation">
      <xsl:attribute name="citation-type">
        <xsl:text>author</xsl:text>
      </xsl:attribute>
    </xsl:element>
    <xsl:for-each select="//nlm-citation[@citation-type='journal']/person-group">
      <xsl:if test="@person-group-type='author'">
        <xsl:copy-of select="name" />
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>