<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../employer.xsl" />

	<xsl:template name="page">
		employer candidates
	</xsl:template>

	<xsl:template name="title">
		Candidate · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Candidate</h1>

		<p>
			<xsl:variable name="province" select="candidates/object/province" />
			<xsl:variable name="category" select="candidates/object/category" />
			<xsl:text>Name: </xsl:text>
			<xsl:value-of select="candidates/object/firstname" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="candidates/object/lastname" />
			<br />
			<xsl:text>Company: </xsl:text>
			<xsl:value-of select="candidates/object/company" />
			<br />
			<xsl:text>Phone: </xsl:text>
			<xsl:value-of select="candidates/object/phone" />
			<br />
			<xsl:text>Fax: </xsl:text>
			<xsl:value-of select="candidates/object/fax" />
			<br />
			<xsl:text>Cell: </xsl:text>
			<xsl:value-of select="candidates/object/cell" />
			<br />
			<xsl:text>Street/Box Nr.: </xsl:text>
			<xsl:value-of select="candidates/object/street" />
			<br />
			<xsl:text>Postal Code: </xsl:text>
			<xsl:value-of select="candidates/object/postal" />
			<br />
			<xsl:text>City: </xsl:text>
			<xsl:value-of select="candidates/object/city" />
			<br />
			<xsl:text>Province: </xsl:text>
			<xsl:value-of select="/page/categories/object[id = $category]/name" />
			<br />
			<xsl:text>Skilled Category: </xsl:text>
			<xsl:value-of select="/page/provinces/object[id = $province]/name" />
		</p>
		
		<p><a href="/employer/candidates.php">« Back</a></p>
	</xsl:template>
</xsl:stylesheet>