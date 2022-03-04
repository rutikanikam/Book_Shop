<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Customers</h3>
		</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped table-responsive">
				<thead>
					<tr>
						<th>#</th>
						<th>Client Name</th>
						<th>Gender</th>
						<th>Contact</th>
						<th>Email</th>
						<th>Town</th>
						<th>Pincode</th>
						<th>Taluka</th>
						<th>District</th>
						<th>State</th>
						<th>Address</th>
						<th>Password</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
                                 $query= "SELECT * from clients order by unix_timestamp(date_created) desc";
                                 
                                 $fire = mysqli_query($conn,$query) or die("can not fetch the data from database." .mysqli_error($conn));
                                 
                                 if(mysqli_num_rows($fire)>0)
                                 {
                                 	while($row = mysqli_fetch_assoc($fire))
                                 {
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td>
								<?php echo $row['firstname'] ?>&nbsp<?php echo $row['middle_name'] ?>&nbsp<?php echo $row['lastname'] ?>
							</td>
							<td class="text-left"><?php echo $row['gender'] ?></td>
							<td class="text-left"><?php echo $row['contact'] ?></td>
							<td class="text-left"><?php echo $row['email'] ?></td>
							<td class="text-left"><?php echo $row['town'] ?></td>
							<td class="text-left"><?php echo $row['pincode'] ?></td>
							<td class="text-left"><?php echo $row['taluka'] ?></td>
							<td class="text-left"><?php echo $row['district'] ?></td>
							<td class="text-left"><?php echo $row['state'] ?></td>
							<td class="text-left"><?php echo $row['default_delivery_address'] ?></td>
							<td class="text-left"><?php echo $row['password'] ?></td>
							<td align="center">
							<button type="button" class="btn btn-flat btn-default btn-sm">
				                  		<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </button>
							</td>
						</tr>
					<?php 
								 }
								 }
								 ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Clients detail permanently?","delete_client",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_client($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_client",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}z
</script>