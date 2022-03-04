
 <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="20000">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/slides/v1-1.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/slides/v1-2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/slides/v1-3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- <header class="bg-dark py-5" id="main-header">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">If you want to make intelligent, get books from here.</h1>
            <p class="lead fw-normal text-white-50 mb-0">Shop Now!</p>
        </div>
    </div>
</header>-->

<!-- Section-->
<style>
 * {
     margin: 0;
     padding: 0;
     -webkit-font-smoothing: antialiased;
     -webkit-text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
     text-shadow: rgba(0, 0, 0, .01) 0 0 1px
 }

 body {
     font-family: 'Rubik', sans-serif;
     font-size: 14px;
     font-weight: 400;
     background: #eff6fa;
     color: #000000
 }

 div {
     display: block;
     position: relative;
     -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
     box-sizing: border-box
 }

 .bbb_viewed {
     padding-top: 51px;
     padding-bottom: 60px;
     background: #eff6fa
 }

 .bbb_main_container {
     background-color: #fff;
     padding: 11px
 }

 .bbb_viewed_title_container {
     border-bottom: solid 1px #dadada
 }

 .bbb_viewed_title {
     margin-bottom: 16px;
     margin-top: 8px
 }

 .bbb_viewed_nav_container {
     position: absolute;
     right: -5px;
     bottom: 14px
 }

 .bbb_viewed_nav {
     display: inline-block;
     cursor: pointer
 }

 .bbb_viewed_nav i {
     color: #dadada;
     font-size: 18px;
     padding: 5px;
     -webkit-transition: all 200ms ease;
     -moz-transition: all 200ms ease;
     -ms-transition: all 200ms ease;
     -o-transition: all 200ms ease;
     transition: all 200ms ease
 }

 .bbb_viewed_nav:hover i {
     color: #606264
 }

 .bbb_viewed_prev {
     margin-right: 15px
 }

 .bbb_viewed_slider_container {
     padding-top: 13px
 }

 .bbb_viewed_item {
     width: 100%;
     background: #FFFFFF;
     border-radius: 2px;
     padding-top: 25px;
     padding-bottom: 25px;
     padding-left: 30px;
     padding-right: 30px
 }

 .bbb_viewed_image {
     width: 150px;
     height: 150px
 }

 .bbb_viewed_image img {
     display: block;
     max-width: 100%
 }

 .bbb_viewed_content {
     width: 100%;
     margin-top: 25px
 }

 .bbb_viewed_price {
     font-size: 16px;
     color: #000000;
     font-weight: 500
 }

 .bbb_viewed_item.discount .bbb_viewed_price {
     color: #df3b3b
 }

 .bbb_viewed_price span {
     position: relative;
     font-size: 12px;
     font-weight: 400;
     color: rgba(0, 0, 0, 0.6);
     margin-left: 8px
 }

 .bbb_viewed_price span::after {
     display: block;
     position: absolute;
     top: 6px;
     left: -2px;
     width: calc(100% + 4px);
     height: 1px;
     background: #8d8d8d;
     content: ''
 }

 .bbb_viewed_name {
     margin-top: 3px
 }

 .bbb_viewed_name a {
     font-size: 14px;
     color: #000000;
     -webkit-transition: all 200ms ease;
     -moz-transition: all 200ms ease;
     -ms-transition: all 200ms ease;
     -o-transition: all 200ms ease;
     transition: all 200ms ease
 }

 .bbb_viewed_name a:hover {
     color: #0e8ce4
 }

 .item_marks {
     position: absolute;
     top: 18px;
     left: 18px
 }

 .item_mark {
     display: none;
     width: 36px;
     height: 36px;
     border-radius: 50%;
     color: #FFFFFF;
     font-size: 10px;
     font-weight: 500;
     line-height: 36px;
     text-align: center
 }

 .item_discount {
     background: #df3b3b;
     margin-right: 5px
 }

 .item_new {
     background: #0e8ce4
 }

 .bbb_viewed_item.discount .item_discount {
     display: inline-block
 }

 .bbb_viewed_item.is_new .item_new {
     display: inline-block
 }
</style>
<section>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.js"></script>
<div class="bbb_viewed">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="bbb_main_container">
                    <div class="bbb_viewed_title_container">
                        <h3 class="bbb_viewed_title">Upcoming Book's</h3>
                        <div class="bbb_viewed_nav_container">
                            <div class="bbb_viewed_nav bbb_viewed_prev"><i class="fas fa-chevron-left"></i></div>
                            <div class="bbb_viewed_nav bbb_viewed_next"><i class="fas fa-chevron-right"></i></div>
                        </div>
                    </div>
                    <div class="bbb_viewed_slider_container">
                       <div class="owl-carousel owl-theme bbb_viewed_slider">
                                <?php 
									$products = $conn->query("SELECT * FROM `upcoming_book` where status = 1 order by rand() limit 8 ");
									while($row = $products->fetch_assoc()):
										$upload_path = base_app.'/uploads/book_1'.$row['id'];
										$img = "";
										if(is_dir($upload_path)){
											$fileO = scandir($upload_path);
											if(isset($fileO[2]))
												$img = "uploads/book_1".$row['id']."/".$fileO[2];
											// var_dump($fileO);
										}
										foreach($row as $k=> $v){
											$row[$k] = trim(stripslashes($v));
										}
								?>
								 <div class="owl-item">
									<div class="card h-100 product-item">
										<!-- Product image-->
										<img class="card-img-top book-cover" src="<?php echo validate_image($img) ?>" height="70px" width="50px" alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="">
												<!-- Product name-->
												<h5 class="fw-bolder"><?php echo $row['title'] ?></h5>
												<!-- Product price-->
												<p class="m-0"><small><b>Price : </b><?php echo $row['price'] ?></small></p>
											</div>
											<p class="m-0"><small>By : <?php echo $row['author'] ?></small></p>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-flat btn-primary "   href=".?p=view_upcoming_book&id=<?php echo md5($row['id']) ?>">View</a>
											</div>
										</div>
									</div>
								</div>
								<?php endwhile; ?>
                        </div>
						</div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<section>
	<div class="bbb_viewed">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="bbb_main_container">
                    <div class="bbb_viewed_title_container">
                        <h3 class="bbb_viewed_title">Most Salable Book's</h3>
                        <div class="bbb_viewed_nav_container">
                            <div class="bbb_viewed_nav bbb_viewed_prev"><i class="fas fa-chevron-left"></i></div>
                            <div class="bbb_viewed_nav bbb_viewed_next"><i class="fas fa-chevron-right"></i></div>
                        </div>
                    </div>
                    <div class="bbb_viewed_slider_container">
                        <div class="owl-carousel owl-theme bbb_viewed_slider">
                                <?php 
									$products = $conn->query("SELECT * FROM `msale` GROUP BY id, title, description, status, author, price ORDER BY SUM(sum) DESC LIMIT 6");
									while($row = $products->fetch_assoc()):
										$upload_path = base_app.'/uploads/product_'.$row['id'];
										$img = "";
										if(is_dir($upload_path)){
											$fileO = scandir($upload_path);
											if(isset($fileO[2]))
												$img = "uploads/product_".$row['id']."/".$fileO[2];
											// var_dump($fileO);
										}
										foreach($row as $k=> $v){
											$row[$k] = trim(stripslashes($v));
										}
										$inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
										$inv = array();
										while($ir = $inventory->fetch_assoc()){
											$inv[] = number_format($ir['price']);
										}
								?>
								 <div class="owl-item">
									<div class="card h-100 product-item">
										<!-- Product image-->
										<img class="card-img-top book-cover" src="<?php echo validate_image($img) ?>" height="70px" width="50px" alt="..." />
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="">
												<!-- Product name-->
												<h5 class="fw-bolder"><?php echo $row['title'] ?></h5>
												<!-- Product price-->
												<?php foreach($inv as $k=> $v): ?>
													<span><b>Price: </b><?php echo $v ?></span>
												<?php endforeach; ?>
											</div>
											<p class="m-0"><small>By: <?php echo $row['author'] ?></small></p>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-flat btn-primary "   href=".?p=view_product&id=<?php echo md5($row['id']) ?>">View</a>
											</div>
											
										</div>
									</div>
								</div>
								<?php endwhile; ?>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<style>
    .book-cover{
        object-fit:contain !important;
        height:auto !important;
    }
</style>
<script>
$(document).ready(function()
{


if($('.bbb_viewed_slider').length)
{
var viewedSlider = $('.bbb_viewed_slider');

viewedSlider.owlCarousel(
{
loop:true,
margin:30,
autoplay:true,
autoplayTimeout:6000,
nav:false,
dots:false,
responsive:
{
0:{items:1},
575:{items:2},
768:{items:3},
991:{items:4},
1199:{items:5}
}
});

if($('.bbb_viewed_prev').length)
{
var prev = $('.bbb_viewed_prev');
prev.on('click', function()
{
viewedSlider.trigger('prev.owl.carousel');
});
}

if($('.bbb_viewed_next').length)
{
var next = $('.bbb_viewed_next');
next.on('click', function()
{
viewedSlider.trigger('next.owl.carousel');
});
}
}


});
</script>