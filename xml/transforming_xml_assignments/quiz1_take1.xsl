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
                    <section>
                        <h2><xsl:value-of select="image/title" /></h2>
                        <img src="{//image/preview}" alt="{//image/title} by {//image/artist}, {//image/year}." />
                        <p><xsl:value-of select="image/medium" /> by <xsl:value-of select="image/country" /> artist <xsl:value-of select="image/artist" />
                        in <xsl:value-of select="image/year" />. Its subject matter concerns <xsl:value-of select="image/subject" />.</p>
                    </section>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>