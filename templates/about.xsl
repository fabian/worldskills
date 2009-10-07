<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="layout.xsl" />

	<xsl:template name="page">
		about skills
	</xsl:template>

	<xsl:template name="title">
		<xsl:value-of select="lang/menu_about" />
		<xsl:text> · </xsl:text>
	</xsl:template>

	<xsl:template name="sidebar">
		<ul>
			<li class="skills">
				<a href="/">Skills Canada</a>
			</li>
		</ul>

		<a href="">
			<img src="/media/images/ad-microsoft.jpg" alt="Ad" />
		</a>
	</xsl:template>

	<xsl:template name="content">
		<xsl:value-of select="lang/about" disable-output-escaping="yes" />
	</xsl:template>
</xsl:stylesheet>