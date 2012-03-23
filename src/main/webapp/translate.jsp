<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<jsp:useBean id="translater" class="net.wengs.drawnothing.TranslaterWrapper" scope="application" />
<%=StringUtils.replace(StringUtils.trimToEmpty(translater.translate(request.getParameter("word"))), "\n", "<br>")%>