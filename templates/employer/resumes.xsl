<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../form.xsl" />

	<xsl:template name="page">
		employer resumes
	</xsl:template>

	<xsl:template name="title">
		Resumes · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Resumes</h1>

		<xsl:choose>
			<xsl:when test="count(resumes/object) > 0">
				<xsl:apply-templates select="resumes" />
			</xsl:when>
			<xsl:otherwise>
				<p>No resumes to your jobs posted yet.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="resumes">

		<ul>
			<xsl:apply-templates select="object" />
		</ul>
	</xsl:template>

	<xsl:template match="resumes/object">
		<xsl:variable name="user" select="user" />
		<xsl:variable name="job" select="job" />
		<li>
			<a href="/employer/resume.php?id={id}">
				<xsl:value-of select="/page/users/object[id = $user]/firstname" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="/page/users/object[id = $user]/lastname" />
				<xsl:text>: </xsl:text>
				<xsl:value-of select="/page/jobs/object[id = $job]/title" />
			</a>
			<xsl:text> (ZIP Download)</xsl:text>
		</li>
	</xsl:template>
</xsl:stylesheet>