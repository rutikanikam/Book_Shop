<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Subscriber List</h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="20%">
					<col width="35%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>Sr. No</th>
						<th>Subscriber Email</th>
						<th>Subscription Date</th>
						<th class="text-center">Action</th>
					</tr>
				</thead>
				<tbody>
					<?php  
					$i = 1;
                                 $query= "SELECT * FROM `tbl_newsletter` ORDER BY created_date DESC";
                                 
                                 $fire = mysqli_query($conn,$query) or die("can not fetch the data from database." .mysqli_error($conn));
                                 
                                 if(mysqli_num_rows($fire)>0)
                                 {
                                 	while($user = mysqli_fetch_assoc($fire))
                                 {
                                 ?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo $user['email'] ?></td>
							<td ><p class="truncate-1 m-0"><?php echo $user['created_date'] ?></p></td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <!--<a class="dropdown-item" href="?page=maintenance/manage_subscription&id=<?php echo $user['sub_id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>-->
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $user['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
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
			_conf("Are you sure to delete this Subscription permanently?","delete_subscription",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_subscription($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_subscription",
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
	}
</script>