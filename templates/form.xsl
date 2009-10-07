<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template name="form_input">
		<xsl:param name="id" />
		<xsl:param name="title" />
		<xsl:param name="description" select="''" />
		<xsl:param name="required" select="true()" />
		<xsl:param name="type" select="'text'" />

		<div>
			<xsl:attribute name="class">
				<xsl:text>text</xsl:text>
				<xsl:if test="/page/errors/*[name() = $id] != ''">
				<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label for="{$id}">
				<xsl:value-of select="$title" />
				<xsl:text>:</xsl:text>
				<xsl:if test="$required">
					<xsl:text> </xsl:text>
					<span class="required" title="Required field">*</span>
				</xsl:if>
			</label>
			<input id="{$id}" name="{$id}" value="{/page/values/*[name() = $id]}"
				type="{$type}" />
			<span class="message">
				<xsl:apply-templates select="/page/errors/*[name() = $id]" />
				<xsl:if test="$description != ''">
					<xsl:value-of select="$description" />
				</xsl:if>
			</span>
		</div>
	</xsl:template>

	<xsl:template name="form_textarea">
		<xsl:param name="id" />
		<xsl:param name="title" />
		<xsl:param name="description" select="''" />
		<xsl:param name="required" select="true()" />

		<div>
			<xsl:attribute name="class">
				<xsl:text>text area</xsl:text>
				<xsl:if test="/page/errors/*[name() = $id] != ''">
				<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label for="{$id}">
				<xsl:value-of select="$title" />
				<xsl:text>:</xsl:text>
				<xsl:if test="$required">
					<xsl:text> </xsl:text>
					<span class="required" title="Required field">*</span>
				</xsl:if>
			</label>
			<textarea id="{$id}" name="{$id}" rows="3">
				<xsl:value-of select="/page/values/*[name() = $id]" />
			</textarea>
			<span class="message">
				<xsl:apply-templates select="/page/errors/*[name() = $id]" />
				<xsl:if test="$description != ''">
					<xsl:value-of select="$description" />
				</xsl:if>
			</span>
		</div>
	</xsl:template>

	<xsl:template name="form_select">
		<xsl:param name="id" />
		<xsl:param name="title" />
		<xsl:param name="options" />
		<xsl:param name="description" select="''" />
		<xsl:param name="required" select="true()" />

		<div>
			<xsl:attribute name="class">
				<xsl:text>text</xsl:text>
				<xsl:if test="/page/errors/*[name() = $id] != ''">
				<xsl:text> error</xsl:text>
				</xsl:if>
			</xsl:attribute>
			<label for="{$id}">
				<xsl:value-of select="$title" />
				<xsl:text>:</xsl:text>
				<xsl:if test="$required">
					<xsl:text> </xsl:text>
					<span class="required" title="Required field">*</span>
				</xsl:if>
			</label>
			<select id="{$id}" name="{$id}">
				<xsl:copy-of select="$options" />
			</select>
			<span class="message">
				<xsl:apply-templates select="/page/errors/*[name() = $id]" />
				<xsl:if test="$description != ''">
					<xsl:value-of select="$description" />
				</xsl:if>
			</span>
		</div>
	</xsl:template>

	<xsl:template match="errors/*">
		<xsl:value-of select="." />
		<xsl:text> </xsl:text>
	</xsl:template>
</xsl:stylesheet>