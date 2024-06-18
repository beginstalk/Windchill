<%@ include file="/netmarkets/jsp/util/begin.jspf" %>
<%@ page import="com.accenture.DocumentLinkProvider" %>
<%@ page import="wt.util.WTException" %>

<% 
   String url="";
   try{
	    url = new DocumentLinkProvider().getLink(commandBean);
   }
   catch(WTException ex){
   }
%>

<html>
<head>
 <script type="text/javascript">
  window.open('<%=url%>',"_blank");
 </script>
</head>
<body>
  <p1> This is me </p1>
</body>
</html>

<%@ include file="/netmarkets/jsp/util/end.jspf" %>