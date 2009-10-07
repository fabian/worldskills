<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../form.xsl" />

	<xsl:template name="page">
		employer newjob
	</xsl:template>

	<xsl:template name="title">
		Post new Job · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Post new Job</h1>

		<img src="/media/images/picture_mans.jpg" alt="" class="picture" />

		<form action="" method="post">
			<fieldset class="input">
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'title'" />
					<xsl:with-param name="title" select="'Title'" />
				</xsl:call-template>
				<xsl:call-template name="form_textarea">
					<xsl:with-param name="id" select="'description'" />
					<xsl:with-param name="title" select="'Description'" />
				</xsl:call-template>
				<xsl:call-template name="form_select">
					<xsl:with-param name="id" select="'province'" />
					<xsl:with-param name="title" select="'Province'" />
					<xsl:with-param name="options">
						<option value=""></option>
						<xsl:for-each select="/page/provinces/object">
							<option value="{id}">
								<xsl:if test="/page/values/province = id">
									<xsl:attribute name="selected">selected</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="name" />
							</option>
						</xsl:for-each>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="form_select">
					<xsl:with-param name="id" select="'category'" />
					<xsl:with-param name="title" select="'Skills Category'" />
					<xsl:with-param name="options">
						<option value=""></option>
						<xsl:for-each select="/page/categories/object">
							<option value="{id}">
								<xsl:if test="/page/values/category = id">
									<xsl:attribute name="selected">selected</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="name" />
							</option>
						</xsl:for-each>
					</xsl:with-param>
				</xsl:call-template>
			</fieldset>

			<fieldset class="submit">
				<div class="submit">
					<input type="submit" value="Post Job" />
					<xsl:text>  </xsl:text>
					<a href="">Cancel</a>
				</div>
			</fieldset>
		</form>

	</xsl:template>
</xsl:stylesheet>