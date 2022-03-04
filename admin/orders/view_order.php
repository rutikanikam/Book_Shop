<?php if(isset($_GET['view'])): 
require_once('../../config.php');
endif;?>
<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<?php 
if(!isset($_GET['id'])){
    $_settings->set_flashdata('error','No order ID Provided.');
    redirect('admin/?page=orders');
}
$order = $conn->query("SELECT o.*,c.firstname, c.middle_name, c.lastname, c.default_delivery_address, c.contact, c.town, c.pincode, c.taluka, c.district, c.state  FROM `orders` o inner join clients c on c.id = o.client_id where o.id = '{$_GET['id']}' ");if($order->num_rows > 0){
    foreach($order->fetch_assoc() as $k => $v){
        $$k = $v;
    }
}else{
    $_settings->set_flashdata('error','Order ID provided is Unknown');
    redirect('admin/?page=orders');
}
?>
<div class="form-group col-md-1">
                    <button class="btn btn-flat btn-block btn-success btn-sm" type="button" id="printBTN"><i class="fa fa-print"></i> Print</button>
                </div>		
<div class="card card-outline card-primary">
    <div class="card-body">
		<div id="printable">
			<div class="conitaner-fluid">
				<h3 class="text-center m-0"><b>Shree Vimal Publishers Private Limited</b></h3>
				<p class="text-center m-0">Shree Parnerkar Guruseva Mandal office building, Parner - 414302</p>
				<p class="text-center m-0">Phone no. : 9226885522</p>
				<p class="text-center m-0">Email : svppl.parner@gmail.com</p>
				<p class="text-center m-0">GSTIN : 27AARCS6147G2ZU</p>
				<p class="text-center m-0">State : 27-Maharashtra</p>
                <hr>
					<p><b>Client Name : </b><?php echo $firstname ?>&nbsp<?php echo $middle_name ?>&nbsp<?php echo $lastname ?></p>
				<div class="row">
					<div class="col-lg-6">
						<p><b>Client Address : </b><?php echo $default_delivery_address ?></p>
						<p><b>Client Contact No : </b><?php echo $contact ?></p>
					</div>
					<div class="col-lg-6">
						<p><b>Delivery Address : </b><?php echo $delivery_address ?>, <?php echo $o_town ?> - <?php echo $o_pincode ?>, Taluka : <?php echo $o_taluka ?>, District : <?php echo $o_district ?>, State : <?php echo $o_state ?></p>
						<p><b>Contact No : </b><?php echo $o_contact ?></p>
					</div>
				</div>
				<table class="table-striped table table-bordered">
					<colgroup>
						<col width="45%">
						<col width="15%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>Product</th>
							<th>QTY</th>
							<th>Price</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<?php 
							$olist = $conn->query("SELECT o.*,p.title,p.author,p.b_weight FROM order_list o inner join products p on o.product_id = p.id where o.order_id = '{$id}' ");
							while($row = $olist->fetch_assoc()):
							foreach($row as $k => $v){
                            $row[$k] = trim(stripslashes($v));
							}
						?>
						<tr>
							<td>
								<p class="m-0"><?php echo $row['title']?></p>
								<p class="m-0"><small>Author: <?php echo $row['author']?></small></p>
							</td>
							<td class="text-center"><?php echo $row['quantity'] ?></td>
							<td class="text-center"><?php echo number_format($row['price']) ?></td>
							<td class="text-center"><?php echo number_format($row['price'] * $row['quantity']) ?></td>
						</tr>
						<?php endwhile; ?>
					</tbody>
					<tfoot>
						<tr>
							<th colspan='3'  class="text-right">Postal Charges</th>
							<th class="text-center"><?php echo number_format($pscharge) ?></th>
						</tr>
						<tr>
							<th colspan='3'  class="text-right">Grand Total</th>
							<th class="text-center"><?php echo number_format($amount) ?></th>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="row">
				<div class="col-6">
					<p>Payment Method: <?php echo $payment_method ?></p>
					<p>Payment Status: <?php echo $paid == 0 ? '<span class="badge badge-light text-dark">Unpaid</span>' : '<span class="badge badge-success">Paid</span>' ?></p>
					<p>Order Type: <?php 
					if($order_type == 1)
					{
					echo '<span class="badge badge-light text-dark">PICK-UP</span>'; 
					}
					elseif($order_type == 2)
					{
						echo '<span class="badge badge-light text-dark">For Delivery</span>';
					}
					else
					{
						echo '<span class="badge badge-light text-dark">For Delivery</span>';
					}
					?></p>
				</div>
				<div class="col-6 row row-cols-2">
					<div class="col-3">Order Status:
						<?php 
							switch($status){
								case '0':
									echo '<span class="badge badge-light text-dark">Pending</span>';
								break;
								case '1':
									echo '<span class="badge badge-primary">Packed</span>';
								break;
								case '2':
									echo '<span class="badge badge-warning">Out for Delivery</span>';
								break;
								case '3':
									echo '<span class="badge badge-success">Delivered</span>';
								break;
								case '5':
									echo '<span class="badge badge-success">Picked Up</span>';
								break;
								default:
									echo '<span class="badge badge-danger">Cancelled</span>';
								break;
							}
						?>
					</div>
				</div>
			</div>
		</div>
			 <?php if(!isset($_GET['view'])): ?>
			<div class="row">
				<div class="col-4"></div>
				<div class="col-8">
					<button type="button" id="update_status" class="btn btn-sm btn-flat btn-primary">Update Status</button>
				</div>
			</div>
            <?php endif; ?>
    </div>
</div>
<?php if(isset($_GET['view'])): ?>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary btn-dark" data-dismiss="modal">Close</button>
</div>
<style>
    #uni_modal>.modal-dialog>.modal-content>.modal-footer{
        display:none;
    }
    #uni_modal .modal-body{
        padding:0;
    }
</style>
<?php endif; ?>
<noscript>
    <style>
        .m-0{
            margin:0;
        }
        .text-center{
            text-align:center;
        }
        .text-right{
            text-align:right;
        }
        .table{
            border-collapse:collapse;
            width: 100%
        }
        .table tr,.table td,.table th{
            border:1px solid gray;
        }
    </style>
</noscript>
<script>
    $(function(){
        $('#update_status').click(function(){
            uni_modal("Update Status", "./orders/update_status.php?oid=<?php echo $id ?>&status=<?php echo $status ?>")
        })
    })
	$(function(){
		$('#printBTN').click(function(){
            var rep = $('#printable').clone();
            var ns = $('noscript').clone().html();
            start_loader()
            rep.prepend(ns)
            var nw = window.document.open('','_blank','width=900,height=600')
                nw.document.write(rep.html())
                nw.document.close()
                nw.print()
                setTimeout(function(){
                    nw.close()
                    end_loader()
                },500)
        })
	})
</script>