
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col d-flex justify-content-end mb-2">
                <button class="btn btn-outline-dark btn-flat btn-sm" type="button" id="empty_cart">Empty Cart</button>
            </div>
        </div>
        <div class="card rounded-0">
            <div class="card-body">
                <h3><b>Cart List</b></h3>
                <hr class="border-dark">
                <?php 
                    $qry = $conn->query("SELECT c.*,p.title,i.price,p.b_weight,p.id as pid from `cart` c inner join `inventory` i on i.id=c.inventory_id inner join products p on p.id = i.product_id where c.client_id = ".$_settings->userdata('id'));
					if($qry->num_rows > 0){
                    while($row= $qry->fetch_assoc()):
                        $upload_path = base_app.'/uploads/product_'.$row['pid'];
                        $img = "";
                        foreach($row as $k=> $v){
                            $row[$k] = trim(stripslashes($v));
                        }
                        if(is_dir($upload_path)){
                            $fileO = scandir($upload_path);
                            if(isset($fileO[2]))
                                $img = "uploads/product_".$row['pid']."/".$fileO[2];
                            // var_dump($fileO);
                        }
                ?>
                    <div class="d-flex w-100 justify-content-between  mb-2 py-2 border-bottom cart-item">
                        <div class="d-flex align-items-center col-8">
                            <span class="mr-2"><a href="javascript:void(0)" class="btn btn-sm btn-outline-danger rem_item" data-id="<?php echo $row['id'] ?>"><i class="fa fa-trash"></i></a></span>
                            <img src="<?php echo validate_image($img) ?>" loading="lazy" class="cart-prod-img mr-2 mr-sm-2" alt="">
                            <div>
                                <p class="mb-1 mb-sm-1"><?php echo $row['title'] ?></p>
                                
                                <p class="mb-1 mb-sm-1"><small><b>Price :</b> <span class="price"><?php echo number_format($row['price']) ?></span></small></p>
                                <div>
                                <div class="input-group" style="width:130px !important">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-sm btn-outline-secondary min-qty" onClick="window.location.reload();" type="button" id="button-addon1"><i class="fa fa-minus"></i></button>
                                    </div>
                                    <input type="number" class="form-control form-control-sm qty text-center cart-qty" placeholder="" aria-label="Example text with button addon" value="<?php echo $row['quantity'] ?>" aria-describedby="button-addon1" data-id="<?php echo $row['id'] ?>" readonly>
                                    <div class="input-group-append">
                                        <button class="btn btn-sm btn-outline-secondary plus-qty" onClick="window.location.reload();" type="button" id="button-addon1"><i class="fa fa-plus"></i></button>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col text-right align-items-center d-flex justify-content-end">
                            <h4><b class="total-weight" style="display:none;"><?php echo $row['b_weight'] * $row['quantity'] ?></b></h4>
                        </div>
                        <div class="col text-right align-items-center d-flex justify-content-end">
                            <h4><b class="total-amount"><?php echo number_format($row['price'] * $row['quantity']) ?></b></h4>
                        </div>
                    </div>
					<?php endwhile;?>
				<div class="d-flex w-100 justify-content-between mb-2 py-2 border-bottom"style="display:none;">
                    <div class="col-8 d-flex justify-content-end"><h4 style="display:none;">Total Weight :</h4></div>
                    <div class="col d-flex justify-content-end"><h4 id="postal-charges" style="display:none;">-</h4></div>
                </div>
				<div class="d-flex w-100 justify-content-between mb-2 py-2 border-bottom">
                    <div class="col-8 d-flex justify-content-end"><h4>Postal Charges :</h4></div>
                    <div class="col d-flex justify-content-end"><h4 id="demo">-</h4></div>
                </div>
                <div class="d-flex w-100 justify-content-between mb-2 py-2 border-bottom">
                    <div class="col-8 d-flex justify-content-end"><h4>Total Book Price :</h4></div>
                    <div class="col d-flex justify-content-end"><h4 id="grand-total">-</h4></div>
                </div>
            </div>
        </div>
        <div class="d-flex w-100 justify-content-end">
            <a href="./?p=checkout" class="btn btn-sm btn-flat btn-dark">Checkout</a>
        </div>
					<?php }else 
					{ 
					echo "<img src='images/empty.png' class='rounded mx-auto d-block' alt='Cinque Terre' width='304' height='236'> "; 
					}
					?>
    </div>
</section>
<script>
	
    function calc_total(){
        var total  = 0
        $('.total-amount').each(function(){
            amount = $(this).text()
            amount = amount.replace(/\,/g,'')
            amount = parseFloat(amount)
            total += amount
        })
        $('#grand-total').text(parseFloat(total).toLocaleString('en-US'))
		
		var t  = 0
        $('.total-weight').each(function(){
            amt = $(this).text()
            amt = amt.replace(/\,/g,'')
            amt = parseFloat(amt)
            t += amt
			
        })
        $('#postal-charges').text(parseFloat(t).toLocaleString('en-US'))
		
		var p  = 0
        $('#postal-charges').each(function(){
            amt = $(this).text()
            amt = amt.replace(/\,/g,'')
            amt = parseFloat(amt)
            if(amt>=1 && amt<=500){
				p="40";
			}else if(amt>=501 && amt<=1000){
				p="60";
			}else if(amt>=1001 && amt<=1500){
				p="80";
		    }else if(amt>=1501 && amt<=2000){
				p="100";
			}else if(amt>=2001 && amt<=2500){
				p="120";
			}else if(amt>=2501 && amt<=3000){
				p="140";
			}else if(amt>=3001 && amt<=3500){
				p="160";
			}else if(amt>=3501 && amt<=4000){
				p="180";
			}else if(amt>=4001 && amt<=4500){
				p="200";
			}else if(amt>=4501 && amt<=5000){
				p="220";
			}else if(amt>=5001 && amt<=5500){
				p="240";
			}else if(amt>=5501 && amt<=6000){
				p="260";
			}else if(amt>=6001 && amt<=6500){
				p="280";
			}else if(amt>=6501 && amt<=7000){
				p="300";
			}else if(amt>=7001 && amt<=7500){
				p="320";
			}else if(amt>=7501 && amt<=8000){
				p="340";
			}else if(amt>=8001 && amt<=8500){
				p="360";
			}else if(amt>=8501 && amt<=9000){
				p="380";
			}else if(amt>=9001 && amt<=9500){
				p="400";
			}else if(amt>=9501 && amt<=10000){
				p="420";
			}else if(amt>=10001 && amt<=10500){
				p="440";
			}else if(amt>=10501 && amt<=11000){
				p="460";
			}else if(amt>=11001 && amt<=11500){
				p="480";
			}else if(amt>=11501 && amt<=12000){
				p="500";
			}else if(amt>=12001 && amt<=12500){
				p="520";
			}else if(amt>=12501 && amt<=13000){
				p="540";
			}else if(amt>=13001 && amt<=13500){
				p="560";
			}else if(amt>=13501 && amt<=14000){
				p="580";
			}else if(amt>=14001 && amt<=14500){
				p="600";
			}else if(amt>=14501 && amt<=15000){
				p="620";
			}else{
				p="0";
			}
        })
        $('#demo').text(parseFloat(p).toLocaleString('en-US'))
    }
    function qty_change($type,_this){
        var qty = _this.closest('.cart-item').find('.cart-qty').val()
        var price = _this.closest('.cart-item').find('.price').text()
            price = price.replace(/,/g,'')
            console.log(price)
		var weight = _this.closest('.cart-item').find('.b_weight').text()
            weight = weight.replace(/,/g,'')
            console.log(weight)
        var cart_id = _this.closest('.cart-item').find('.cart-qty').attr('data-id')
        var new_t = 0;
		var new_total = 0;
        start_loader();
        if($type == 'minus'){
            qty = parseInt(qty) - 1
        }else{
            qty = parseInt(qty) + 1
        }
        price = parseFloat(price)
        // console.log(qty,price)
        new_total = parseFloat(qty * price).toLocaleString('en-US')
		weight = parseFloat(weight)
        // console.log(qty,weight)
        new_t = parseInt(qty * weight).toLocaleString('en-US')
        _this.closest('.cart-item').find('.cart-qty').val(qty)
        _this.closest('.cart-item').find('.total-amount').text(new_total)
		_this.closest('.cart-item').find('.total-weight').text(new_t)
        calc_total()

        $.ajax({
            url:'classes/Master.php?f=update_cart_qty',
            method:'POST',
            data:{id:cart_id, quantity: qty},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert_toast("an error occured", 'error');
                end_loader()
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                    end_loader()
                }else{
                    alert_toast("an error occured", 'error');
                    end_loader()
                }
            }

        })
    }
    function rem_item(id){
        $('.modal').modal('hide')
        var _this = $('.rem_item[data-id="'+id+'"]')
        var id = _this.attr('data-id')
        var item = _this.closest('.cart-item')
        start_loader();
        $.ajax({
            url:'classes/Master.php?f=delete_cart',
            method:'POST',
            data:{id:id},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert_toast("an error occured", 'error');
                end_loader()
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                    item.hide('slow',function(){ item.remove() })
                    calc_total()
                    end_loader()
                }else{
                    alert_toast("an error occured", 'error');
                    end_loader()
                }
            }

        })
    }
    function empty_cart(){
        start_loader();
        $.ajax({
            url:'classes/Master.php?f=empty_cart',
            method:'POST',
            data:{},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert_toast("an error occured", 'error');
                end_loader()
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                   location.reload()
                }else{
                    alert_toast("an error occured", 'error');
                    end_loader()
                }
            }

        })
    }
    $(function(){
        calc_total()
        $('.min-qty').click(function(){
            qty_change('minus',$(this))
        })
        $('.plus-qty').click(function(){
            qty_change('plus',$(this))
        })
        $('#empty_cart').click(function(){
            // empty_cart()
            _conf("Are you sure to empty your cart list?",'empty_cart',[])
        })
        $('.rem_item').click(function(){
            _conf("Are you sure to remove the item in cart list?",'rem_item',[$(this).attr('data-id')])
        })
    })
</script>
