<!--Section: Contact v.2-->
<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
<?php require_once('inc/header.php') ?>
<body>
<?php require_once('inc/topBarNav.php') ?>

<?php
if((isset($_POST['submit'])))
{
	$contact_name = $_POST['contact_name'];
	$contact_email = $_POST['contact_email'];
	$contact_address = $_POST['contact_address'];
	$contact_no =	$_POST['contact_no'];
	$contact_message = $_POST['contact_message'];

  $sanitized_contact_name = 
    mysqli_real_escape_string($conn, $contact_name);      
  $sanitized_contact_email = 
    mysqli_real_escape_string($conn, $contact_email);
  $sanitized_contact_address = 
    mysqli_real_escape_string($conn, $contact_address);
  $sanitized_contact_no = 
    mysqli_real_escape_string($conn, $contact_no);
  $sanitized_contact_message = 
    mysqli_real_escape_string($conn, $contact_message);


	
	$query = "INSERT INTO tbl_contact(contact_name,contact_email,contact_address,contact_no,contact_message) 
  VALUES ('.$sanitized_contact_name.','.$sanitized_contact_email.','.$sanitized_contact_address.','.$sanitized_contact_no.','.$sanitized_contact_message.')";
	
	 $fire = mysqli_query($conn, $query) or die("can not insert into database." .mysqli_error($conn));
	 
	 if($fire)
	 {
		 $_SESSION['status'] = 'Your Message Is Added Successfully';
						$_SESSION['status_code'] = 'success';
}
}
?>
        <section class="my-5">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="intro-box clearfix">
                            <div class="sec-title mb-5">
                                <div style="font-size:30px;">Contact Us<span></span></div>
                            </div>
						</div>
					</div>
				</div>
	<form action="<?php $_SERVER['PHP_SELF']?>" method="POST" class="needs-validation" novalidate>
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <input type="text" name="contact_name" class="form-control form-control-a" placeholder="Enter Your Name" required>
                      </div>
                      <div class="form-group">
                        <input name="contact_email" type="email" class="form-control form-control-a" placeholder="Enter Your Email" required>
                      </div>
					  <div class="form-group">
                        <textarea class="form-control" name="contact_address" rows="4" placeholder="Enter Your Address"></textarea>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <input type="number" name="contact_no" maxlength="10" class="form-control form-control-a" placeholder="Enter Mobile Number" required>
                      </div>
                   
                      <div class="form-group">
                        <textarea name="contact_message" class="form-control" name="message" rows="6" placeholder="Message" required></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 my-3">
                    <!--  <div class="mb-3">
                        <div class="loading">Loading</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>
                      </div> -->
                    </div>

                    <div class="col-md-12 text-center">
                      <button type="submit" name="submit" class="btn" style="background-color: #1892f0; color: white;">Send Message</button> &nbsp;
                      <button type="reset" class="btn" style="background-color: #1892f0; color: white;">Reset</button>
                    </div>
                  </div>
                </form>	<br><br>
				<hr />
				
			
				<div class="row">
					<div class="col-md-6">
					<div class="text-box">
                                        <div class="inner">
                                            <div class="date">
                                                <h3></h3>
                                            </div>
                                            <div class="title">
                                                <h4>REGISTERED OFFICE</h4><br>
                                            </div>
                                            <div class="text">
                                                <h6>Shree Vimal Publishers Private Limited</h6>
												<p>Shree Vimal Publishers Private Limited.<br>
													Shree Parnerkar Guruseva Mandal building,<br>
													Opposite Poornawad Bhavan,<br>
													Parner - 414302;<br> 
													District : Ahmednagar,<br>
													State : Maharashtra,<br>
													Bharat (India).</p>
                                               <p><b>Contact No :</b> &nbsp;+91 - 9226885522</p>
                                               <p><b>Email :</b> sales@shreevimalpublishers.com</p>
                                               <br><br><br>
                                            </div>
                                        </div>
                                    </div>
							<div class="contact-map box">
							<div id="map" class="contact-map border  border-primary">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d943.099586402154!2d74.43697202618557!3d19.002160763296807!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bdccf41ea1c86db%3A0x7c9ae63cb91ebb70!2sPoornawad%20Saraswat%20Kendra!5e0!3m2!1sen!2sin!4v1599566379158!5m2!1sen!2sin" width="100%" height="450" allowfullscreen></iframe><a href="https://www.mapsdirections.info/en/measure-map-radius/"></a>
							</div>
							</div>
				</div>
				<div class="col-md-6">
					<div class="text-box">
                                        <div class="inner">
                                            <div class="date">
                                                <h3></h3>
                                            </div>
                                            <div class="title">
                                                <h4>SHOP ADDRESS</h4><br>
                                            </div>
                                            <div class="text">
                                                <h6>Poornawad Saraswat Kendra</h6>
                                                <p>Shree Vimal Publishers Private Limited.<br>
													Shree Parnerkar Guruseva Mandal building,<br>
													Opposite Poornawad Bhavan,<br>
													Parner - 414302;<br> 
													District : Ahmednagar,<br>
													State : Maharashtra,<br>
													Bharat (India).</p>
                                               <p><b>Contact No :</b> &nbsp;+91 - 9226885522</p>
                                               <p><b>Email :</b> sales@shreevimalpublishers.com</p>
                                               <br><br><br>
                                            </div>
                                        </div>
                                    </div>
							<div class="contact-map box">
							<div id="map" class="contact-map border  border-primary">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d943.099586402154!2d74.43697202618557!3d19.002160763296807!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bdccf41ea1c86db%3A0x7c9ae63cb91ebb70!2sPoornawad%20Saraswat%20Kendra!5e0!3m2!1sen!2sin!4v1599566379158!5m2!1sen!2sin" width="100%" height="450" allowfullscreen></iframe><a href="https://www.mapsdirections.info/en/measure-map-radius/"></a>
							</div>
							</div>
				</div>
				
			</div>
</section>
<script type="text/javascript">
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

</script>
<?php require_once('inc/footer.php') ?>