<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=ISO-8859-1">
    <title></title>
</head>
<body>
<%--<form:form method="POST" modelAttribute="transactionRequest"--%>
<%--action="https://uat.connectips.com:7443/connectipswebgw/loginpage" id="form">--%>
<%--<form:input path="merchantId" type="hidden" name="MERCHANTID"/>--%>
<%--<form:input path="appId" type="hidden" name="APPID"/>--%>
<%--<form:input path="appName" type="hidden" name="APPNAME"/>--%>
<%--<form:input path="transactionId" type="hidden" name="TXNID"/>--%>
<%--<form:input path="transactionDate" type="hidden" name="TXNDATE"/>--%>
<%--<form:input path="transactionCurrency" type="hidden" name="TXNCRNCY"/>--%>
<%--<form:input path="amount" type="hidden" name="TXNAMT"/>--%>
<%--<form:input path="referenceId" type="hidden" name="REFERENCEID"/>--%>
<%--<form:input path="remarks" type="hidden" name="REMARKS"/>--%>
<%--<form:input path="particular" type="hidden" name="PARTICULARS"/>--%>
<%--<form:input path="token" type="hidden" name="TOKEN"/>--%>
<%--<input type="submit" value="Submit"/>--%>
<%--</form:form>--%>
<form:form method="POST" modelAttribute="transactionRequest"
           action="https://uat.connectips.com:7443/connectipswebgw/loginpage" id="form">
    <form:input path="MERCHANTID" type="hidden"/>
    <form:input path="APPID" type="hidden"/>
    <form:input path="APPNAME" type="hidden"/>
    <form:input path="TXNID" type="hidden"/>
    <form:input path="TXNDATE" type="hidden"/>
    <form:input path="TXNCRNCY" type="hidden"/>
    <form:input path="TXNAMT" type="hidden"/>
    <form:input path="REFERENCEID" type="hidden"/>
    <form:input path="REMARKS" type="hidden"/>
    <form:input path="PARTICULARS" type="hidden"/>
    <form:input path="TOKEN" type="hidden"/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
<script>
    var form = document.getElementById("form");
    form.submit();
</script>
</html>

