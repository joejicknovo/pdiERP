var  bs                 = zsi.bs.ctrl
    ,svn                =  zsi.setValIfNull
    ,tblName            = "tblReceivingItemDetail"
    ,receiving_item_id  =null
    ,po_id              = null
    ,ddlPO              = []
    ,ddlProduct         = [];
    
zsi.ready(function(){
   displayRecords();
   getTemplate();
});

function getTemplate(){
    $.get(base_url + "templates/bsDialogBox.txt",function(d){
        var template = Handlebars.compile(d);     
        
        var context = { id:"modalWindow"
                        , title: "Receiving Details" 
                        , sizeAttr: "modal-lg"
                        , footer:  ' <div class="pull-left"><button type="button" onclick="submitItems();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk"></span> Save</button></div>'
                        , body: 
                        
                        '<div><div id="' + tblName + '" class="zGrid"></div></div>'
                      };
        var html    = template(context);     
        $("body").append(html);
    });    
}
function receivingDetail(id,id2){
    receiving_item_id =id;
    po_id = id2;
    displayDetail(id, po_id);
    $(".modal-title").text("Receiving Details for » R.R. No. " + receiving_item_id + " and PO# " + po_id);
    $('#modalWindow').modal("show");
    if (modalWindow===0) {
        modalWindow=1;
        $("#modalWindow").on("hide.bs.modal", function () {
                if (confirm("You are about to close this window. Continue?")) return true;
                return false;
        });
    }  
}

function submitItems(){
    $("#frm_modalWindow").jsonSubmit({
         procedure  : "receiving_item_detail_upd"
        ,optionalItems: ["purchase_order_id","product_id","unit_of_measure_id"]
        ,onComplete : function (data) {
            $("#" + tblName).clearGrid();
            if(data.isSuccess) zsi.form.showAlert("alert");
            displayDetail(receiving_item_id);
        }
    });
}

$("#btnSave").click(function () {
    $("#grid").jsonSubmit({
        procedure: "receiving_item_upd"
        ,optionalItems: ["purchase_order_id","status_id"]
        ,onComplete: function (data) {
            $("#grid").clearGrid(); 
            displayRecords();
        }
    });
    
});

function displayRecords(){   
    var cb = bs({name:"cbFilter1",type:"checkbox"});
         $("#grid").dataBind({
	     url            : execURL + "receiving_item_sel"
	    ,width          : 915
	    ,height         : $(document).height() - 250
	    //,selectorType   : "checkbox"
        ,blankRowsLimit:5
        ,isPaging : false
        ,dataRows : [
                 {text  : cb                                                , type  : "hidden"      , width : 25        , style : "text-align:left;"       
        		    , onRender      :  function(d){ 
                		                   return     bs({name:"receiving_item_id",type:"hidden",value: svn (d,"receiving_item_id")})
                                                    +  (d !==null ? bs({name:"cb",type:"checkbox"}) : "" );
                            }
            }	 
                ,{text  : "R.R. No."        , name  : "receiving_item_id"   , type  : "input"       , width : 100       , style : "text-align:left;"}
        		,{text  : "P.O. No."        , name  : "purchase_order_id"   , type  : "select"      , width : 100       , style : "text-align:left;"}
        		,{text  : "Delivered By"    , name  : "delivered_by"        , type  : "input"       , width : 150       , style : "text-align:left;"}
        		,{text  : "Remark"          , name  : "remark"              , type  : "input"       , width : 300       , style : "text-align:left;"}
        		,{text  : "Status"          , name  : "status_id"           , type  : "select"      , width : 100       , style : "text-align:left;"}
        		,{ text:"Detail"      , width:40     , style:"text-align:center;" 
        		    ,onRender : function(d){ return (d !== null ? "<a href='javascript:void(0);'onclick='receivingDetail(" + svn(d,"receiving_item_id") +", " + svn(d,"purchase_order_id") +");'  ><span class='glyphicon glyphicon-list' style='font-size:12pt;' ></span> </a>" : ""); }}
        		,{ text:"Print"      , width:40     , style:"text-align:center;" 
        		    ,onRender : function(d){ return (d !== null ? "<a href='javascript:void(0);'onclick='receivingDetail(" + svn(d,"receiving_item_id") +", " + svn(d,"purchase_order_id") +");'  ><span class='glyphicon glyphicon-print' style='font-size:12pt;' ></span> </a>" : ""); }}
        
	    ]
	    ,onComplete:function(){
	          //$("select[name='purchase_order_id']").dataBind("purchase_order");

	          $("select[name='purchase_order_id']").dataBind({
                    url: execURL + "po_sel_option"
                    , isUniqueOptions: true
                    , text : "purchase_order_id"
                    , value: "purchase_order_id"
                    , onComplete: function(data){
                       $("select[name='purchase_order_id']").setUniqueOptions();
                       ddlPO = data;
                    }
                });
                
	          $("select[name='status_id']").dataBind("status_receiving_filter");
	    }
    });    
}

function displayDetail(id){   
    var cb = bs({name:"cbFilter2",type:"checkbox",style:"margin-top: 2px;"});
    var totalAmount = 0;
    var totalQuantity = 0;
    var totalUnitPrice = 0;
    $("#" + tblName).dataBind({
         url   : procURL + "receiving_item_detail_sel @receiving_item_id=" + id 
        ,width          : 850
	    ,height         : 200
	    ,blankRowsLimit :5
        ,isPaging       : false
        ,dataRows       :[
    		 { text: cb             , width:25  , style:"text-align:left;" 
    		     ,onRender : function(d){ 
    		         //console.log(svn(d,"amount",111));
                            totalAmount += parseFloat(svn(d,"amount",0));
                            totalQuantity += parseFloat(svn(d,"quantity",0));
                            totalUnitPrice += parseFloat(svn(d,"unit_price",0));
                        
                                return  bs({name:"receiving_item_detail_id",type:"hidden",value:svn (d,"receiving_item_detail_id")})  
                                      + (d !==null ? bs({name:"cb",type:"checkbox"}) : "" )
                                      + bs({name:"receiving_item_id",type:"hidden",value:id});
                            }            
    		 }	 
    		,{ text:"Product"       , width:400     , style:"text-align:left;"      ,type:"select"    ,name:"product_id" }	 
    		,{ text:"Unit"          , width:100     , style:"text-align:left;"      ,type:"select"    ,name:"unit_of_measure_id" }	 
    		,{ text:"Unit Cost"     , width:100     , style:"text-align:right;"     ,type:"input"     ,name:"unit_price"    , class:"moneyGridRightAlign"}
    		,{ text:"Quantity"      , width:100     , style:"text-align:right;"     ,type:"input"     ,name:"quantity"      , class:"moneyGridRightAlign"}	 
    		,{ text:"Amount"        , width:100     , style:"text-align:right;"     ,type:"input"     ,name:"amount"        , class:"moneyGridRightAlign"}
 	    ]
       ,onComplete : function(){
           var $grid = $("#tblReceivingItemDetail");
           var varTTL = '<div class="zRow odd">' +
                            '<div class="zCell totalLabel">Total >>></div>' +
                            '<div id="ttlUCost" class="zCell amountFormat">'+ totalUnitPrice.toFixed(2) +'</div>' +
                            '<div id="ttlQty" class="zCell amountFormat">' + totalQuantity.toFixed(2) + '</div>' +
                            '<div id="ttlAmt" class="zCell amountFormat">' + totalAmount.toFixed(2) + '</div>' +
                        '</div>'; 
            $grid.find(".right #table").prepend(varTTL);
            
            setToNullIfChecked(id);
            $("#cbFilter2").setCheckEvent("#" + tblName + " input[name='cb']");
            
            $("select[name='product_id']").dataBind({
                url: execURL + "po_rr_sel_option @po_id = " + po_id
                , isUniqueOptions: true
                , text : "product"
                , value: "product_id"
                , onComplete: function(data){
                   $("select[name='product_id']").setUniqueOptions();
                   ddlProduct = data;
                }
            });
            $("select[name='product_id']").change(function(){
                var _obj  = this;
                var _result =  Enumerable.From(ddlProduct).Where(function (i) {  return  i.product_id == _obj.value }).ToArray();

                if( _result.length  > 0) {
                     var _i = _result[0];
                     var _$zRow =  $(this).closest(".zRow");
                    _$zRow.find("#unit_of_measure_id").val(_i.unit_of_measure_id);
                    _$zRow.find("#unit_price").val(_i.unit_price);
                    _$zRow.find("#quantity").val(_i.quantity);
                }
            });
            
            $("select[name='unit_of_measure_id']").dataBind("unit_of_measure");
            $('#amount').prop('readonly',true);

            $('#table .zRow #product_id, #quantity, #unit_price').change(function() {
                totalAmount = 0;
                totalQuantity = 0;
                totalUnitPrice = 0;
                $('#table .zRow').each(function() {
                    var qty = $(this).find('input#quantity').val();
                    var rate = $(this).find('input#unit_price').val();
                    var amt = (qty * rate);
                    $(this).find('#amount').prop('readonly',true);
                    $(this).find('input#amount').val(amt === 0 ? '' : amt.toFixed(2));
                    if (amt) {
                        totalAmount += parseFloat(amt);
                        $("#ttlAmt").html(totalAmount.toFixed(2));
                    }
                    if (qty) {
                        totalQuantity += parseFloat(qty);
                        $("#ttlQty").html(totalQuantity.toFixed(2));
                    }
                    if (rate) {
                        totalUnitPrice += parseFloat(rate);
                        $("#ttlUCost").html(totalUnitPrice.toFixed(2));
                    }
                }); //END .each
                return false;
            }); // END click 
        }
    });    
}

function setToNullIfChecked(id){
    $("#" + tblName + " input[name='cb']").change(function(){
            var td  = this.parentNode;
            var receiving_item_id = $(td).find("#receiving_item_id");
            if(this.checked) 
                receiving_item_id.val(id);
            else
                receiving_item_id.val('');
    });
}
/*$("#btnDelete").click(function(){
    zsi.form.deleteData({
         code       : "sys-0002"
        ,onComplete : function(data){
                        displayRecords();
                      }
    });      
});*/                            