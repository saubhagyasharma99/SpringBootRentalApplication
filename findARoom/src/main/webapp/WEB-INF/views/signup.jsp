<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

 <jsp:include page="header.jsp" />
  
  <!-- Call to Action -->
  <section class="call-to-action text-white">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h2 class="mb-4">Ready to get started? Sign up now!</h2>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form action="${pageContext.request.contextPath}/signup" method="post">
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
              <div class="form-group">
              <label>First Name</label>
              <input type="text" name="firstName" class="form-control form-control-lg" placeholder="Enter your firstname...">
              </div>
              <div class="form-group">
              <label>Last Name</label>
              <input type="text" name="lastName" class="form-control form-control-lg" placeholder="Enter your lastname...">
              </div>
              <div class="form-group">
              <label>Email</label>
              <input type="email" name="email" class="form-control form-control-lg" placeholder="Enter your email...">
              
              </div>
              <div class="form-group">
              <label>Gender</label>
              <div class="form-control form-control-lg">
              <input type="radio" name="gender" value="Male">&nbsp; Male &nbsp;&nbsp;
              <input type="radio" name="gender" value="Female">&nbsp; Female
              </div>
              </div>
              <div class="form-group">
              <label>Username</label>
              <input type="text" name="username" class="form-control form-control-lg" placeholder="Enter your username...">
              </div>
              <div class="form-group">
              <label>password</label>
              <input type="password" name="password" class="form-control form-control-lg" placeholder="Enter your password...">
              </div>
              <div class="form-group">
              <label>Authority</label>
              <select name="authority" class="form-control form-control-lg">
              <option value="ADMIN">Administrator</option>
              <option value="USER">User</option>
              <option value="OWNER">Owner</option>
              </select>
              </div>
              
              </div>
              </div>
              <div class="form-row">
            <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

	<jsp:include page="footer.jsp"/>

</html>