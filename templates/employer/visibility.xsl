<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:import href="../layout.xsl" />
	<xsl:import href="../employer.xsl" />

	<xsl:template name="page">
		employer visibility
	</xsl:template>

	<xsl:template name="title">
		Employer ·
	</xsl:template>

	<xsl:template name="sidebar">
		<h2>Sub Navigation</h2>

		<ul>
			<li class="visibility">
				<a href="/employer/">Visibility</a>
			</li>
			<li class="makeiteasy">
				<a href="/employer/make-it-easy.php">Make it Easy</a>
			</li>
			<li class="results">
				<a href="/employer/results.php">Results</a>
			</li>
			<xsl:if test="user = ''">
				<li class="register">
					<a href="/employer/become-an-employer.php">Become an employer</a>
				</li>
			</xsl:if>
			<xsl:if test="role = 'employer'">
				<li class="candidates">
					<a href="/employer/candidates.php">Candidates</a>
				</li>
				<li class="resumes">
					<a href="/employer/resumes.php">Resumes</a>
				</li>
				<li class="newjob">
					<a href="/employer/post-job.php">Post new Job</a>
				</li>
			</xsl:if>
		</ul>
	</xsl:template>

	<xsl:template name="content">
		<h1>Visibility</h1>

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


		<img src="/media/images/picture_woman.jpg" alt="" class="picture" />

		<h2>What do we offer employers?</h2>
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