<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="/">
    <xsl:apply-templates select="ArticleSet"/>
  </xsl:template>  
  <xsl:template match="ArticleSet">
    <html> 
      <head> 
        <title>Quiz 2: PubMed</title>
      </head>
      <body>
        <main>
          <h1>Author listed by PubMed</h1>
          <h2>Authors whose last names begin with 'D'</h2>
          <ul>
            <xsl:for-each select="Article">
              <xsl:for-each select="AuthorList/Author">
                <xsl:if test="starts-with(LastName/text(), 'D')">
                  <xsl:element name="li"><xsl:value-of select="FirstName" /><xsl:text> </xsl:text><xsl:value-of select="LastName" /></xsl:element>
                </xsl:if>
              </xsl:for-each>
            </xsl:for-each>
          </ul>
          <xsl:element name="h2">All authors</xsl:element>
          <xsl:element name="ul">
            <xsl:for-each select="Article">
              <xsl:element name="h3"><xsl:value-of select="ArticleTitle" /></xsl:element>
              <xsl:for-each select="AuthorList/Author">
                <xsl:sort select="LastName" />
                <xsl:element name="li">
                  <xsl:choose>
                    <xsl:when test="LastName">
                      <xsl:attribute name="type">person</xsl:attribute>
                      <xsl:value-of select="FirstName" />
                      <xsl:text> </xsl:text>
                      <xsl:if test="MiddleName">
                        <xsl:value-of select="MiddleName" />
                        <xsl:text> </xsl:text>
                      </xsl:if>
                      <xsl:value-of select="LastName" />
                      <xsl:if test="Suffix">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="Suffix" />
                      </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="type">corporate</xsl:attribute>
                      <xsl:value-of select="CollectiveName" />
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:element>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:element>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
