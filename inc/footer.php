
<script>
  $(document).ready(function(){
    $('#p_use').click(function(){
      uni_modal("Privacy Policy","policy.php","mid-large")
    })
     window.viewer_modal = function($src = ''){
      start_loader()
      var t = $src.split('.')
      t = t[1]
      if(t =='mp4'){
        var view = $("<video src='"+$src+"' controls autoplay></video>")
      }else{
        var view = $("<img src='"+$src+"' />")
      }
      $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
      $('#viewer_modal .modal-content').append(view)
      $('#viewer_modal').modal({
              show:true,
              backdrop:'static',
              keyboard:false,
              focus:true
            })
            end_loader()  

  }
    window.uni_modal = function($title = '' , $url='',$size=""){
        start_loader()
        $.ajax({
            url:$url,
            error:err=>{
                console.log()
                alert("An error occured")
            },
            success:function(resp){
                if(resp){
                    $('#uni_modal .modal-title').html($title)
                    $('#uni_modal .modal-body').html(resp)
                    if($size != ''){
                        $('#uni_modal .modal-dialog').addClass($size+'  modal-dialog-centered')
                    }else{
                        $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
                    }
                    $('#uni_modal').modal({
                      show:true,
                      backdrop:'static',
                      keyboard:false,
                      focus:true
                    })
                    end_loader()
                }
            }
        })
    }
    window._conf = function($msg='',$func='',$params = []){
       $('#confirm_modal #confirm').attr('onclick',$func+"("+$params.join(',')+")")
       $('#confirm_modal .modal-body').html($msg)
       $('#confirm_modal').modal('show')
    }
  })
</script>
<?php require_once('config.php'); ?>
<?php
if((isset($_POST['subscribe'])))
	{
		$email = $_POST['email'];
			   $duplicate="SELECT email FROM tbl_newsletter WHERE 
							email = '$email'";
				$result=mysqli_query($conn,$duplicate);
				$count=mysqli_num_rows($result);
				if($count > 0){
					$_SESSION['mailalready'] = 'You are already subscriber';
					$_SESSION['status'] = 'You are already subscriber';
					$_SESSION['status_code'] = 'error';

				}
				else
				{
				   $query = "INSERT INTO tbl_newsletter(email) VALUES('$email')";
				   $fire = mysqli_query($conn, $query) or die("can not insert into database." .mysqli_error($conn));
					if($fire)
					{
						$_SESSION['status'] = 'Your Subscription Is Added Successfully';
						$_SESSION['status_code'] = 'success';
					}
				}
	}
?> 
<!--<section class="subscription bg-red">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="subscription-wrapper">
                    <div class="d-flex subscription-content justify-content-between align-items-center flex-column flex-md-row text-center text-md-left">
                        <h3 class="flex-fill">Subscribe to our newsletter</h3>
                        <form action="<?php //$_SERVER['PHP_SELF']?>" method="POST"  class="row flex-fill">
                            <div class="col-lg-8 my-md-2 my-2"> <input type="email" class="form-control px-4 border-0 w-100 text-center text-md-left" id="email" placeholder="Your Email" name="email"> </div>
                            <div class="col-lg-4 my-md-2 my-2"> <button type="subscribe" name="subscribe" class="btn btn-dark border-0 w-100">Subscribe</button> </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>-->
<!-- Footer-->
<section>
<div class="d-flex flex-column h-100  bg-white">
    <!-- FOOTER -->
    <footer class="w-100 py-2 flex-shrink-0">
        <div class="container py-4">
            <div class="row gy-4 gx-5">
                <div class="col-lg-2 col-md-6">
                     <img src="<?php echo validate_image($_settings->info('logo')) ?>" width="120" height="100" class="d-inline-block align-top" alt="" loading="lazy">
					 </div>
                <div class="col-lg-4 col-md-6">
                    <h6><strong>Address</strong></h6>
                                         <p>Registered office :<br>
											Shree Vimal Publishers Private Limited.<br>
											Shree Parnerkar Guruseva Mandal building,<br>
											Opposite Poornawad Bhavan,<br>
											Parner - 414302;<br> 
											District : Ahmednagar,<br>
											State : Maharashtra,<br>
											Bharat (India).</p>
                </div>
                <div class="col-lg-2 col-md-6">
                      <h6><strong>Contact No.</strong></h6>
                                        <p>+91 - 9226885522</p>
                </div>
                <div class="col-lg-4 col-md-6">
                     <h6><strong>Email Address</strong></h6>
                                        <p>sales@shreevimalpublishers.com</p>
										<form action="<?php $_SERVER['PHP_SELF']?>" method="POST">
						<h6><strong>Subscribe to our newsletter</strong></h6>
                        <div class="input-group mb-3">						 
                            <input class="form-control" name="email" type="text" placeholder="Subscribers's email" required>
                            <button class="btn btn-dark" name="subscribe"><i class="fas fa-paper-plane"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </footer> 
</div>
</section>
			<section class="footer-bottom-area style3" style="background-color:#000000;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="copyright-text text-center"><br/>
							<p style="color:white;">Copyright&copy;|<b><?php echo $_settings->info('short_name') ?> 2021</b> | All Rights Reserved.<br/>
                            <a href="#" target="_blank">JP CONSULTANCY SERVICES, SATARA</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

   
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
      <style>

            .Swal-title {
              font-size: 10px;
              width: 400px;
            }

        </style>
    
   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>		
			<?php
			if(isset($_SESSION['status']) && $_SESSION['status'] !='')
			{
				?>
				<script>
					Swal.fire({
						  title:  "<h6><?php echo  $_SESSION['status'];?></h6>",
						  // text: "You clicked the button!",
						  icon: "<?php  echo  $_SESSION['status_code'];?>",
						  button: "OK",
						  width: "400px",
						  allowOutsideClick: false,
						});
				</script>
				<?php
				unset($_SESSION['status']);
			}
		?>
	
	
	<script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="<?php echo base_url ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="<?php echo base_url ?>plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="<?php echo base_url ?>plugins/sparklines/sparkline.js"></script>
    <!-- Select2 -->
    <script src="<?php echo base_url ?>plugins/select2/js/select2.full.min.js"></script>
    <!-- JQVMap -->
    <script src="<?php echo base_url ?>plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="<?php echo base_url ?>plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="<?php echo base_url ?>plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
    <script src="<?php echo base_url ?>plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<?php echo base_url ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="<?php echo base_url ?>plugins/summernote/summernote-bs4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <!-- overlayScrollbars -->
    <!-- <script src="<?php echo base_url ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script> -->
    <!-- AdminLTE App -->
    <script src="<?php echo base_url ?>dist/js/adminlte.js"></script>
    <div class="daterangepicker ltr show-ranges opensright">
      <div class="ranges">
        <ul>
          <li data-range-key="Today">Today</li>
          <li data-range-key="Yesterday">Yesterday</li>
          <li data-range-key="Last 7 Days">Last 7 Days</li>
          <li data-range-key="Last 30 Days">Last 30 Days</li>
          <li data-range-key="This Month">This Month</li>
          <li data-range-key="Last Month">Last Month</li>
          <li data-range-key="Custom Range">Custom Range</li>
        </ul>
      </div>
      <div class="drp-calendar left">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-calendar right">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-buttons"><span class="drp-selected"></span><button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button><button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button> </div>
    </div>
    <div class="jqvmap-label" style="display: none; left: 1093.83px; top: 394.361px;">Idaho</div>