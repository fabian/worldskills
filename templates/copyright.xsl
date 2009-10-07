<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="layout.xsl" />

	<xsl:template name="page">
		copyright index
	</xsl:template>

	<xsl:template name="title">
		Copyright ·
	</xsl:template>

	<xsl:template name="sidebar">
		<ul>
			<li class="index">
				<a href="/copyright/">Copyright</a>
			</li>
		</ul>
	</xsl:template>

	<xsl:template name="content">
		<h1>Copyright</h1>

		<p>Copyright © 2004-2009 Skills/Compétences Canada. All rights
			reserved. Funding for the design and production of this Web site has
			been provided by the Government of Canada.</p>
	</xsl:template>
</xsl:stylesheet>