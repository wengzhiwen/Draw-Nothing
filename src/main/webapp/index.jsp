<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
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
		<div data-role="fieldcontain">
			<h3>提示</h3>
			<p>如果你的候选字母中有S，也可以尝试去掉一个S然后减一位查询</p>
		</div>
		<input type="submit" value="Give me Hint!" />
		</form>
		<div data-role="fieldcontain">
			<label for="word">Word:</label>
			<input type="text" name="word" id="word" value=""  />
		</div>
		<a href="#" data-role="button" onclick="trans();" data-theme="a">Translate to Chinese</a>
		<div data-role="fieldcontain">
			<label for="chineseword">Chinese Word:</label>
			<input type="text" name="chineseword" id="chineseword" value=""  />
		</div>
		<a href="#" data-role="button" onclick="trans2e();" data-theme="a">Translate to English</a>
	</div><!-- /content -->
	<div data-role="footer">
		<h4>Powered by @zhoushuqun & @718w</h4>
	</div>
</div><!-- /page -->

<script type="text/javascript">

	function trans() {
		window.location="http://www.wordreference.com/enzh/" + $("#word").val();
	}

	function trans2e() {
		window.location="http://www.wordreference.com/zhen/" + $("#chineseword").val();
	}

</script>
<jsp:include page="/google-analytics.jsp" />
</body>
</html>