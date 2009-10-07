<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />
	<xsl:import href="temp.xsl" />

	<xsl:template name="page">
		candidate register
	</xsl:template>

	<xsl:template name="title">
		Candidate ·
	</xsl:template>

	<xsl:template name="sidebar">
		<h2>Sub Navigation</h2>

		<ul>
			<li class="register">
				<a href="/candidate/">Become a candidate</a>
			</li>
		</ul>

		<a href="">
			<img src="/media/images/ad-microsoft.jpg" alt="Ad" />
		</a>
	</xsl:template>

	<xsl:template name="content">
		<h1>Become a candidate</h1>

		<p>Create your profile on the new Skills Canada Employment Portal! As
			a member, you can upload your resume and apply for jobs. </p>

		<img src="/media/images/picture_mans.jpg" alt="" class="picture" />

		<p>
			Required fields are marked with a
			<span class="required" title="Required field">*</span>
			.
		</p>
		
		<xsl:if test="count(errors/*) > 0">
			<p class="message">One or more errors occured. Please check the marked fields below.</p>
		</xsl:if>

		<form action="" method="post" onsubmit="return validate(event)">
			<fieldset class="input">
				<h2>Personal</h2>
				<xsl:call-template name="form_select">
					<xsl:with-param name="id" select="'title'" />
					<xsl:with-param name="title" select="'Title'" />
					<xsl:with-param name="options">
						<option value="mr">
							<xsl:if test="/page/values/title = 'mr'">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
							<xsl:text>Mr</xsl:text>
						</option>
						<option value="mrs">
							<xsl:if test="/page/values/title = 'mrs'">
								<xsl:attribute name="selected">selected</xsl:attribute>
							</xsl:if>
							<xsl:text>Mrs</xsl:text>
						</option>
					</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'firstname'" />
					<xsl:with-param name="title" select="'First Name'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'lastname'" />
					<xsl:with-param name="title" select="'Last Name'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'email'" />
					<xsl:with-param name="title" select="'Email Address'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'password'" />
					<xsl:with-param name="title" select="'Password'" />
					<xsl:with-param name="type" select="'password'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'repeat'" />
					<xsl:with-param name="title" select="'Password Repeat'" />
					<xsl:with-param name="type" select="'password'" />
				</xsl:call-template>
			</fieldset>

			<fieldset class="input">
				<h2>Address</h2>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'company'" />
					<xsl:with-param name="title" select="'Company'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'phone'" />
					<xsl:with-param name="title" select="'Phone'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'fax'" />
					<xsl:with-param name="title" select="'Fax'" />
					<xsl:with-param name="required" select="false()" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'cell'" />
					<xsl:with-param name="title" select="'Cell'" />
					<xsl:with-param name="required" select="false()" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'street'" />
					<xsl:with-param name="title" select="'Street/Box Nr.'" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'postal'" />
					<xsl:with-param name="title" select="'Postal Code'" />
					<xsl:with-param name="required" select="false()" />
				</xsl:call-template>
				<xsl:call-template name="form_input">
					<xsl:with-param name="id" select="'city'" />
					<xsl:with-param name="title" select="'City'" />
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
					<xsl:with-param name="title" select="'Skilled Category'" />
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
					<input type="submit" value="Register" />
					<xsl:text>  </xsl:text>
					<a href="">Reset</a>
				</div>
			</fieldset>
		</form>

	</xsl:template>
</xsl:stylesheet>