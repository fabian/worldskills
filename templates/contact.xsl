<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="layout.xsl" />

	<xsl:template name="page">
		contact index
	</xsl:template>

	<xsl:template name="title">
		Contact ·
	</xsl:template>

	<xsl:template name="sidebar">
		<a href="">
			<img src="/media/images/ad-microsoft.jpg" alt="Ad" />
		</a>
	</xsl:template>

	<xsl:template name="content">
		<h1>Contact</h1>

		<p>
			<xsl:text>Write a mail to: </xsl:text>
			<xsl:value-of select="email" disable-output-escaping="yes" />
		</p>

		<img src="/media/images/picture_cook.jpg" alt="" class="picture" />

		<p>
			Mailing Address
			<br />
			260 Saint Raymond Boulevard
			<br />
			Suite 205
			<br />
			Gatineau, QC J9A 3G7
			<br />
			(819) 771-7545
			<br />
			(819) 771-5575
			<br />
			Toll Free: 1-877-754-5226
		</p>

		<table>
			<tr class="header">
				<th scope="col">Name</th>
				<th scope="col">Position</th>
				<th scope="col">Phone</th>
				<th scope="col">Fax</th>
			</tr>
			<tr>
				<th scope="row">Shaun Thorson</th>
				<td>Executive Director</td>
				<td>+1 (819) 771-7545 - Ext 3</td>
				<td>+1 (819) 771-5575</td>
			</tr>
			<tr>
				<th scope="row">Christianne Scholfield</th>
				<td>Director, Pan-Canadian Partner Development</td>
				<td>819-771-7545 Ext1</td>
				<td>819-771-5575</td>
			</tr>
			<tr>
				<th scope="row">Karine Raymond</th>
				<td>Project Director</td>
				<td>+1 (819) 771-7545 - Ext 6</td>
				<td>+1 (819) 771-5575</td>
			</tr>
			<tr>
				<th scope="row">Nadine Gallant</th>
				<td>Events and Administrative Assistant</td>
				<td>+1 (819) 771-7545 Ext. 5</td>
				<td>+1 (819) 771-5575</td>
			</tr>
			<tr>
				<th scope="row">Micheline Gagnon-Vaillancourt</th>
				<td>Management Assistant and Office Coordinator</td>
				<td>+1 (819) 771-7545 Ext. 2</td>
				<td>+1 (819) 771-5575</td>
			</tr>
			<tr>
				<th scope="row">Cynthia Faubert</th>
				<td>Communications/Marketing Officer</td>
				<td>+1 (819) 771-7545 Ext. 4</td>
				<td>+1 (819) 771-5575</td>
			</tr>
			<tr>
				<th scope="row">April Ashford</th>
				<td>Accountant</td>
				<td>+1 (819) 771-7545</td>
				<td>+1 (819) 771-5575</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>