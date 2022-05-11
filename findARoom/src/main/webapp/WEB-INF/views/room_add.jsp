<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="header.jsp" />

<section id="register" class="bg-light py-5">
<div class="overlay"></div>
    
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="card">
					<div class="card-header bg-primary text-white">
						<h4>
							<i class="fas fa-user-plus"></i> Add Room Details
						</h4>
					</div>
					<div class="card-body">

						<form role="form" action="${pageContext.request.contextPath}/owner/room/add"
							method="post" enctype="multipart/form-data">
							<!-- <input type="hidden" name="{_csrf.parameterName}"
								value="$_csrf.token}" /> -->



							<div class="form-group">
								<label for="type">Room Type</label> <select id="type"
									name="type" class="form-control">
									<option>Select Room</option>
									<option>Single Room</option>
									<option>Double Room</option>
									<option>Flat</option>
								</select>
							</div>


							<div class="form-group">
								<label for="area">Area</label> <input id="area" name="area"
									type="text" placeholder="" class="form-control">
								<p class="help-block">Area in square feet</p>
							</div>

							<div class="form-group">
								<label for="price">Price</label> <input id="price" name="price"
									type="text" placeholder="" class="form-control">

							</div>


							<div class="form-group">
								<label for="image">Image</label>
								<div class="form-control">

									<!--   <input type="file" name="image" id="image" class="input-file"/> -->

									<input id="fileInput" type="file" name="image"
										onchange="updateSize();" multiple> selected files: <span
										id="fileNum">0</span>
									<!--  total size: <span id="fileSize">0</span> -->
									</div>
										</div>

							<div class="form-group">

								<label for="description">Description</label>

								<textarea class="form-control" id="description" name="description" rows="7" cols="50"
								 placeholder="Give a brief description of a place"></textarea>
							</div>

							
							
							<div class="form-group">
								<label for="location">Location</label> <input type="text"
									class="form-control" id="location" name="location"
									placeholder="Enter location">

							</div>
							<div class="form-group">
								<label for="phone">Phone</label> <input type="text"
									class="form-control" id="phone" name="phone"
									placeholder="Enter Phone number">

							</div>

							<div class="form-group">
								<label for="Parking">Parking</label> <select id="parking"
									name="parking">

									<option value="true">YES</option>
									<option value="false">NO</option>

								</select>
							</div>



							<div class="form-group">
								<label for="Water">Water</label>
								<div class="form-control">
									<label class="radio-inline" for="water-0"> <input
										type="radio" name="water" id="water-0" value="true">
										Yes
									</label> <label class="radio-inline" for="water-1"> <input
										type="radio" name="water" id="water-1" value="false">
										No
									</label>
								</div>
							</div>

							<div class="form-group">
								<label for="bedroom">Bedroom</label> <input type="text"
									class="form-control" id="bedroom" name="bedroom"
									placeholder="Enter no. of bedroom">

							</div>

							<div class="form-group">
								<label for="bathroom">Bathroom</label> <input type="text"
									class="form-control" id="bathroom" name="bathroom"
									placeholder="Enter no. of bathroom">

							</div>
							<div class="form-group">

								<label for="comment">Comment</label>

								<textarea id="comment" name="comment"></textarea>
							</div>


							<div class="form-group">
								<label for="check_critiria">Check the box</label>

								<div class="input-group">
									<span class="input-group-addon"> <input type="checkbox">
									</span> <input id="check_critiria" name="check_critiria"
										class="form-control" type="text"
										placeholder="I accept the criteria">
								</div>

							</div>



							<div>

								<input type="submit" value="Save" class="btn btn-primary" /> <input
									type="reset" value="Reset" class="btn btn-primary" />
							</div>


						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</section>


<!-- Call to Action -->


<jsp:include page="footer.jsp" />

</html>