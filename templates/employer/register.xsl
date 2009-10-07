<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="visibility.xsl" />
	<xsl:import href="../employer.xsl" />

	<xsl:template name="page">
		employer register
	</xsl:template>

	<xsl:template name="title">
		Become an Employer · Employer ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Become an Employer</h1>

		<p>Don't wait for candidates to find you and take control of your
			hiring process.</p>

		<img src="/media/images/picture_mans.jpg" alt="" class="picture" />
		<p>Skills Canada's database solutions enable you to proactively search
			highly qualified candidates who may not be actively searching for a
			job right now, whenever you need people.</p>

		<p>
			Create an account on the new Skills Canada Employment Portal!
			Required fields are marked with a
			<span class="required" title="Required field">*</span>.
		</p>
		
		<xsl:if test="count(errors/*) > 0">
			<p class="message">One or more errors occured. Please check the marked fields below.</p>
		</xsl:if>

		<form action="" method="post" onsubmit="return validate(event)">
			<xsl:call-template name="form_employer" />

			<fieldset class="submit">
				<div class="submit">
					<input type="submit" value="Register" />
					<xsl:text>  </xsl:text>
					<a href="">Reset</a>
				</div>
			</fieldset>
		</form>

	</xsl:template>
</xsl:stylesheet>