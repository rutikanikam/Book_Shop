<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `tbl_distributors` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="card card-outline card-info">
	<div class="card-header">
		<h3 class="card-title"><?php echo isset($id) ? "Update ": "Create New " ?> Distributors</h3>
	</div>
	<div class="card-body">
		<form action="" id="distributor-form">
			<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
			<div class="form-group">
				<label for="distributor_name" class="control-label">Distributor Name</label>
                <textarea name="distributor_name" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_name) ? $distributor_name : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_contact_no" class="control-label">Distributor Contact No</label>
                <textarea name="distributor_contact_no" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_contact_no) ? $distributor_contact_no : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_emailid" class="control-label">Distributor Email ID</label>
                <textarea name="distributor_emailid" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_emailid) ? $distributor_emailid : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_website" class="control-label">Distributor Website</label>
                <textarea name="distributor_website" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_website) ? $distributor_website : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_address" class="control-label">Distributor Address</label>
                <textarea name="distributor_address" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_address) ? $distributor_address : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_state_id" class="control-label">Distributor State Id</label>
                <textarea name="distributor_state_id" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_state_id) ? $distributor_state_id : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="distributor_city_id" class="control-label">Distributor City Id</label>
                <textarea name="distributor_city_id" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($distributor_city_id) ? $distributor_city_id : ''; ?></textarea>
			</div>
			<div class="form-group">
				<label for="zip_code" class="control-label">Zip Code</label>
                <textarea name="zip_code" id="" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($zip_code) ? $zip_code : ''; ?></textarea>
			</div>
		</form>
	</div>
	<div class="card-footer">
		<button class="btn btn-flat btn-primary" form="distributor-form">Save</button>
		<a class="btn btn-flat btn-default" href="?page=our_distributors">Cancel</a>
	</div>
</div>
<script>
    function displayImg(input,_this) {
        console.log(input.files)
        var fnames = []
        Object.keys(input.files).map(k=>{
            fnames.push(input.files[k].name)
        })
        _this.siblings('.custom-file-label').html(JSON.stringify(fnames))
	    
	}
	$(document).ready(function(){
        $('.select2').select2({placeholder:"Please Select here",width:"relative"})
		$('#distributor-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_distributors",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.href = "./?page=our_distributors";
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})

        $('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script>