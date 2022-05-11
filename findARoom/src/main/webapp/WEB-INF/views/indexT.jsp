<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=ISO-8859-1">
    <title>Transaction</title>
</head>
<body>
<form:form method="POST" modelAttribute="transactionRequest" action="/process">
    <form:label path="TXNAMT">Amount: </form:label>
    <form:input path="TXNAMT" type="number"/>
    <form:label path="REMARKS">Remarks: </form:label>
    <form:input path="REMARKS" type="text" />
    <input type="submit" value="Submit" />
</form:form>
</body>
</html>