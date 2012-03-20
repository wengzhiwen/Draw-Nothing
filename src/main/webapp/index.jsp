<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no″">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>

	<title>Draw Nothing</title>
</head>
<body>
<div data-role="page">

	<div data-role="header">
		<h1>Draw Nothing</h1>
	</div><!-- /header -->

	<div data-role="content">
		<form action="result.jsp" method="get">
		<div data-role="fieldcontain">
			<label for="letters">Letters:</label>
			<input type="text" name="letters" id="letters" value=""  />
		</div>
		<div data-role="fieldcontain">
			<label for="count">Target Word Length:</label>
			<input type="range" name="count" id="count" value="5" min="3" max="8" data-highlight="true"  />
		</div>
		<input type="submit" value="Give me Hint!" />
		</form>
	</div><!-- /content -->
	<div data-role="footer">
		<h4>Powered by @zhoushuqun & @718w</h4>
	</div>
</div><!-- /page -->

<script type="text/javascript">

	var _gaq = _gaq || [];
	_gaq.push(['_setAccount', 'UA-30163216-1']);
	_gaq.push(['_trackPageview']);

	(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	})();

</script>

</body>
</html>