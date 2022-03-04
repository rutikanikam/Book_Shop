<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Contact</h3>
		<!--<div class="card-tools">
			<a href="?page=inventory/manage_inventory" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Create New</a>
		</div>-->
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped table-responsive">
				<colgroup>
					<col width="5%">
					<col width="35%">
					<col width="25%">
					<col width="25%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Contact Number</th>
						<th>Email</th>
						<th>Address</th>
						<th>Message</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `tbl_contact` order by date(created_date) desc ");
						while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo $row['contact_name'] ?></td>
							<td><?php echo $row['contact_no'] ?></td>
							<td><?php echo $row['contact_email'] ?></td>
							<td><?php echo $row['contact_address'] ?></td>
							<td><?php echo $row['contact_message'] ?></td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <!--<a class="dropdown-item" href="?page=inventory/manage_contact&id=<?php //echo $row['contact_id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>-->
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['contact_id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
				                  </div>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this contact permanently?","delete_contact",[$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})
	function delete_contact($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_contact",
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