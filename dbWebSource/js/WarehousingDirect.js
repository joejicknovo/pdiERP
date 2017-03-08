 var bs              = zsi.bs.ctrl
    ,svn            =  zsi.setValIfNull
    ,wrapSD         = "<div class='input-group date'>"
    ,wrapED         = "</div>"
    ,tblName        = "tblWarehousingDirect"
    ,warehousing_detail_id = null
    ,ddlRR          = null
    ,ddlProduct     = []
    ,g_is_update = false
;

// Create an Material object.
var Material = {
    UnitOfMeasureId: '',
    UnitOfMeasureName: '',
};

zsi.ready(function(){
   displayRecords('');
   getTemplates();
});

var  contextModalTemplate = {
    id: "modalTemplate"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItems();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="Cancel();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Cancel</button>'
            + '<button type="button" onclick="ClearItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">' +
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblModalTemplate" class="col-xs-12">' +
                        '<div class="col-xs-12 header-container"><label>Warehousing (Direct)</label></div>' +
                        '<input type="hidden" name="warehousing_detail_id" id="warehousing_detail_id" class="form-control input-sm" >' +
                        '<input type="hidden" name="warehousing_id" id="warehousing_id" class="form-control input-sm" value="0">' +
                        '<div class="form-group">' +
                            '<label class=" col-xs-2 control-label">Item:</label>' +
                            '<div class="col-xs-9">' +
                                '<select type="text" name="material_id" id="material_id" class="form-control input-sm required">' +
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">' +
                                '<span class="required-label">*</span>' +
                            '</div>' +
                        '</div>'+
                        '<div class="form-group">' +
                            '<label class=" col-xs-2 control-label">Unit of Measure:</label>' +
                            '<div class="col-xs-3">' +
                                '<input type="text" name="unit_of_measure_name" id="unit_of_measure_name" class="form-control input-sm" readonly>' +
                            '</div>'+
                            '<div class="col-xs-1">' +
                                '<span class="required-label">*</span>' +
                            '</div>' +
                            '<label class=" col-xs-2 control-label">Quantity:</label>' +
                            '<div class=" col-xs-3">' +
                                '<input type="text" name="quantity" id="quantity" class="form-control input-sm numeric required required-number">' +
                            '</div>' +
                            '<div class="col-xs-1">' +
                                '<span class="required-label">*</span>' +
                            '</div>' +
                        '</div>'+
                        '<div class="form-group">' +
                            '<label class=" col-xs-2 control-label">Warehouse:</label>' +
                            '<div class="col-xs-3">' +
                                '<select type="text" name="warehouse_id" id="warehouse_id" class="form-control input-sm required">' +
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">' +
                                '<span class="required-label">*</span>' +
                            '</div>' +
                            '<label class=" col-xs-2 control-label">Rack:</label>' +
                            '<div class="col-xs-3">' +
                                '<select type="text" name="rack_id" id="rack_id" class="form-control input-sm required">' +
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">' +
                                '<span class="required-label">*</span>' +
                            '</div>' +
                        '</div>' +
                        '<div class="form-group">' +
                            '<label class=" col-xs-2 control-label">Tag No.:</label>' +
                            '<div class=" col-xs-3">' +
                                '<input type="text" name="tag_no" id="tag_no" class="form-control input-sm">' +
                            '</div>' +
                            //'<div class="col-xs-1">' +
                            //    '<span class="required-label">*</span>' +
                            //'</div>' +
                            '<label class=" col-xs-3 control-label">Expiration Date:</label>' +
                            '<div class="col-xs-3">' +
                                '<input type="text" name="expiration_date" id="expiration_date" class="form-control input-sm" >' +
                            '</div>' +
                            //'<div class="col-xs-1">' +
                            //    '<span class="required-label">*</span>' +
                            //'</div>' +
                        '</div>' +
                    '</div>' +
                '</div>' +
            '</div>'
};

// Initialize a modal window object for viewing the warehousing direct.
var  contextViewWarehousingDirect = {
    id: "modalViewWarehousingDirect"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="CloseView();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Close</button>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblViewWarehousingDirect" class="col-xs-12">'+
                    
                        '<div class="col-xs-12 header-container"><label>Warehousing Direct Information</label> </div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Item:</label>' +
                            '<label class="col-xs-9 control-label label-display" id="material_item_full_name" name="material_item_full_name">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Unit of Measure:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="unit_of_measure_name" name="unit_of_measure_name">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Quantity:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="quantity" name="quantity">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Warehouse:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="warehouse_name" name="warehouse_name">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Rack:</label>' +
                            '<label class="col-xs-3 control-label label-display" id="rack_name" name="rack_name">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Tag No.:</label>' +
                            '<label class="col-xs-3 control-label label-display" id="tag_no" name="tag_no">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Expiration Date:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="expiration_date" name="expiration_date">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Last Updated By:</label>' +
                            '<label class="col-xs-3 control-label label-display" id="last_updated_by_name" name="last_updated_by_name">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Last Updated Date/Time:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="last_updated_by_date" name="last_updated_by_date">&nbsp;</label>' +
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'
};

function getTemplates(){
    $.get(base_url + "templates/bsDialogBox.txt", function(d) {
        var template = Handlebars.compile(d);
        $("body").append(template(contextModalTemplate));
        $("body").append(template(contextViewWarehousingDirect));
    });    
}

function initSelectOptions(callbackFunc) {
    $("select[name='material_id']").dataBind({
        url: base_url + "selectoption/code/item_full_name_opts"
        , onComplete : function(){
            $("select[name='warehouse_id']").dataBind({
                url: base_url +  "selectoption/code/warehouse"
                , onComplete : function(){
                    $("select[name='rack_id']").dataBind({
                        url: base_url +  "selectoption/code/warehouse_rack"
                        , onComplete : function(){
                            if(callbackFunc) callbackFunc();
                        }
                    });
                }
            });
        }
    });
}

function warehousingDirect(id,id2){
    warehousing_detail_id =id;
    displayDetail(id);
    $(".modal-title").text("Warehousing Direct for » " + warehousing_detail_id);
    $('#modalWindow').modal("show");
    if (modalWindow===0) {
        modalWindow=1;
        $("#modalWindow").on("hide.bs.modal", function () {
                if (confirm("You are about to close this window. Continue?")) return true;
                return false;
        });
    }  
}

function displayRecords(search_param){
    $("#grid").dataBind({
	    url: procURL + "warehousing_direct_sel @search_param='" + search_param + "'" 
	    , width: 1335
	    , height: $(document).height() - 250
        , blankRowsLimit: 0
        , isPaging: true
        , dataRows: [
            { 
                text: "Edit"      
                , width: 50     
                , style: "text-align:center;" 
                , onRender: function(d) { 
                    return "<a href='javascript:void(0);'onclick='showModalUpdate(" + svn(d, "warehousing_detail_id") + ", " + 
                    svn(d, "warehousing_detail_id") + ");'><span class='glyphicon glyphicon-edit' style='font-size:12pt;'></span></a>"; 
                }
            }
            ,{
                text: "Item Code"          
                , name: "material_code"         
                , type: "input"    
                , width: 100    
                , style: "text-align:left;"
                , onRender: function(d) { 
        		     return "<a href='javascript:void(0);'onclick='viewWarehousingDirect(\""
    		        + svn(d,"warehousing_detail_id") + "\");' class='link-button'>" 
    		        + svn(d,"material_code") + " </a>";
    		    }
    		}
            ,{ 
                text: "Item Description"        
                , width: 500    
                , style: "text-align:left;"     
                , type: "label"  
                , name: "material_description" 
                , onRender: function(d) {
                    return svn(d, "material_description");
                }
            }
    		,{ 
    		    text: "Unit of Measure"   
    		    , width: 120 
    		    , style: "text-align:left;"  
    		    , type: "label"  
    		    , name: "unit_of_measure_name" 
    		    , onRender: function(d) { 
    		        return svn(d, "unit_of_measure_name");
    		    }
    		}	 
    		,{ 
    		    text: "Qty"      
    		    , width: 50    
    		    , style: "text-align:center;"   
    		    , type: "label" 
    		    , name: "quantity"      
    		    , class: "money"
    		    , onRender: function(d) { 
    		        return svn(d, "quantity");
    		    }
    		}	 
    		,{ 
    		    text: "Warehouse"     
    		    , width: 150    
    		    , style: "text-align:left;" 
    		    , type: "label" 
    		    , name: "warehouse_name" 
    		    , onRender: function(d) { 
    		        return svn(d, "warehouse_name");
    		    }
    		}	 
    		,{ 
    		    text: "Rack"       
    		    , width: 150  
    		    , style: "text-align:left;"     
    		    , type: "label"
    		    , name: "warehouse_rack_name" 
    		    , onRender: function(d) {
    		        return svn(d, "warehouse_rack_name");
    		    }
    		}	 
    		,{ 
    		    text: "Tag No."        
    		    , width: 80    
    		    , style: "text-align:left;"   
    		    , type: "label" 
    		    , name: "tag_no"
    		    , onRender: function(d) { 
    		        return svn(d, "tag_no");
    		    }
    		}
			,{ 
			    text: "Expiration Date" 
			    , width: 110   
			    , style: "text-align:left;"   
			    , type: "label" 
			    , name: "expiration_date"
    		    , onRender: function(d) { 
    		        return svn(d, "expiration_date").toDateFormat();
    		    }
    		}
	    ]
	    , onComplete:function(){
            var $rows = $('#table .zRow');
            $('#search_param').keyup(function(e) { 
                text = $(this).val(); // grab search term
                if(text.length > 3) {
                   var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                    $rows.show().filter(function() {
                        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                        return !~text.indexOf(val);
                    }).hide();
                }
                else {
                    $rows.show(); // if no matching name is found, show all rows
                }
            });  
        }
    });    
}

function setToNullIfChecked(id){
    $("#" + tblName + " input[name='cb']").change(function(){
            var td  = this.parentNode;
            var warehousing_detail_id = $(td).find("#warehousing_detail_id");
            if(this.checked) 
                warehousing_detail_id.val(id);
            else
                warehousing_detail_id.val('');
    });
}

$("#btnNew").click(function(){
    g_is_update = false;
    $("#modalTemplate .modal-title").text("Add New Warehousing (Direct)");
    $("#modalTemplate").modal({ show: true, keyboard: false, backdrop: 'static' });
    clearEntries();
    zsi.initDatePicker();
    
    initSelectOptions(function() {
        $("#tblModalTemplate #material_id").change(function(){
            if($(this).val() !== "") {
                getItemInfo($(this).val(), function() {
                    $("#tblModalTemplate #unit_of_measure_name").val(Material.UnitOfMeasureName);
                });
            }
        });
    });
});

function showModalUpdate(warehousing_detail_id, product_code) {
    g_is_update = true;
    $("#modalTemplate .modal-title").text("Warehousing (Direct) Update");
    $("#modalTemplate").modal({ show: true, keyboard: false, backdrop: 'static' });
    zsi.initDatePicker();
    $("#tblModalTemplate #warehousing_detail_id").val(warehousing_detail_id);
    
    initSelectOptions(function(){
        $.get(execURL + "warehousing_direct_sel @warehousing_detail_id=" + warehousing_detail_id, function(d) {
            if (d.rows !== null) {
                $("#material_id").val(d.rows[0].material_id);
                $("#unit_of_measure_id").val(d.rows[0].unit_of_measure_id);
                $("#unit_price").val(d.rows[0].unit_price);
                $("#quantity").val(d.rows[0].quantity);
                $("#warehouse_id").val(d.rows[0].warehouse_id);
                $("#rack_id").val(d.rows[0].rack_id);
                $("#tag_no").val(d.rows[0].tag_no);
                $("#expiration_date").val(d.rows[0].expiration_date.toDateFormat());
                
                getItemInfo(d.rows[0].material_id, function() {
                    $("#tblModalTemplate #unit_of_measure_name").val(Material.UnitOfMeasureName);
                });
            }
            $("#tblModalTemplate #material_id").change(function(){
                if($(this).val() !== "") {
                    getItemInfo($(this).val(), function() {
                        $("#tblModalTemplate #unit_of_measure_name").val(Material.UnitOfMeasureName);
                    });
                }
            });
        });
        
    });
    
}

function SubmitItems(){
    var isValid = validEntries();
    if (isValid === false) {
        alert(Messages.MarkedFieldsRequired);
        return false;
    } else if (validRequiredNumbers() === false) {
        alert('Invalid numbers found.');
        return false;
    } else if (validNumbers() === false) {
        alert('Invalid numbers found.');
        return false;
    } else {
        var result = confirm(Messages.AllEntriesCorrectContinue);
        if (result) {
            $('.btn-primary').prop('disabled', true);
            showProcessMessage(Messages.Saving);
            $("#tblModalTemplate").jsonSubmit({
                procedure: "warehousing_direct_upd"
                //,optionalItems: ["warehousing_detail_id"]
                , notInclude: "#unit_of_measure_name"
                , onComplete: function(data) {
                    if (data.isSuccess === true) {
                        showProcessMessage("");
                        $('.btn-primary').prop('disabled', false);
                        if (g_is_update === true) {
                            alert('Warehousing (direct) updated successfully.');   
                            $('#modalTemplate').modal('hide');
                        } else {
                            alert('New Warehousing (direct) saved successfully.'); 
                        }
                        
                        clearEntries();
                        displayRecords('');
                    } else {
                        $('.btn-primary').prop('disabled', false);
                        showProcessMessage("");
                        alert(Messages.ErrorOccurred);
                    }
                }
            });
        }
    }
}

// Validates all the required fields.
// Returns true or false.
function validEntries() {
    var isValid = true;
    $('input:text.required').each(function() {
        if ($.trim($(this).val()) === '') {
            isValid = false;
            $(this).addClass('required-color');
        }
        else {
            $(this).removeClass('required-color');
        }
    });
    $('select.required').each(function() {
        if ($.trim($(this).val()) === '' || $.trim($(this).val()) === '0') {
            isValid = false;
            $(this).addClass('required-color');
        }
        else {
            $(this).removeClass('required-color');
        }
    });
    
    if (isValid === false) 
        return false;
    else 
        return true;
}

function validRequiredNumbers() {
    var isValid = true;
    $('input:text.required-number').each(function() {
        var val = $.trim($(this).val());
        val = val.replace(/,/g , "");
        if (isNumeric(val) === false) {
            isValid = false;
            $(this).addClass('required-color');
        } else {
            $(this).removeClass('required-color');
        }
    });
    
    if (isValid === false) 
        return false;
    else 
        return true;
}

function validNumbers() {
    var isValid = true;
    $('input:text.number').each(function() {
        if ($.trim($(this).val()) !== '') {
            if (isNumeric($.trim($(this).val())) === false) {
                isValid = false;
                $(this).addClass('required-color');
            } else {
                $(this).removeClass('required-color');
            }
        } else {
            $(this).removeClass('required-color');
        }
    });
    
    if (isValid === false) 
        return false;
    else 
        return true;
}

function isNumeric(n) {
    n = n.replace(/,/g , "");
    return !isNaN(parseFloat(n)) && isFinite(n);
}


function clearEntries() {
    $('input[type=text]').val('');
    $('select').val('');
    $('input:text.required').each(function() {
        $(this).removeClass('required-color');
    });
    $('select.required').each(function() {
            $(this).removeClass('required-color');
    });
}   

// Shows a confirmation message before clearing the input items.
function ClearItems(obj) {
    var result = confirm("This will clear your entries. Continue?");
    if (result) {
        clearEntries();
    }
} 

// Cancel the entries.
function Cancel() {
    var result = confirm(Messages.CancelContinue);
    if (result) {
        clearEntries();
        $('#modalTemplate').modal('hide');
    }
}

// Closes the window for viewing the warehousing direct.
function CloseView() {
    $('#modalViewWarehousingDirect').modal('hide');
}

function showProcessMessage(msg) {
    $("#modalTemplate #process-message").html(msg);
}

// View the warehousing direct.
function viewWarehousingDirect(warehousing_detail_id) {
    $("#modalViewWarehousingDirect .modal-title").text("Warehousing (Direct)");
    $('#modalViewWarehousingDirect').modal({ show: true, keyboard: false, backdrop: 'static' });
    
    $.get(execURL + "warehousing_direct_sel @warehousing_detail_id=" + warehousing_detail_id 
    , function(data){
        if (data.rows !== null) {
            $("#tblViewWarehousingDirect #material_item_full_name").html(data.rows[0].material_item_full_name);
            $("#tblViewWarehousingDirect #unit_of_measure_name").html(data.rows[0].unit_of_measure_name);
            $("#tblViewWarehousingDirect #quantity").html(data.rows[0].quantity);
            $("#tblViewWarehousingDirect #warehouse_name").html(data.rows[0].warehouse_name);
            $("#tblViewWarehousingDirect #rack_name").html(data.rows[0].warehouse_rack_name);
            $("#tblViewWarehousingDirect #tag_no").html(data.rows[0].tag_no);
            $("#tblViewWarehousingDirect #expiration_date").html(data.rows[0].expiration_date.split(' ')[0]);
            $("#tblViewWarehousingDirect #last_updated_by_name").html(data.rows[0].last_updated_by_name);
            $("#tblViewWarehousingDirect #last_updated_by_date").html(data.rows[0].last_updated_by_date);
        }
    });
}

// Get the information of an item.
// Param: material_id. The material id.
// Param: callback. The callback function that will be called after.
function getItemInfo(material_id, callback) {
    $.get(execURL + "material_sel @material_id=" + material_id, function(d) {
        if (d.rows !== null) {
            Material.UnitOfMeasureId = d.rows[0].unit_of_measure_id;
            Material.UnitOfMeasureName = d.rows[0].unit_of_measure_name;
        }
        
        if (callback) callback();
    });
}

    