<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../form.xsl" />

	<xsl:template name="page">
		employer candidates
	</xsl:template>

	<xsl:template name="title">
		Candidates · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Candidates</h1>

		<img src="/media/images/picture_cook.jpg" alt="" class="picture" />

		<form action="" method="get">
			<fieldset class="input">
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'keyword'" />
					<xsl:with-param name="title" select="'Keyword'" />
				</xsl:call-template>

				<div class="submit">
					<input type="submit" value="Search" />
					<xsl:text>  </xsl:text>
					<a href="/employer/candidates.php">Show all</a>
				</div>
			</fieldset>
		</form>

		<xsl:choose>
			<xsl:when test="/page/count/object/count > 0">
				<xsl:apply-templates select="candidates" />
		
				<p class="right">
					<xsl:text>Found total </xsl:text>
					<xsl:value-of select="/page/count/object/count" />
					<xsl:text> candidates. </xsl:text>
					<xsl:text>Page </xsl:text>
					<xsl:value-of select="curpage" />
					<xsl:text> of </xsl:text>
					<xsl:value-of select="maxpage" />
					<xsl:text>. </xsl:text>
					<xsl:if test="prevpage != -1">
						<a href="?page={prevpage}&amp;keyword={keyword}">Previous page.</a>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="nextpage != -1">
						<a href="?page={nextpage}&amp;keyword={keyword}">Next page.</a>
					</xsl:if>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>Sorry, no candidates found.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="candidates">
		<table>
			<colgroup>
				<col width="20%" />
				<col width="40%" />
				<col width="40%" />
			</colgroup>
			<tr class="header">
				<th scope="col">Candidate</th>
				<th scope="col">
					Skilled Category
				</th>
				<th scope="col">
					Province
				</th>
			</tr>
			<xsl:apply-templates select="object" />
		</table>
	</xsl:template>

	<xsl:template match="candidates/object">
		<xsl:variable name="province" select="province" />
		<xsl:variable name="category" select="category" />
		<tr>
			<xsl:attribute name="class">
				<xsl:text>candidate</xsl:text>
				<xsl:if test="not(position() mod 2)">
					<xsl:text> odd</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<th scope="row">
			<a href="/employer/candidate.php?id={id}">
				<xsl:value-of select="firstname" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="lastname" />
			</a>
			</th>
			<td>
				<xsl:value-of select="/page/categories/object[id = $category]/name" />
			</td>
			<td>
				<xsl:value-of select="/page/provinces/object[id = $province]/name" />
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>