var bs = zsi.bs.ctrl;
var svn =  zsi.setValIfNull;

zsi.ready(function(){
   displayRecords();
   getTemplate();
});
var  contextNewClient = {
    id: "ModalAddClient"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="ClearItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblClientInfo"class="col-xs-12">'+
                        '<div class="col-xs-12" style="background:#5D7BB3;color:#fff;font-size:10pt;margin-bottom:10px" ><label>Client Information </label> </div>'+
                        '<div class="form-group" >' +
                            '<input type="hidden" name="client_id" id="client_id" class="form-control input-sm" >' +
                            '<label class=" col-xs-2 control-label">Customer Name: </label>' +
                            '<div class=" col-xs-3">'+
                                '<input type="text" name="customer_name" id="customer_name" class="form-control input-sm" >'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Address: </label>' +
                            '<div class=" col-xs-5">'+
                                '<input type="text" name="address" id="address " class="form-control input-sm" >'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Nature of Business: </label>'+ 
                            '<div class=" col-xs-5">'+
                                '<select type="text" name="industry_id" id="industry_id" class="form-control input-sm"></select>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Client Type: </label>'+ 
                            '<div class=" col-xs-3">'+
                                '<select type="text" name="client_type_id" id="client_type_id" class="form-control input-sm"></select>' +
                            '</div>'+
                        '</div>'+
                        '<div class="col-xs-12" style="background:#5D7BB3;color:#fff;font-size:10pt; margin-bottom:10px" ><label>Contact Information </label> </div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Contact Person: </label>' +
                            '<div class=" col-xs-3">'+
                                '<input type="text" name="contact_person" id="contact_person" class="form-control input-sm" >'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Phone No.: </label>' +
                            '<div class=" col-xs-3">'+
                                '<input type="text" name="phone_no" id="phone_no" class="form-control input-sm" >'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Email Address: </label>' +
                            '<div class=" col-xs-3">'+
                                '<input type="text" name="email_address" id="email_address" class="form-control input-sm" >'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class=" col-xs-2 control-label">Is Active: </label>' +
                            '<div class=" col-xs-1">'+
                                '<select type="text" name="is_active" id="is_active" class="form-control input-sm" >'+
                                    '<option value="Y">YES</option>'+
                                    '<option value="N">NO</option>'+
                                '</select>'+
                            '</div>'+
                        '</div>'+
                        
                    '</div>'+
                    
                    
                    '<div id="tblOtherInfo" class="col-xs-12">'+
                        '<div class="col-xs-12" style="background:#5D7BB3;color:#fff;font-size:10pt;margin-bottom:10px;" ><label>Other Information </label> </div>'+    
                        '<div class=" col-xs-12">'+
                            '<div class="row">'+
                                '<div class=" col-xs-1">'+
                                    '<button type="button" class="btn btn-primary btn-sm" id="btnNew">'+
                                    	'<span class="glyphicon glyphicon-plus"></span> Add'+
                                    '</button>'+
                                '</div>'+
                            '</div>'+
                            '<div class=" col-xs-2">'+
                                
                            '</div>'+
                            '<div class=" col-xs-8">'+
                                '<input type="hidden" name="client_other_information_id" id="client_other_information_id" class="form-control input-sm" >' +
                                '<input type="hidden" name="client_id" id="client_id" class="form-control input-sm" >' +
                                '<div class="form-group" >' +
                                    '<div class=" col-xs-6">'+
                                        '<input type="text" name="description " id="description " class="form-control input-sm" >'+
                                    '</div>'+
                                    '<div class=" col-xs-6">'+
                                        '<input type="text" name="value" id="value" class="form-control input-sm" >'+
                                    '</div>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'
};
            
$("#btnNew").click(function () {
    $("#ModalAddClient .modal-title").text("Add New Client");
    $('#ModalAddClient').modal({ show: true, keyboard: false, backdrop: 'static' });
   // $('#modalWindow_oem').setCloseModalConfirm();
    displayAddNewClient();
    displayOtherInfo();
});

$("#btnSave").click(function () {
    $("#grid").jsonSubmit({
        procedure: "client_update"
        ,optionalItems: ["is_active"]
        ,onComplete: function (data) {
            $("#grid").clearGrid(); 
            if(data.isSuccess===true) zsi.form.showAlert("alert");
            displayRecords();
        }
    });
});

function getTemplate(){
    $.get(base_url + "templates/bsDialogBox.txt", function(d) {
        var template = Handlebars.compile(d);
        $("body").append(template(contextNewClient));
    });    
}
function displayRecords(){   
    var cb = bs({name:"cbFilter1",type:"checkbox"});
         $("#grid").dataBind({
	     url            : execURL + "client_sel"
	    ,width          : 400
	    ,height         : $(document).height() - 250
	    //,selectorType   : "checkbox"
        ,blankRowsLimit:5
        ,isPaging : true
        ,dataRows : [
                 {text  : "Client No."                  , name  : "client_id"        , width : 80        , style : "text-align:left;"       
        		    ,onRender :  function(d){ 
                		                   return    svn (d,"client_id");
                            }
                 }	 
        		,{text  : "Client Name"                , name  : "client_name"       , width : 200       , style : "text-align:left;"
        		    ,onRender :  function(d){ 
                		                   return    svn (d,"client_name");
                            }
        		}
	    ]
	    ,onComplete:function(){
	          //$("select[name='warehouse_contact_person_id']").dataBind("employees");
	          var $rows = $('#table .zRow');
            	$('#client_search_code_filter').keyup(function(e) { 
            		text = $(this).val(); // grab search term
            		if(text.length > 3) {
            		   var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                        $rows.show().filter(function() {
                            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                            return !~text.indexOf(val);
                        }).hide();
            		}
            		else 
            			$rows.show(); // if no matching name is found, show all rows
            	}); 
	    }
    });    
}
function displayAddNewClient() {
}
function displayOtherInfo(){
    
}

/*$("#btnDelete").click(function(){
    zsi.form.deleteData({
         code       : "sys-0002"
        ,onComplete : function(data){
                        displayRecords();
                      }
    });      
});*/            