<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../employer.xsl" />

	<xsl:template name="page">
		employer approve
	</xsl:template>

	<xsl:template name="title">
		Approvement · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Approvement for Employer</h1>

		<p>
			<xsl:text>Name: </xsl:text>
			<xsl:value-of select="employers/object/firstname" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="employers/object/lastname" />
			<br />
			<xsl:text>Name: </xsl:text>
			<xsl:value-of select="employers/object/firstname" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="employers/object/lastname" />
		</p>

		<form action="" method="post">

			<fieldset class="submit">
				<div class="submit">
					<input type="submit" value="Approve" name="approve" />
					<xsl:text>  </xsl:text>
					<input type="submit" value="Deny" name="approve" />
				</div>
			</fieldset>
		</form>

	</xsl:template>
</xsl:stylesheet>