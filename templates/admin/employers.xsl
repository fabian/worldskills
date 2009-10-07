<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />

	<xsl:template name="page">
		admin index
	</xsl:template>

	<xsl:template name="title">
		Admin ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Admin</h1>

		<xsl:apply-templates select="employers" />
	</xsl:template>

	<xsl:template match="employers">

		<table>
			<tr class="header">
				<th>Name</th>
				<th>Actions</th>
			</tr>
			<xsl:apply-templates select="object" />
		</table>
	</xsl:template>

	<xsl:template match="employers/object">
		<tr>
			<td>
				<xsl:value-of select="firstname" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="lastname" />
			</td>
			<td>
				<form action="" method="post">
					<input type="hidden" name="id" value="{id}" />
					<xsl:if test="approved = '0'">
						<input type="submit" name="approve" value="Approve" />
						<xsl:text> </xsl:text>
						<input type="submit" name="deny" value="Deny" />
						<xsl:text> </xsl:text>
					</xsl:if>
					<input type="submit" name="delete" value="Delete" />
				</form>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>