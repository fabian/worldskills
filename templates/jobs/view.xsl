<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />

	<xsl:template name="page">
		joblisting view
	</xsl:template>

	<xsl:template name="title">
		<xsl:value-of select="jobs/object/title" />
		· Job Listing ·
	</xsl:template>

	<xsl:template name="content">
		<h1>
			<xsl:value-of select="jobs/object/title" />
		</h1>

		<p>
			<xsl:value-of select="jobs/object/description"
				disable-output-escaping="yes" />
		</p>

		<img src="/media/images/picture_woman.jpg" alt="" class="picture" />

		<p>
			<xsl:variable name="province" select="jobs/object/province" />
			<xsl:variable name="category" select="jobs/object/category" />
			<xsl:text>Province: </xsl:text>
			<xsl:value-of select="/page/categories/object[id = $category]/name" />
			<br />
			<xsl:text>Skilled Category: </xsl:text>
			<xsl:value-of select="/page/provinces/object[id = $province]/name" />
		</p>

		<xsl:choose>
			<xsl:when test="role = 'candidate'">
				<form action="" method="post" enctype="multipart/form-data">
					<fieldset class="input">
						<h2>Apply for job</h2>
						<xsl:call-template name="form_input">
							<xsl:with-param name="id" select="'upload'" />
							<xsl:with-param name="title" select="'CV'" />
							<xsl:with-param name="type" select="'file'" />
						</xsl:call-template>
						<xsl:call-template name="form_textarea">
							<xsl:with-param name="id" select="'application'" />
							<xsl:with-param name="title" select="'Application Text'" />
						</xsl:call-template>
					</fieldset>

					<fieldset class="submit">
						<div class="submit">
							<input type="submit" value="Apply for Job" />
							<xsl:text>  </xsl:text>
							<a href="/joblisting/">Cancel</a>
						</div>
					</fieldset>
				</form>
			</xsl:when>
			<xsl:otherwise>
				<p>
					<xsl:text>Register now as Candidate to quickly reply to this job with your CV
					and application description: </xsl:text>
					<a href="/candidate/">Become a candidate</a>
					<xsl:text>.</xsl:text>
				</p>
				<p>
					<a href="/joblisting/">« All jobs</a>
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>