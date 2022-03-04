
<!--Start Our Distributors area-->

    <div class="container">
        <div class="sec-title my-5">
            <!--<p>News & Updates</p>-->
            <div style="font-size:30px;">Our Distributors</div>
        </div>
        <div class="col-md-12 col-sm-12 col-xl-12">
            <div class="row">
                <?php 
										
											$query= "SELECT * FROM tbl_distributors";
	
										$fire = mysqli_query($conn,$query) or die("can not fetch the data from database." .mysqli_error($mysqli));
	
									if(mysqli_num_rows($fire)>0) { while($user = mysqli_fetch_assoc($fire)) { ?>

                <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12">
                    <div class="single-blog-post wow fadeInLeft" data-wow-delay="0ms" data-wow-duration="1500ms">
                        <div class="text-holder">
                            <div class="post-date">
                                
                                <br />
                                <h5>
                                    <span><?php echo $user['distributor_name']?></span>
                                </h5>
                            </div>
                            <br />
							
                            <h6 class="blog-title"><a href="">ADDRESS</a></h6>
                            <div class="text">
                                <p><?php echo $user['distributor_address']?></p>
                            </div>
                            <h6 class="blog-title"><a href="">Contact No:</a></h6>
                            <div class="text">
                                <p><?php echo $user['distributor_contact_no']?></p>
                            </div><br />
                        </div>
                    </div>
                </div>
                <?php 
										}
										}
					?>
            </div>
        </div>
    </div>
<!--End our distributors area-->