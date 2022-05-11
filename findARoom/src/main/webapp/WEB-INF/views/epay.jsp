<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  <!-- Icons Grid -->
  
   <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
			<h2>RoomFinder e-payment system</h2>
		</div>
		</div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
			<th>Id</th>
                        <th>Customer Detail</th>
			<th>Order Description</th>
                        <th>Payment Detail</th>
                        <th>Remark</th>
                    </tr>
                </thead>
                <tbody>
                  <tr>
			<td> 1 </td>
                        <td> 
                            <strong> ${customer.username} </strong>
                            <ul  style=" list-style-type: none;">
                                <li> -------------------------------------------- </li>
                                <li> Customer Id:    &Tab;${customer.id}</li>
                                <li> Customer Name:  &Tab;${customer.firstName}&nbsp; ${customer.firstName}</li>
                                <li> Customer Email: &Tab;${customer.email}</li>
                                <li> -------------------------------------------- </li>
                            </ul>
                        </td>
			<td> 
                        <strong> Order(s) </strong>
                            <ul  style=" list-style-type: none;">
                                <li> -------------------------------------------- </li>
                                <li> Order Id: ${booking.id} </li>
                                <li> -------------------------------------------- </li>
                                <li> Order Id: ${booking.bookedOn} </li>
                                <li> -------------------------------------------- </li>
                                
                            </ul>
                        </td>
                        <td> 
                        <strong> Esewa Online Paymeny </strong>
                            <ul  style=" list-style-type: none;">
                                <li> -------------------------------------------- </li>
                                <li> Payment Amount: &Tab; ${payment.amount} </li>
                                <li> Value Added Tax: &Tab; ${payment.taxAmount} </li>
                                <li> Service Charge: &Tab; ${payment.productSC} </li>
                                <li> Delivery Charge: &Tab; ${payment.productDC} </li>
                                <li> -------------------------------------------- </li>
                                <li> Total Amount: &Tab; ${payment.totalAmount} </li>
                                <li> -------------------------------------------- </li>
                            </ul>
                        </td>
                        <td> </td>
                  </tr>
                    				
                </tbody>
            </table>
	
        </div>
    </div>
  
     <div class="container">
    <form action="https://uat.esewa.com.np/epay/main" method="post">
    <div class="container" style="border:1px solid #cecece;">
        <p style="font-size: 20px;">
            Proceed with e-sewa payment service...
        </p>
        
        <div class="form-group">
            <input value="${payment.totalAmount}" name="tAmt" type="hidden">
    <input value="${payment.amount}" name="amt" type="hidden">
    <input value="${payment.taxAmount}" name="txAmt" type="hidden">
    <input value="${payment.productSC}" name="psc" type="hidden">
    <input value="${payment.productDC}" name="pdc" type="hidden">
    <input value="test_merchant" name="scd" type="hidden">
    <input value="ee2c3ca1-696b-4cc5-a6be-2c40d929d453" name="pid" type="hidden">
    <input value="http://localhost:8080/user/booking/esewa_payment_success?q=su" type="hidden" name="su">
    <input value="http://localhost:8080/user/booking/esewa_payment_failed?q=fu" type="hidden" name="fu">
    </div>
        <div style="margin-bottom: 10px;">
            <input type="submit" class="btn btn-success" value="Confirm Payment">
        </div>
    </div>
    </form>
  
     </div>
	

	<jsp:include page="footer.jsp"/>

</html>