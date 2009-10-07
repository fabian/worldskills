<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />

	<xsl:template name="page">
		joblisting index
	</xsl:template>

	<xsl:template name="title">
		Job Listing ·
	</xsl:template>

	<xsl:template name="sidebar">
		<a href="">
			<img src="/media/images/ad-microsoft.jpg" alt="Ad" />
		</a>
	</xsl:template>

	<xsl:template name="content">
		<h1>Job Listing</h1>

		<p>Search for your prefered job. All available here on this site.
			Click on job to view details or apply to them (candidates only).</p>

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
					<a href="/joblisting/">Show all</a>
				</div>
			</fieldset>
		</form>

		<xsl:choose>
			<xsl:when test="/page/count/object/count > 0">
				<xsl:apply-templates select="jobs" />
		
				<p class="right">
					<xsl:text>Found total </xsl:text>
					<xsl:value-of select="/page/count/object/count" />
					<xsl:text> jobs. </xsl:text>
					<xsl:text>Page </xsl:text>
					<xsl:value-of select="curpage" />
					<xsl:text> of </xsl:text>
					<xsl:value-of select="maxpage" />
					<xsl:text>. </xsl:text>
					<xsl:if test="prevpage != -1">
						<a href="?page={prevpage}&amp;sort={sort}&amp;keyword={keyword}">Previous page.</a>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="nextpage != -1">
						<a href="?page={nextpage}&amp;sort={sort}&amp;keyword={keyword}">Next page.</a>
					</xsl:if>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>Sorry, no jobs found.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="jobs">

		<table>
			<colgroup>
				<col width="40%" />
				<col width="30%" />
				<col width="30%" />
			</colgroup>
			<tr class="header">
				<th scope="col">Job</th>
				<th scope="col">
					<xsl:choose>
						<xsl:when test="/page/sort = 'province'">
							Province
						</xsl:when>
						<xsl:otherwise>
							<a
								href="?sort=province&amp;page={/page/curpage - 1}&amp;keyword={/page/keyword}"
								title="Sort by Province">Province</a>
						</xsl:otherwise>
					</xsl:choose>
				</th>
				<th scope="col">
					<xsl:choose>
						<xsl:when test="/page/sort = 'category'">
							Skilled Category
						</xsl:when>
						<xsl:otherwise>
							<a
								href="?sort=category&amp;page={/page/curpage - 1}&amp;keyword={/page/keyword}"
								title="Sort by Skilled Category">Skilled Category</a>
						</xsl:otherwise>
					</xsl:choose>
				</th>
			</tr>
			<xsl:apply-templates select="object" />
		</table>
	</xsl:template>

	<xsl:template match="jobs/object">
		<xsl:variable name="province" select="province" />
		<xsl:variable name="category" select="category" />
		<tr>
			<xsl:attribute name="class">
				<xsl:text>job</xsl:text>
				<xsl:if test="not(position() mod 2)">
					<xsl:text> odd</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<th scope="row">
				<a href="/joblisting/view.php?id={id}">
					<xsl:value-of select="title" />
				</a>
			</th>
			<td>
				<xsl:value-of select="/page/provinces/object[id = $province]/name" />
			</td>
			<td>
				<xsl:value-of select="/page/categories/object[id = $category]/name" />
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>