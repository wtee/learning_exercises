<?xml version="1.0"?>
<!-- This code is expanded from code provide with class materials. -->
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" />
    
    <xsl:template match="/">
        <xsl:apply-templates select="catalog"/>
    </xsl:template>
    
    <xsl:template match="catalog">
        <html> 
            <head> 
                <title>Quiz 1</title>
            </head>
            <body bgcolor="#ffffff">
                <main>
                    <h1><xsl:value-of select="type"/></h1>
                    <xsl:for-each select="image">
                    <section>
                        <h2><xsl:value-of select="title" /></h2>
                        <img src="{preview}" alt="{title} by {artist}, {year}." />
                        <p><xsl:value-of select="medium" /> by <xsl:value-of select="artist" /> (<xsl:value-of select="country" />) 
                        in <xsl:value-of select="year" />. Its subject matter concerns <xsl:value-of select="subject" />.</p>
                    </section>
                    </xsl:for-each>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>