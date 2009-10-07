<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />

	<xsl:template name="page">
		auth forgot
	</xsl:template>

	<xsl:template name="title">
		Forgot Password ·
	</xsl:template>

	<xsl:template name="content">
		<h1>Forgot Password</h1>

		<p>Fill out this form to get a new password by email.</p>

		<img src="/media/images/picture_mans.jpg" alt="" class="picture" />

		<form action="" method="post">
			<fieldset class="input">
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'email'" />
					<xsl:with-param name="title" select="'Email Address'" />
				</xsl:call-template>
			</fieldset>

			<fieldset class="submit">
				<div class="submit">
					<input type="submit" value="Send new Password" />
					<xsl:text>  </xsl:text>
					<a href="/auth/login.php">Cancel</a>
				</div>
			</fieldset>
		</form>

	</xsl:template>
</xsl:stylesheet>