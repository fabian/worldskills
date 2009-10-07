<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="layout.xsl" />

	<xsl:template name="page">
		home index
	</xsl:template>

	<xsl:template name="sidebar">
		<h2>Site statistics</h2>

		<p>
			<xsl:text>Employers: </xsl:text>
			<xsl:value-of select="employers/object/count" />
			<br />
			<xsl:text>Candidates: </xsl:text>
			<xsl:value-of select="candidates/object/count" />
			<br />
			<xsl:text>Listed jobs: </xsl:text>
			<xsl:value-of select="jobs/object/count" />
		</p>

		<a href="">
			<img src="/media/images/ad-microsoft.jpg" alt="Microsoft" title="Visit Microsoft." />
		</a>
	</xsl:template>

	<xsl:template name="content">
		<h1>Welcome</h1>

		<p>Skills Canada’s employment web portal is to help you make the
			most
			of your working life. Whether that means finding the best
			job,
			making
			the smart career move or hiring the right person, we
			have
			the best
			tools and resources available anywhere. This
			employment
			portal is a
			stepping stone for both young people and
			employers.</p>


		<img src="/media/images/picture_woman.jpg" alt="Jewelery Woman"
			title="Jewelery" class="picture" />

		<div class="animation">
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				width="575" height="200">
				<param name="movie" value="/media/flash/animation.swf" />
				<param name="quality" value="high" />
				<param name="wmode" value="opaque" />
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="/media/flash/animation.swf"
					width="575" height="200">
					<!--<![endif]-->
					<param name="quality" value="high" />
					<param name="wmode" value="opaque" />
					<div>
						<h4>Content on this page requires a newer version of Adobe Flash
							Player.</h4>
						<p>
							<a href="http://www.adobe.com/go/getflashplayer">
								<img
									src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
									alt="Get Adobe Flash player" />
							</a>
						</p>
					</div>
					<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>

		<h2>What do we offer employers?</h2>

		<img src="/media/images/picture_cook.jpg" alt="Cook" title="Cook at work"
			class="picture" />

		<p>We enable organizations to hire more efficiently and
			cost-effectively by offering them information about what works
			online
			to source qualified candidates. Skills Canada also has the
			most job
			seekers per job posting in the industry, which means
			greater
			visibility for your employer brand! </p>

		<p>Besides that, former WorldSkills candidates have already proven
			to
			be the top of the bill for the Canadian market. This making it
			easier
			for you as an employer to find highly skilled, highly
			motivated
			personnel. Bold statement? No. According to Jamie
			Gerrard: “The
			experience has provided me with so much more than
			winning a gold medal
			for what I love to do. I was able to see new
			places, meet new people,
			and my experiences have helped me to
			develop a newfound respect for
			the wide range of careers in
			trades
			and technologies as well as for the
			people that share a
			passion
			for them as I do mine.”</p>

		<div class="ad">
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				width="468" height="60">
				<param name="movie" value="/media/flash/ad-epic.swf" />
				<param name="quality" value="high" />
				<param name="wmode" value="opaque" />
				<!--[if !IE]>-->
				<object type="application/x-shockwave-flash" data="/media/flash/ad-epic.swf"
					width="468" height="60">
					<!--<![endif]-->
					<param name="quality" value="high" />
					<param name="wmode" value="opaque" />
					<div>
						<h4>Content on this page requires a newer version of Adobe Flash
							Player.</h4>
						<p>
							<a href="http://www.adobe.com/go/getflashplayer">
								<img
									src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
									alt="Get Adobe Flash player" />
							</a>
						</p>
					</div>
					<!--[if !IE]>-->
				</object>
				<!--<![endif]-->
			</object>
		</div>

		<h2>What do we offer competitors?</h2>
		<p>The Skills Canada’s employment web portal is the opportunity of
			the
			future for you, an opportunity just waiting for you to grab
			hold of.
			Whether you’re just starting out in your career or are
			already
			experienced in your work field, here on the Skills Canada
			employment
			portal you’ll find the job that suits you.</p>

		<p>Donavon Bailey: “One thing is for sure - I would definitely
			recommend signing up in Skills Canada employment portal since it
			opens avenues that it opens for your future. I now work for an
			international company and assist them to redevelop their Web
			presence.”</p>
	</xsl:template>
</xsl:stylesheet>