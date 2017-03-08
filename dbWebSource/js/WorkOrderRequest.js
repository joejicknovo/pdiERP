var bs = zsi.bs.ctrl;
var svn =  zsi.setValIfNull;
var g_new_document_code;
var g_is_update = false;

// Create a client handling object.
var WorkOrderRequest = {
    DocumentCode: '',
    RevisionNo: '',
    EffectiveDate: '',
    WORDate: '',
    WORTo: '',
    DepartmentId: '',
    DepartmentName: '',
    ProjectId: '',
    ProjectName: '',
    CustomerId: '',
    CustomerName: '',
    TypeOfWorkId: '',
    TypeOfWorkName: '',
    Others: '',
    DescriptionOfWork: '',
    Remarks: '',
    StatusId: '',
    StatusName: '',
    RequestedById: '',
    RequestedByName: '',
    RequestedDate: '',
    ReceivedById: '',
    ReceivedByName: '',
    ReceivedDate: ''
    
};

// Document ready.
zsi.ready(function(){
   displayRecords('');
   getTemplates();
});

// Initialize the client handling object.
function initWorkOrderRequest() {
    WorkOrderRequest.DocumentCode           = '';
    WorkOrderRequest.RevisionNo             = '';
    WorkOrderRequest.EffectiveDate          = '';
    WorkOrderRequest.WORDate                = '';
    WorkOrderRequest.WORTo                  = '';
    WorkOrderRequest.DepartmentId           = '';
    WorkOrderRequest.DepartmentName         = '';
    WorkOrderRequest.ProjectId              = '';
    WorkOrderRequest.ProjectName            = '';
    WorkOrderRequest.CustomerId             = '';
    WorkOrderRequest.CustomerName           = '';
    WorkOrderRequest.TypeOfWorkId           = '';
    WorkOrderRequest.TypeOfWorkName         = '';
    WorkOrderRequest.Others                 = '';
    WorkOrderRequest.DescriptionOfWork      = '';
    WorkOrderRequest.Remarks                = '';
    WorkOrderRequest.StatusId               = '';
    WorkOrderRequest.StatusName             = '';
    WorkOrderRequest.RequestedById          = '';
    WorkOrderRequest.RequestedByName        = '';
    WorkOrderRequest.RequestedDate          = '';
    WorkOrderRequest.ReceivedById           = '';
    WorkOrderRequest.ReceivedByName         = '';
    WorkOrderRequest.ReceivedDate           = '';
}

// -------------- Window Objects --------------------------------------------------------- //

// Initialize a modal window object for entering new client handling record.
var  contextNewWorkOrderRequest = {
    id: "modalWorkOrderRequest"
    , title: ""
    , sizeAttr: "modal-lg x-modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItems();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="Cancel();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Cancel</button>'
            + '<button type="button" onclick="ClearItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblWorkOrderRequest"class="col-xs-12">'+
                        '<div class="col-xs-12 header-container"><label>Work Order Request</label> </div>'+
                        '<input type="hidden" name="work_order_request_id" id="work_order_request_id" class="form-control input-sm">' +
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Date:</label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="work_order_request_date" id="work_order_request_date" class="form-control input-sm required">'+
                            '</div>'+
							'<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                            '<label class="col-xs-3 control-label">Document Code:</label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="document_code" id="document_code" class="form-control input-sm">'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">To:</label>' +
                            '<div class="col-xs-3">'+
                                '<input type="text" name="work_order_request_to" id="work_order_request_to" class="form-control input-sm required">'+
                            '</div>'+
							'<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
							'<label class="col-xs-2 control-label">Revision No.:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="revision_no" id="revision_no" class="form-control input-sm">'+                                
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
							'<label class="col-xs-2 control-label">Department:</label>' +
                            '<div class="col-xs-3">'+
                                '<select name="department_id" id="department_id" class="form-control input-sm required">'+
									'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                            '<label class="col-xs-2 control-label">Effective Date:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="effective_date" id="effective_date" class="form-control input-sm required">'+                                
                            '</div>'+	
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Project Name:</label>'+ 
                            '<div class="col-xs-3">'+
                                '<select name="project_id" id="project_id" class="form-control input-sm required">' +
								   '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-2 control-label">Description of Work:</label>' +
                            '<div class="col-xs-3">'+
								'<textarea name="description_of_work" id="description_of_work" cols="50" rows="1" class= "form-control input-sm" ></textarea>'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Customer:</label>'+ 
                            '<div class="col-xs-3">'+
                                '<select name="client_id" id="client_id" class="form-control input-sm required">'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
							'<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-2 control-label">Remarks:</label>'+ 
                            '<div class="col-xs-3">'+
								'<textarea name="remarks" id="remarks" cols="50" rows="1" class= "form-control input-sm" > </textarea>'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Type of Work:</label>'+ 
                            '<div class="col-xs-3">'+
                                '<select name="type_of_work_id" id="type_of_work_id" class="form-control input-sm required">'+                                  
                                	'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+          
							'<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                            '<label class="col-xs-2 control-label">Status:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<select type="text" name="status_id" id="status_id" class="form-control input-sm required">'+
			                       '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Others:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="others" id="others" class="form-control input-sm" readonly>'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Requested By:</label>'+ 
                            '<div class="col-xs-3">'+
                                '<select name="requested_by" id="requested_by" class="form-control input-sm">'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<label class="col-xs-3 control-label">Requested Date:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="requested_date" id="requested_date" class="form-control input-sm">'+
                            '</div>'+
                        '</div>'+
						'<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Received By:</label>'+ 
                            '<div class="col-xs-3">'+
                                '<select name="received_by" id="received_by" class="form-control input-sm">'+
									'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<label class="col-xs-3 control-label">Received Date:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="received_date" id="received_date" class="form-control input-sm">'+
                            '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'
};

// Initialize a modal window object for viewing the warehouse release details.
var  contextViewWorkOrderRequest = {
    id: "modalViewWorkOrderRequest"
    , title: ""
    , sizeAttr: "modal-lg x-modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="closeView();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Close</button>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblViewWorkOrderRequest" class="col-xs-12">'+
                        '<div class="col-xs-12 header-container"><label>Work Order Request</label></div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Date:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="work_order_request_date" id="work_order_request_date"></label>'+
                            '<label class="col-xs-3 control-label">Document Code:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="document_code" id="document_code"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">To:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="work_order_request_to" id="work_order_request_to"></label>'+
                            '<label class="col-xs-3 control-label">Revision No.:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="revision_no" id="revision_no"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
							'<label class="col-xs-2 control-label">Department:</label>' +
							'<label class="col-xs-3 control-label label-display" name="department_name" id="department_name"></label>'+
                            '<label class="col-xs-3 control-label">Effective Date:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="effective_date" id="effective_date"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Project Name:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" name="project_name" id="project_name"></label>'+
                            '<label class="col-xs-3 control-label">Description of Work:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="description_of_work" id="description_of_work"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Customer:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" name="client_name" id="client_name"></label>'+
                            '<label class="col-xs-3 control-label">Remarks:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="remarks" id="remarks"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Type of Work:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" name="type_of_work_name" id="type_of_work_name"></label>'+
                            '<label class="col-xs-3 control-label">Status:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="status_name" id="status_name"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Others:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" name="others" id="others"></label>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Requested By:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="requested_by_name" id="requested_by_name"></label>'+
                            '<label class="col-xs-3 control-label">Requested Date:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="requested_date" id="requested_date"></label>'+
                        '</div>'+
						'<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Received By:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" name="received_by_name" id="received_by_name"></label>'+
                            '<label class="col-xs-3 control-label">Received Date:</label>' +
                            '<label class="col-xs-3 control-label label-display" name="received_date" id="received_date"></label>'+
                        '</div>'+
                    '</div>'+
                '</div>'+
            '</div>'
};

// -------------- Window Objects --------------------------------------------------------- //

// -------------- Button Events --------------------------------------------------------- //

// New button click event.            
$("#btnNew").click(function () {
    g_is_update = false;
    $("#modalWorkOrderRequest .modal-title").text("Add New Work Order Request");
    $('#modalWorkOrderRequest').modal({ show: true, keyboard: false, backdrop: 'static' });
    clearEntries();
    zsi.initDatePicker();
    loadClients();
    loadProjects();
    loadDepartment();
    loadTypeOfWork();
    loadStatus();
    loadReceivedBy();
    loadRequestedBy();
    
    setTypeOfWorkChangeEvent();
});

// Cancel the entries.
function Cancel() {
    var result = confirm(Messages.CancelContinue);
    if (result) {
        clearEntries();
        $('#modalWorkOrderRequest').modal('hide');
    }
}

// Shows a confirmation message before clearing the input items.
function ClearItems() {
    var result = confirm(Messages.ClearEntriesContinue);
    if (result) {
        clearEntries();
    }
} 

// Submit the form for saving.
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
            $("#tblWorkOrderRequest").jsonSubmit({
                procedure: "work_order_request_upd"
                //, notInclude: ""
                , onComplete: function (data) {
                    if (data.isSuccess === true) {
                        showProcessMessage("");
                        $('.btn-primary').prop('disabled', false);
                        if (g_is_update === true) {
                            alert('Work order request updated successfully.');    
                            $("#modalWorkOrderRequest").modal('hide');
                        } else {
                            alert('New work order request saved successfully.');   
                        }
                        
                        initWorkOrderRequest();
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

// Show the modal window for update.
function showModalUpdate(work_order_request_id) {
    g_is_update = true;
    clearEntries();
    $("#modalWorkOrderRequest .modal-title").text("Work Order Request Update");
    $("#modalWorkOrderRequest").modal({ show: true, keyboard: false, backdrop: 'static' });
    $("#tblWorkOrderRequest #work_order_request_id").val(work_order_request_id);

    loadClients(function() {
        loadProjects(function() {
            loadDepartment(function() {
                loadTypeOfWork(function() {
                    loadStatus(function() {
                        loadRequestedBy(function() {
                            loadReceivedBy(function() {
                                $.get(execURL + "work_order_request_sel @work_order_request_id=" + work_order_request_id 
                                , function(data){
                                    if (data.rows !== null) {
                                        WorkOrderRequest.DocumentCode       = data.rows[0].document_code;
                                        WorkOrderRequest.RevisionNo         = data.rows[0].revision_no;
                                        WorkOrderRequest.EffectiveDate      = data.rows[0].effective_date.split(' ')[0];
                                        WorkOrderRequest.WORDate            = data.rows[0].work_order_request_date.split(' ')[0];
                                        WorkOrderRequest.WORTo              = data.rows[0].work_order_request_to;
                                        WorkOrderRequest.DepartmentId       = data.rows[0].department_id;
                                        WorkOrderRequest.ProjectId          = data.rows[0].project_id;
                                        WorkOrderRequest.CustomerId         = data.rows[0].client_id;
                                        WorkOrderRequest.TypeOfWorkId       = data.rows[0].type_of_work_id;
                                        WorkOrderRequest.Others             = data.rows[0].others;
                                        WorkOrderRequest.DescriptionOfWork  = data.rows[0].description_of_work;
                                        WorkOrderRequest.Remarks            = data.rows[0].remarks;
                                        WorkOrderRequest.StatusId           = data.rows[0].status_id;
                                        WorkOrderRequest.RequestedById      = data.rows[0].requested_by;
                                        WorkOrderRequest.RequestedDate      = data.rows[0].requested_date.split(' ')[0];
                                        WorkOrderRequest.ReceivedById       = data.rows[0].received_by;
                                        WorkOrderRequest.ReceivedDate       = data.rows[0].received_date.split(' ')[0];
                                        
                                        
                                        $("#tblWorkOrderRequest #document_code").val(WorkOrderRequest.DocumentCode);
                                        $("#tblWorkOrderRequest #revision_no").val(WorkOrderRequest.RevisionNo);
                                        $("#tblWorkOrderRequest #effective_date").val(WorkOrderRequest.EffectiveDate);
                                        $("#tblWorkOrderRequest #work_order_request_date").val(WorkOrderRequest.WORDate);
                                        $("#tblWorkOrderRequest #work_order_request_to").val(WorkOrderRequest.WORTo);
                                        $("#tblWorkOrderRequest #department_id").val(WorkOrderRequest.DepartmentId);
                                        $("#tblWorkOrderRequest #project_id").val(WorkOrderRequest.ProjectId);
                                        $("#tblWorkOrderRequest #client_id").val(WorkOrderRequest.CustomerId);
                                        $("#tblWorkOrderRequest #type_of_work_id").val(WorkOrderRequest.TypeOfWorkId);
                                        $("#tblWorkOrderRequest #others").val(WorkOrderRequest.Others);
                                        $("#tblWorkOrderRequest #description_of_work").val(WorkOrderRequest.DescriptionOfWork);
                                        $("#tblWorkOrderRequest #remarks").val(WorkOrderRequest.Remarks);
                                        $("#tblWorkOrderRequest #status_id").val(WorkOrderRequest.StatusId);
                                        $("#tblWorkOrderRequest #requested_by").val(WorkOrderRequest.RequestedById);
                                        $("#tblWorkOrderRequest #requested_date").val(WorkOrderRequest.RequestedDate);
                                        $("#tblWorkOrderRequest #received_by").val(WorkOrderRequest.ReceivedById);
                                        $("#tblWorkOrderRequest #received_date").val(WorkOrderRequest.ReceivedDate);
                                        
                                        setTypeOfWorkChangeEvent();
                                        zsi.initDatePicker();
                                    }
                                });
                            });
                        });
                    });
                });
            });    
        });
    });
}

// Closes the window for viewing the client handling details.
function closeView() {
    $('#modalViewWorkOrderRequest').modal('hide');
}

// -------------- Button Events --------------------------------------------------------- //

// -------------- Function / Methods --------------------------------------------------------- //

// Get the template which is for modal window.
function getTemplates(){
    $.get(base_url + "templates/bsDialogBox.txt", function(d) {
        var template = Handlebars.compile(d);
        $("body").append(template(contextNewWorkOrderRequest));
        $("body").append(template(contextViewWorkOrderRequest));
    });    
}

function getNewDocumentCode() {
    // Get the new reference code.
    $.get(execURL  + "SELECT dbo.getNewDocumentCode() AS document_code", function(data) {
        if (data.rows !== null) {
            g_new_document_code = data.rows[0].document_code;
            $("#tblWorkOrderRequest #document_code").val(g_new_document_code);
        }
    });
}


// Display the records in the grid.
function displayRecords(search_param){   
    $("#grid").dataBind({
	    url: procURL + "work_order_request_sel @search_param='" + search_param + "'"  
	    , width: 1225
	    , height: $(document).height() - 250
        , blankRowsLimit: 0
        , isPaging: true
        , dataRows: [
             { 
                text: "Edit"      
                , width: 50     
                , style: "text-align:center;" 
                ,onRender: function(d) { 
                    return "<a href='javascript:void(0);'onclick='showModalUpdate(" + svn(d, "work_order_request_id") + ", \"" + 
                    svn(d, "document_code", 0) + "\");'><span class='glyphicon glyphicon-edit' style='font-size:12pt;'></span></a>"; 
                }
            }
			,{
                text: "Date"
                , name: "work_order_request_date"        
                , width: 100
                , style: "text-align:left;"       
    		    , onRender: function(d) {
    		         return "<a href='javascript:void(0);'onclick='viewWorkOrderRequest(\""
    		        + svn(d,"work_order_request_id") + "\");' class='link-button'>" 
    		        + svn(d,"work_order_request_date") + " </a>";
    		    }
             }	 
    		, {
                text: "Department"
                , name: "department_name"        
                , width: 200
                , style: "text-align:left;"       
    		    , onRender: function(d) { 
    		        return    svn (d,"department_name");
                }
            }	 
    		, {
    		    text: "Client Name"
    		    , name: "client_name"       
    		    , width: 250       
    		    , style: "text-align:left;"
    		    , onRender: function(d) { 
    		        return    svn (d,"client_name");
                }
    		}
    		, {
    		    text: "Project Name"
    		    , name: "project_name"       
    		    , width: 250       
    		    , style: "text-align:left;"
    		    , class: "test"
    		    , onRender: function(d) { 
    		        return    svn (d,"project_name");
                }
    		}
    		, {
    		    text: "Type of Work"
    		    , name: "type_of_work_name"       
    		    , width: 150
    		    , style: "text-align:left;"
    		    , onRender: function(d) { 
    		        return    svn (d,"type_of_work_name");
                }
    		}
			, {
    		    text: "Date Req'd"
    		    , name: "requested_date"       
    		    , width: 100
    		    , style: "text-align:left;"
    		    , onRender: function(d) { 
    		        return    svn (d,"requested_date");
                }
    		}
			, {
    		    text: "Status"
    		    , name: "status_name"       
    		    , width: 100
    		    , style: "text-align:left;"
    		    , onRender: function(d) { 
    		        return svn (d,"status_name");
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
        if ($.isNumeric($.trim($(this).val())) === false) {
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
            if ($.isNumeric($.trim($(this).val())) === false) {
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

// Show the process message.
function showProcessMessage(msg) {
    $("#modalWorkOrderRequest #process-message").html(msg);
}

// Clear all the textboxes and set the selected value of the dropdownlists to none.
function clearEntries() {
    $("#tblWorkOrderRequest input[type=text]").val('');
    $("#tblWorkOrderRequest input[type=hidden]").val('');
    $("#tblWorkOrderRequest select").val('');
    $('input:text.required').each(function() {
        $(this).removeClass('required-color');
    });
    $('select.required').each(function() {
            $(this).removeClass('required-color');
    });
}    
// Load the projects.
function loadProjects(callback) {
    var select = $("#tblWorkOrderRequest #project_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/project"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the clients.
function loadClients(callback) {
    var select = $("#tblWorkOrderRequest #client_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/client_name_options"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the department.
function loadDepartment(callback) {
    var select = $("#tblWorkOrderRequest #department_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/department"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}
// Load the type of works.
function loadTypeOfWork(callback) {
    var select = $("#tblWorkOrderRequest #type_of_work_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/wor_type_of_works"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the status.
function loadStatus(callback) {
    var select = $("#tblWorkOrderRequest #status_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/wor_status"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the received by.
function loadReceivedBy(callback) {
    var select = $("#tblWorkOrderRequest #received_by");
    $(select).dataBind({
        url: base_url + "selectoption/code/employee"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

function loadRequestedBy(callback) {
    var select = $("#tblWorkOrderRequest #requested_by");
    $(select).dataBind({
        url: base_url + "selectoption/code/employee"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Set the input elements into read only that are in a parent container.
function ReceivedBy(parent) {
    $(parent + ' input:text').each(function() {
        if ($(this).hasClass("edit-readonly") === false) {
            $(this).addClass("edit-readonly");
        }
    });
}

// On change event for the type of work select.
function setTypeOfWorkChangeEvent() {
    $("#tblWorkOrderRequest #type_of_work_id").change(function(){
        var text = $.trim($("option:selected", this).text().toUpperCase());
        if(text === "OTHERS") {
            $("#tblWorkOrderRequest #others").attr("readonly", false);
            $("#tblWorkOrderRequest #others").focus();
        } else {
            $("#tblWorkOrderRequest #others").val('');
            $("#tblWorkOrderRequest #others").attr("readonly", true);
        }
    });
}

// View the work order request.
function viewWorkOrderRequest(work_order_request_id) {
    $("#modalViewWorkOrderRequest .modal-title").text("Work Order Request");
    $("#modalViewWorkOrderRequest").modal({ show: true, keyboard: false, backdrop: 'static' });
    $.get(execURL + "work_order_request_sel @work_order_request_id=" + work_order_request_id, function(data) {
        if (data.rows !== null) {
            WorkOrderRequest.DocumentCode       = data.rows[0].document_code;
            WorkOrderRequest.RevisionNo         = data.rows[0].revision_no;
            WorkOrderRequest.EffectiveDate      = data.rows[0].effective_date.split(' ')[0];
            WorkOrderRequest.WORDate            = data.rows[0].work_order_request_date.split(' ')[0];
            WorkOrderRequest.WORTo              = data.rows[0].work_order_request_to;
            WorkOrderRequest.DepartmentName     = data.rows[0].department_name;
            WorkOrderRequest.ProjectName        = data.rows[0].project_name;
            WorkOrderRequest.CustomerName       = data.rows[0].client_name;
            WorkOrderRequest.TypeOfWorkName     = data.rows[0].type_of_work_name;
            WorkOrderRequest.Others             = data.rows[0].others;
            WorkOrderRequest.DescriptionOfWork  = data.rows[0].description_of_work;
            WorkOrderRequest.Remarks            = data.rows[0].remarks;
            WorkOrderRequest.StatusName         = data.rows[0].status_name;
            WorkOrderRequest.RequestedByName    = data.rows[0].requested_by_name;
            WorkOrderRequest.RequestedDate      = data.rows[0].requested_date.split(' ')[0];
            WorkOrderRequest.ReceivedByName     = data.rows[0].received_by_name;
            WorkOrderRequest.ReceivedDate       = data.rows[0].received_date.split(' ')[0];
            
            $("#tblViewWorkOrderRequest #document_code").html(WorkOrderRequest.DocumentCode);
            $("#tblViewWorkOrderRequest #revision_no").html(WorkOrderRequest.RevisionNo);
            $("#tblViewWorkOrderRequest #effective_date").html(WorkOrderRequest.EffectiveDate);
            $("#tblViewWorkOrderRequest #work_order_request_date").html(WorkOrderRequest.WORDate);
            $("#tblViewWorkOrderRequest #work_order_request_to").html(WorkOrderRequest.WORTo);
            $("#tblViewWorkOrderRequest #department_name").html(WorkOrderRequest.DepartmentName);
            $("#tblViewWorkOrderRequest #project_name").html(WorkOrderRequest.ProjectName);
            $("#tblViewWorkOrderRequest #client_name").html(WorkOrderRequest.CustomerName);
            $("#tblViewWorkOrderRequest #type_of_work_name").html(WorkOrderRequest.TypeOfWorkName);
            $("#tblViewWorkOrderRequest #others").html(WorkOrderRequest.Others);
            $("#tblViewWorkOrderRequest #description_of_work").html(WorkOrderRequest.DescriptionOfWork);
            $("#tblViewWorkOrderRequest #remarks").html(WorkOrderRequest.Remarks);
            $("#tblViewWorkOrderRequest #status_name").html(WorkOrderRequest.StatusName);
            $("#tblViewWorkOrderRequest #requested_by_name").html(WorkOrderRequest.RequestedByName);
            $("#tblViewWorkOrderRequest #requested_date").html(WorkOrderRequest.RequestedDate);
            $("#tblViewWorkOrderRequest #received_by_name").html(WorkOrderRequest.ReceivedByName);
            $("#tblViewWorkOrderRequest #received_date").html(WorkOrderRequest.ReceivedDate);
        }
    });
}


  