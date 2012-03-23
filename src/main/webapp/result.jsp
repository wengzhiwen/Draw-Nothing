<%@page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.wengs.drawnothing.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="drawNothing" class="net.wengs.drawnothing.DrawNothing" scope="application" />
<jsp:useBean id="cetTranslater" class="net.wengs.drawnothing.CETTranslater" scope="application" />
<html>
<head>
	<meta name="viewport" content="width=device-width, user-scalable=no">
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
			String lettersGiven = request.getParameter("letters");
			String targetCountStr = request.getParameter("count");
			int targetCount = 0;
			try {
				targetCount = new Integer(targetCountStr);
			} catch(Exception e) {
				targetCount = 3;
			}

			long start = System.currentTimeMillis();
			Collection<String> answers = drawNothing.riddle(lettersGiven, targetCount);
			long end = System.currentTimeMillis();

			long translateStart = System.currentTimeMillis();

			int transIndex = 0;
			String text;
			for(String answer : answers) {
				text = cetTranslater.translate(answer);
			%>
			<li>
				<h3><%=answer%></h3>
				<%
				if (text != null) {
					out.print("<p>" + text + "</p>");
				} else {
					out.print("<p isTraned='0' answer='" + answer + "' class='trans' id='trans_" + answer + "'></p>");
				}
				%>
			</li>
			<%
			}
			long translateEnd = System.currentTimeMillis();
			%>
			<li>in <%=end - start%>ms</li>
		</ul>
	</div><!-- /content -->
	<script>
	$("#resultpage").live("pageshow",function(event){
		$(window).bind("scroll", function(event){
			$(".trans").each(function(){
				if($(this).attr("isTraned") == "0") {
					if( $(window).height() + $(window).scrollTop() > $(this).offset().top){
						var answer = $(this).attr("answer");
						$.ajax({
							url: "translate.jsp?word=" + answer,
							dataType: "html",
							success: function(data) {
								$("#trans_" + answer).append(data);
							}
						});
						$(this).attr("isTraned", "1");
					}
				}
			});
		});
	});
	</script>

	<jsp:include page="/google-analytics.jsp" />

</div><!-- /page -->

</body>
</html>

