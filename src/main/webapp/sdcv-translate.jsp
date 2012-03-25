<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<jsp:useBean id="sdcvTranslater" class="net.wengs.drawnothing.SdcvTranslater" scope="application" />
<%=StringUtils.replace(StringUtils.trimToEmpty(sdcvTranslater.translate(request.getParameter("word"))), "\n", "<br>")%>