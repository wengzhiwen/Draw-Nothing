<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.wengs.drawnothing.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="drawNothing" class="net.wengs.drawnothing.DrawNothing" scope="application" />
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no″">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.css" />
	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.0.1/jquery.mobile-1.0.1.min.js"></script>

	<title>Draw Nothing</title>
</head>
<body>
<div id="resultpage" data-role="page">

	<div data-role="header">
		<a href="#" data-direction="reverse" data-rel="back" data-icon="arrow-l">Back</a>
		<h1>Hint!</h1>
	</div><!-- /header -->

	<div data-role="content">
		<ul data-role="listview">
			<%
			long start = System.currentTimeMillis();
			String lettersGiven = request.getParameter("letters");
			String targetCountStr = request.getParameter("count");
			int targetCount = 0;
			try {
				targetCount = new Integer(targetCountStr);
			} catch(Exception e) {
				targetCount = 3;
			}

			Collection<String> answers = drawNothing.riddle(lettersGiven, targetCount);
			for(String answer : answers) {
			%>
			<li>
				<a href="http://www.wordreference.com/enzh/<%=answer%>">
					<h3><%=answer%></h3>
					<p result="<%=answer%>" class="trans" id="trans<%=answer%>"></p>
				</a>
			</li>
			<%
			}
			long end = System.currentTimeMillis();
			%>
			<li>in <%=end - start%>ms</li>
		</ul>
	</div><!-- /content -->


</div><!-- /page -->
<script>
if(0==1){
$("#resultpage").live("pageinit",function(event){
	$(".trans").each(function(index) {
		resultString = $(this).attr("result");

		$.ajax({
			url: "http://fy.webxml.com.cn/webservices/EnglishChinese.asmx/TranslatorString?wordKey=" + resultString,
			dataType: "xml",
			success: function(data){
				$(data).find("string").each(function(i, str) {
					$("#trans" + resultString).append($(str).text() + "<br />");
				})
			}
		});
	});
});
}
</script>
</body>
</html>

