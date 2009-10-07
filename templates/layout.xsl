<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="form.xsl" />

	<xsl:output method="xml" encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		indent="yes" omit-xml-declaration="yes" />

	<xsl:template match="/page">

		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>
					<xsl:call-template name="title" />
					<xsl:value-of select="lang/title" />
				</title>

				<meta name="author" content="Skills/Compétences Canada" />
				<meta name="description"
					content="Skills. Powered by Canada. Get connected with the best!" />
				<meta name="keywords"
					content="skills, compétences, canada, employers, job portal, jobs, candidate, worldskills" />

				<link rel="stylesheet" type="text/css" href="/media/stylesheets/screen.css"
					media="screen" />
				<link rel="stylesheet" type="text/css" href="/media/stylesheets/print.css"
					media="print" />

				<xsl:call-template name="header" />
			</head>

			<body>
				<xsl:attribute name="class">
					<xsl:value-of select="@lang" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="@font" />
					<xsl:text> </xsl:text>
					<xsl:call-template name="page" />
				</xsl:attribute>
				<div id="container">
					<xsl:comment>
						<xsl:text>Start Header</xsl:text>
					</xsl:comment>
					<div id="header">
						<a href="/" title="{lang/menu_home}">
							<img src="/media/images/{lang/logo}" alt="Skills/Compétences Canada" />
						</a>
					</div>
					<xsl:comment>
						<xsl:text>End Header</xsl:text>
					</xsl:comment>

					<xsl:comment>
						<xsl:text>Start Content</xsl:text>
					</xsl:comment>
					<div id="content">
						<xsl:apply-templates select="message" />

						<xsl:call-template name="content" />
					</div>
					<xsl:comment>
						<xsl:text>End Content</xsl:text>
					</xsl:comment>

					<xsl:comment>
						<xsl:text>Start Main Menu</xsl:text>
					</xsl:comment>
					<ul id="menu">
						<li class="home">
							<a href="/">
								<xsl:value-of select="lang/menu_home" />
							</a>
						</li>
						<li class="about">
							<a href="/about/">
								<xsl:value-of select="lang/menu_about" />
							</a>
						</li>
						<li class="employer">
							<a href="/employer/">
								<xsl:value-of select="lang/menu_employer" />
							</a>
						</li>
						<xsl:if test="user = ''">
							<li class="candidate">
								<a href="/candidate/">
									<xsl:value-of select="lang/menu_candidate" />
								</a>
							</li>
						</xsl:if>
						<li class="joblisting">
							<a href="/joblisting/">
								<xsl:value-of select="lang/menu_joblisting" />
							</a>
						</li>
						<li class="advice">
							<a href="/advice/">
								<xsl:value-of select="lang/menu_advice" />
							</a>
						</li>
						<li class="contact">
							<a href="/contact/">
								<xsl:value-of select="lang/menu_contact" />
							</a>
						</li>
					</ul>
					<xsl:comment>
						<xsl:text>End Main Menu</xsl:text>
					</xsl:comment>

					<xsl:comment>
						<xsl:text>Start Sidebar</xsl:text>
					</xsl:comment>
					<div id="sidebar">
						<xsl:call-template name="sidebar" />
					</div>
					<xsl:comment>
						<xsl:text>End Sidebar</xsl:text>
					</xsl:comment>

					<xsl:comment>
						<xsl:text>Start Top</xsl:text>
					</xsl:comment>
					<div id="slogan">
						<p>Skills. Powered by Canada. Get connected with the best!</p>
					</div>

					<div id="options">
						<p>
							<xsl:choose>
								<xsl:when test="user != ''">
									<xsl:text>Welcome </xsl:text>
									<xsl:value-of select="username" />
									<xsl:text>. </xsl:text>
									<xsl:choose>
										<xsl:when test="role = 'admin'">
											<a href="/admin/">Admin</a>
											<xsl:text>. </xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<a href="/auth/password.php">Change Password</a>
											<xsl:text>. </xsl:text>
										</xsl:otherwise>
									</xsl:choose>
									<a href="/auth/logout.php">Logout</a>
								</xsl:when>
								<xsl:otherwise>
									<a href="/auth/login.php">Login</a>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:text>  ·  </xsl:text>
							<a href="?lang=en" class="lang en">English</a>
							<xsl:text>  /  </xsl:text>
							<a href="?lang=fr" class="lang fr">French</a>
							<xsl:text>  ·  </xsl:text>
							<a href="?font=small" class="font small" title="Normal font size">A</a>
							<xsl:text>  </xsl:text>
							<a href="?font=large" class="font large" title="Large font size">A</a>
						</p>
					</div>
					<xsl:comment>
						<xsl:text>End Top</xsl:text>
					</xsl:comment>

					<xsl:comment>
						<xsl:text>Start Footer</xsl:text>
					</xsl:comment>
					<div id="footer">
						<p>
							<a href="/copyright/"><xsl:value-of select="lang/menu_copyright" /></a>
							<xsl:text> © 2004-2009 Skills/Compétences Canada. </xsl:text>
							<a href="/privacy/"><xsl:value-of select="lang/menu_privacy" /></a>
							<xsl:text>. </xsl:text>
							<a href="/legal/"><xsl:value-of select="lang/menu_legal" /></a>
							<xsl:text>. </xsl:text>
						</p>
					</div>
					<xsl:comment>
						<xsl:text>End Footer</xsl:text>
					</xsl:comment>
				</div>
			</body>
		</html>

	</xsl:template>

	<xsl:template name="page">
	</xsl:template>

	<xsl:template name="title">
	</xsl:template>

	<xsl:template name="header">
	</xsl:template>

	<xsl:template name="sidebar">
	</xsl:template>

	<xsl:template name="content">
	</xsl:template>

	<xsl:template match="page/message">
		<p class="message">
			<xsl:value-of select="." />
		</p>
	</xsl:template>
</xsl:stylesheet>