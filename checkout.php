<?php 
$total = 0;
    $qry = $conn->query("SELECT c.*,p.title,i.price,p.id as pid, SUM(p.b_weight*c.quantity) as tweight, SUM(c.price*c.quantity) as td  from `cart` c inner join `inventory` i on i.id=c.inventory_id inner join products p on p.id = i.product_id where c.client_id = ".$_settings->userdata('id'));
    while($row= $qry->fetch_assoc()):
        $t = $row['td'];
		$tweight = $row['tweight'];
		//$tweight = $row['quantity'] * $row['b_weight'];
		if($tweight>=1 && $tweight<=500){
				$p=40;
			}else if($tweight>=501 && $tweight<=1000){
				$p=60;
			}else if($tweight>=1001 && $tweight<=1500){
				$p=80;
		    }else if($tweight>=1501 && $tweight<=2000){
				$p=100;
			}else if($tweight>=2001 && $tweight<=2500){
				$p=120;
			}else if($tweight>=2501 && $tweight<=3000){
				$p=140;
			}else if($tweight>=3001 && $tweight<=3500){
				$p=160;
			}else if($tweight>=3501 && $tweight<=4000){
				$p=180;
			}else if($tweight>=4001 && $tweight<=4500){
				$p=200;
			}else if($tweight>=4501 && $tweight<=5000){
				$p=220;
			}else if($tweight>=5001 && $tweight<=5500){
				$p="240";
			}else if($tweight>=5501 && $tweight<=6000){
				$p=260;
			}else if($tweight>=6001 && $tweight<=6500){
				$p="280";
			}else if($tweight>=6501 && $tweight<=7000){
				$p=300;
			}else if($tweight>=7001 && $tweight<=7500){
				$p=320;
			}else if($tweight>=7501 && $tweight<=8000){
				$p=340;
			}else if($tweight>=8001 && $tweight<=8500){
				$p=360;
			}else if($tweight>=8501 && $tweight<=9000){
				$p=380;
			}else if($tweight>=9001 && $tweight<=9500){
				$p=400;
			}else if($tweight>=9501 && $tweight<=10000){
				$p=420;
			}else if($tweight>=10001 && $tweight<=10500){
				$p=440;
			}else if($tweight>=10501 && $tweight<=11000){
				$p=460;
			}else if($tweight>=11001 && $tweight<=11500){
				$p=480;
			}else if($tweight>=11501 && $tweight<=12000){
				$p=500;
			}else if($tweight>=12001 && $tweight<=12500){
				$p=520;
			}else if($tweight>=12501 && $tweight<=13000){
				$p=540;
			}else if($tweight>=13001 && $tweight<=13500){
				$p=560;
			}else if($tweight>=13501 && $tweight<=14000){
				$p=580;
			}else if($tweight>=14001 && $tweight<=14500){
				$p=600;
			}else if($tweight>=14501 && $tweight<=15000){
				$p=620;
			}else{
				$p=0;
			}
			$a= $t + $p;
			$total += $a;
    endwhile;
	require_once('create_razorpay_order.php');
?>
<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body"></div>
            <h3 class="text-center"><b>Checkout</b></h3>
            <hr class="border-dark">
            <form name="razorpayform" id="place_order">
                <input type="hidden" name="amount" value="<?php echo $total ?>">
                <input type="hidden" name="pscharge" value="<?php echo $p ?>">
                <input type="hidden" name="payment_method" value="cod">
                <input type="hidden" name="paid" value="0">
                <div class="row row-col-1 justify-content-center">
                    <div class="col-10">
                    <div class="form-group col mb-0">
                    <label for="" class="control-label">Order Type</label>
                    </div>
						<div class="form-group d-flex pl-2">
							<div class="custom-control custom-radio">
							  <input class="custom-control-input custom-control-input-primary" type="radio" id="customRadio4" name="order_type" value="2" checked="">
							  <label for="customRadio4" class="custom-control-label">For, Home Delivery</label>
							</div>
							<div class="custom-control custom-radio ml-3">
							  <input class="custom-control-input custom-control-input-primary" type="radio" id="customRadio6" name="order_type" value="3">
							  <label for="customRadio6" class="custom-control-label">For, Address Change </label>
							</div>
							<div class="custom-control custom-radio ml-3">
							  <input class="custom-control-input custom-control-input-primary custom-control-input-primary" type="radio" id="customRadio5" name="order_type" value="1">
							  <label for="customRadio5" class="custom-control-label">For Pick up</label> (From Shree Vimal Publisher's Office, Parner)
							</div>
						</div>
                        <div class="form-group col address-holder">
                            <label for="" class="control-label">Default Delivery Address</label>
                            <textarea id="" cols="30" rows="3" name="delivery_address" class="form-control" style="resize:none" readonly><?php echo $_settings->userdata('default_delivery_address') ?>,<?php echo $_settings->userdata('town') ?>-<?php echo $_settings->userdata('pincode') ?>, Taluka : <?php echo $_settings->userdata('taluka') ?>, District : <?php echo $_settings->userdata('district') ?>, <?php echo $_settings->userdata('state') ?>.</textarea>
                        </div>
						<div style="display:none;" class="form-group col address-edit1">
                            <label for="" class="control-label">Change Delivery Address</label>
                            <textarea id="" cols="30" rows="3" name="delivery_address" class="form-control" style="resize:none"><?php echo $_settings->userdata('default_delivery_address') ?></textarea>
                        </div>
						<div style="display:none;" class="form-group col address-edit2">
                            <label for="" class="control-label">Pick-up Address</label>
                            <textarea id="" cols="30" rows="3"  class="form-control" style="resize:none" readonly>Shree Vimal Publishers Private Limited, Shree Parnerkar Guruseva Mandal building, Opposite Poornawad Bhavan, Parner - 414302; District : Ahmednagar,State : Maharashtra,Bharat (India).</textarea>
                        </div>
                        <div style="display:none;" class="form-group col address-edit">
							<label for="" class="control-label">Town<span style="color:red;">*</span></label>
							<input type="text" id="" name="o_town" class="form-control" value="<?php echo $_settings->userdata('town') ?>" required>
							<label for="" class="control-label">Pin Code<span style="color:red;">*</span></label>
							<input type="number" id="" name="o_pincode" class="form-control" value="<?php echo $_settings->userdata('pincode') ?>" required>
							<label for="" class="control-label">Taluka<span style="color:red;">*</span></label>
							<input type="text" id="" name="o_taluka" class="form-control" value="<?php echo $_settings->userdata('taluka') ?>" required>
							<label for="" class="control-label">District<span style="color:red;">*</span></label>
							<input type="text" id="" name="o_district" class="form-control" value="<?php echo $_settings->userdata('district') ?>" required>
							<label for="" class="control-label">State<span style="color:red;">*</span></label>
							<input type="text" id="" name="o_state" class="form-control" value="<?php echo $_settings->userdata('state') ?>" required>
							<label for="" class="control-label">Contact Number<span style="color:red;">*</span></label>
							<input type="text" id="" name="o_contact" maxlength="10" class="form-control" value="<?php echo $_settings->userdata('contact') ?>" required>
                        </div>
                        <div class="col">
                            <span><h4><b style="display:none;">Postal charges:</b> <?php //echo number_format($p) ?></h4></span>
                            <span><h4><b>Total:</b> <?php echo number_format($total) ?></h4></span>
                        </div>
                        <hr>
                        <div class="col my-3">
							<h4 class="text-muted">Payment Method</h4>
                            <div class="d-flex w-100 justify-content-between">
								<button id="rzp-button1">Pay with Razorpay</button>
									<input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
									<input type="hidden" name="razorpay_signature"  id="razorpay_signature" >
									<input type="hidden" name="razorpay_order_id"  id="razorpay_order_id" value=<?php echo $orderData['order_id']; ?>>
							</div>							
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
function verifyAndPlaceOrder(){
		alert('hellow')
		e.preventDefault()
        start_loader();
        $.ajax({
            url:'classes/Master.php?f=place_order',
            method:'POST',
            data:$(this).serialize(),
            dataType:"json",
            error:err=>{
                console.log(err)
                alert_toast("an error occured","error")
                end_loader();
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                    alert_toast("Order Successfully placed.","success")
                    setTimeout(function(){
                        location.replace('./')
                    },2000)
                }else if(!!resp.status && resp.status == 'payment_failed'){
					alert_toast("Payment Failed. Please Try Later","error")
                    end_loader();
				}else{
                    console.log(resp)
                    alert_toast("an error occured","error")
                    end_loader();
                }
            }
        })
	}
// Checkout details as a json
var options = <?php echo $jsonOrderData?>;

options.handler = function (response){
document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
    document.getElementById('razorpay_signature').value = response.razorpay_signature;
$('[name="payment_method"]').val("Online Payment")
    $('[name="paid"]').val(1)
	// document.razorpayform.addEventListener("submit", verifyAndPlaceOrder);
    // document.razorpayform.submit();
	$('#place_order').submit()
};

options.modal = {
    ondismiss: function() {
        console.log("This code runs when the popup is closed");
    },
    // Boolean indicating whether pressing escape key
    // should close the checkout form. (default: true)
    escape: true,
    // Boolean indicating whether clicking translucent blank
    // space outside checkout form should close the form. (default: false)
    backdropclose: false
};

var rzp = new Razorpay(options);

document.getElementById('rzp-button1').onclick = function(e){
    rzp.open();
    e.preventDefault();
}

$(function(){
    $('[name="order_type"]').change(function(){
        if($(this).val() ==1){
            $('.address-holder').hide('slow')
			$('.address-edit1').hide('slow')
			$('.address-edit').hide('slow')
			$('.address-edit2').show('slow')
        }else if($(this).val() ==3){
			 $('.address-holder').hide('slow')
			$('.address-edit').show('slow')
			$('.address-edit1').show('slow')
			$('.address-edit2').hide('slow')
		}else if($(this).val() ==2){
            $('.address-holder').show('slow')
			$('.address-edit').hide('slow')
			$('.address-edit2').hide('slow')
			$('.address-edit1').hide('slow')
        }
    })
	
	

    $('#place_order').submit(function(e){
		alert('hi')
        e.preventDefault()
        start_loader();
        $.ajax({
            url:'classes/Master.php?f=place_order',
            method:'POST',
            data:$(this).serialize(),
            dataType:"json",
            error:err=>{
                console.log(err)
                alert_toast("an error occured","error")
                end_loader();
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                    alert_toast("Order Successfully placed.","success")
                    setTimeout(function(){
                        location.replace('./')
                    },2000)
                }else{
                    console.log(resp)
                    alert_toast("an error occured","error")
                    end_loader();
                }
            }
        })
    })
})
</script>