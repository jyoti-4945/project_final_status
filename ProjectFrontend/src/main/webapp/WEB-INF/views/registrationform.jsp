<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
<%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript">

function fillShippingAddress(form){
    if(form.shippingaddressform.checked==true){
        //shippingaddress is same as billingaddress
        form["shippingaddress.apartmentnumber"].value=form["billingaddress.apartmentnumber"].value;
        form["shippingaddress.streetname"].value=form["billingaddress.streetname"].value;
        form["shippingaddress.city"].value=form["billingaddress.city"].value;
        form["shippingaddress.state"].value=form["billingaddress.state"].value;
        form["shippingaddress.country"].value=form["billingaddress.country"].value;
        form["shippingaddress.zipcode"].value=form["billingaddress.zipcode"].value;
    }
    if(form.shippingaddressform.checked==false){
        form["shippingaddress.apartmentnumber"].value=""
        form["shippingaddress.streetname"].value=""
        form["shippingaddress.city"].value=""
        form["shippingaddress.state"].value=""
        form["shippingaddress.country"].value=""
        form["shippingaddress.zipcode"].value=""
    }
}



$(document).ready(function(){
    $('#form').validate({
        rules:{
            firstname:{required:true},
            lastname:{required:true},
            phonenumber:{required:true,number:true,minlength:10,maxlength:10},
            "user.email":{required:true,email:true},
            "user.password":{required:true,minlength:5,maxlength:10},
            "billingaddress.apartmentnumber":{required:true},
            "billingaddress.streetname":{required:true},
            "billingaddress.state":{required:true},
            "billingaddress.city":{required:true},
            "billingaddress.country":{required:true},
            "billingaddress.zipcode":{required:true,number:true}
        },
        messages:{
            firstname:{required:"Firstname is mandatory"},
            phonenumber:{required:"Phonenumber is required"},
            "user.email":{required:"Email is required",email:"Please enter valid email address"}
        }
    })
})
</script>
</head>
<body background="<c:url value="/resources/Images/bg10.jpg" ></c:url>" style="height:100">
<div class="container">
<div class=" card-container"><br><br>
<c:url value="/all/registercustomer" var="url"></c:url>
<form:form modelAttribute="customer" action="${url }" id="form" class="form-signin">

<form:hidden path="id"/>

<form:label path="firstname"><b>Enter Firstname</b></form:label>
<form:input path="firstname" id="firstname" class="form-control"/>


<form:label path="lastname"><b>Enter Lastname</b></form:label>
<form:input path="lastname" id="lastname" class="form-control"/>


<form:label path="phonenumber"><b>Enter Phonenumber</b></form:label>
<form:input path="phonenumber" id="phonenumber" class="form-control"/>

<hr>
<b style="font-size:30px">Login Credentials</b><br><br>
<form:label path="user.email"><b>Enter Email</b></form:label>
<form:input path="user.email" id="user.email" type="email" class="form-control"/>

<form:label path="user.password"><b>Enter password</b></form:label>
<form:input path="user.password" id="user.password" type="password" class="form-control"></form:input>



<hr>
<b style="font-size:25px">Billing Address</b><br><br>

<form:label path="billingaddress.apartmentnumber"><b>Enter Apartmentnumber</b></form:label>
<form:input path="billingaddress.apartmentnumber" id="billingaddress.apartmentnumber" class="form-control"/>

<form:label path="billingaddress.streetname"><b>Enter streetname</b></form:label>
<form:input path="billingaddress.streetname" id="billingaddress.streetname" class="form-control"/>

<form:label path="billingaddress.city"><b>Enter city</b></form:label>
<form:input path="billingaddress.city" id="billingaddress.city" class="form-control"/>

<form:label path="billingaddress.state"><b>Enter state</b></form:label>
<form:input path="billingaddress.state" id="billingaddress.state" class="form-control"/>

<form:label path="billingaddress.country"><b>Enter country</b></form:label>
<form:input path="billingaddress.country" id="billingaddress.country" class="form-control"/>

<form:label path="billingaddress.zipcode"><b>Enter Zipcode</b></form:label>
<form:input path="billingaddress.zipcode" id="billingaddress.zipcode" class="form-control"/>
<hr>
<b style="font-size:25px">Shipping address</b><br><br>
Check this if shipping address is same as billing address
<input type="checkbox" onclick="fillShippingAddress(this.form)" id="shippingaddressform">
<br>
<form:label path="shippingaddress.apartmentnumber"><b>Enter Apartmentnumber</b></form:label>
<form:input path="shippingaddress.apartmentnumber" id="shippingaddress.apartmentnumber" class="form-control"/>

<form:label path="shippingaddress.streetname"><b>Enter streetname</b></form:label>
<form:input path="shippingaddress.streetname" id="shippingaddress.streetname" class="form-control"/>

<form:label path="shippingaddress.city"><b>Enter city</b></form:label>
<form:input path="shippingaddress.city" id="shippingaddress.city" class="form-control"/>

<form:label path="shippingaddress.state"><b>Enter state</b></form:label>
<form:input path="shippingaddress.state" id="shippingaddress.state" class="form-control"/>

<form:label path="shippingaddress.country"><b>Enter country</b></form:label>
<form:input path="shippingaddress.country" id="shippingaddress.country" class="form-control"/>

<form:label path="shippingaddress.zipcode"><b>Enter zipcode</b></form:label>
<form:input path="shippingaddress.zipcode" id="shippingaddress.zipcode" class="form-control"/>
<br>
<input type="submit" value="Login" style="background-color:#242424"    class="btn btn-lg btn-primary btn-block btn-signin">

</form:form>
</div>
</div>
</body>
</html>