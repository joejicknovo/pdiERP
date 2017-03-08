var bs = zsi.bs.ctrl;
var svn =  zsi.setValIfNull;
var g_new_document_transmittal_no;
var g_document_code;
var g_is_update = false;
//var default_document_code = 'FM-BDM-08';

// Create an itinerary object.
var DocumentTransmittal = {
    DocumentTransmittal_no:'',
    DocumentCode: '',
    RevisionNo: '',
    EffectiveDate: '',
    AddressToId: '',
    DepartmentId: '',
    ClientId: '',
    ClientName: '',
    ProjectId: ''
    
};

// Document ready.
zsi.ready(function(){
   displayRecords('');
   getTemplates();
});

// Initialize the lead object.
function initDocumentTransmittal() {
    DocumentTransmittal.DocumentTransmittal_no = '';
    DocumentTransmittal.DocumentCode = '';
    DocumentTransmittal.RevisionNo = '';
    DocumentTransmittal.EffectiveDate = '';
    DocumentTransmittal.AddressToId = '';
    DocumentTransmittal.DepartmentId = '';
    DocumentTransmittal.ClientId = '';
    DocumentTransmittal.ClientName = '';
    DocumentTransmittal.ProjectId = '';
}

// -------------- Window Objects --------------------------------------------------------- //

// Initialize a modal window object for entering new document transmital.
var  contextNewDocumentTransmittal = {
    id: "modalDocumentTransmittal"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItemsDocumentTransmittal();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="Cancel();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Cancel</button>'
            + '<button type="button" onclick="ClearItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblDocumentTransmittal" class="col-xs-12">'+
                        '<div class="col-xs-12 header-container"><label>Document Transmital Information</label> </div>'+
                        '<input type="hidden" name="document_transmittal_id" id="document_transmittal_id" class="form-control input-sm" >' +
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Reference Code:</label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="document_transmittal_no" id="document_transmittal_no" class="form-control input-sm" readonly>'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Document Code:</label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="document_code" id="document_code" class="form-control input-sm required">'+
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Revision No.:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="revision_no" id="revision_no" class="form-control input-sm required">'+
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Effective Date:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="effective_date" id="effective_date" class="form-control input-sm required">' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">To:</label>'+ 
                            '<div class="col-xs-2">'+
                                '<select name="address_to_id" id="address_to_id" class="form-control input-sm required">'+
			                       '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+	
                        '</div>'+    
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Deparment:</label>'+ 
                            '<div class="col-xs-4">'+
                                '<select name="department_id" id="department_id" class="form-control input-sm required">'+
									'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Client Name:</label>'+ 
                            '<div class="col-xs-4">'+
                                '<select name="client_id" id="client_id" class="form-control input-sm required">'+
									'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Project Name:</label>'+ 
                            '<div class="col-xs-4">'+
                                '<select name="project_id" id="project_id" class="form-control input-sm required">'+
									'<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            
                        '</div>'+
                        
                    '</div>'+
                '</div>'+
            '</div>'
};
var  contextNewDocumentTransmittalDetails = {
    id: "modalDocumentTransmittalDetails"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItemsDocumentTransmittalDetails();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="CancelDetails();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Cancel</button>'
            + '<button type="button" onclick="ClearDetails(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblDocumentTransmittalDetails" class="col-xs-12">'+
                        '<div id="DocumentTransmittalDetailGrid" class="zGrid">&nbsp;</div>' +
                    '</div>' +
                '</div>'+
            '</div>'
};

// Initialize a modal window object for viewing the document transmital.
var  contextViewDocumentTransmittal = {
    id: "modalviewDocumentTransmittal"
    , title: ""
    , sizeAttr: "modal-lg x-modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="CloseviewDocumentTransmittal();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Close</button>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblViewDocumentTransmittal"class="col-xs-12">'+
                        '<div class="col-xs-12 header-container"><label>Document Transmital Information</label> </div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Reference Code:</label>' +
                            '<label class="col-xs-3 control-label label-display" id="document_transmittal_no" name="document_transmittal_no">&nbsp;</label>' +                            
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Document Code:</label>' +
                            '<label class="col-xs-3 control-label label-display" id="document_code" name="document_code">&nbsp;</label>' +							
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Effective Date:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="effective_date" name="effective_date">&nbsp;</label>' +								 
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">To:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="address_to" name="address_to">&nbsp;</label>' +								
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Deparment:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="department_name" name="department_name">&nbsp;</label>' +                             
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Client Name:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="client_name" name="client_name">&nbsp;</label>' +   
                           
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Project Name:</label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="project_name" name="project_name">&nbsp;</label>' +
                         
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
    $("#modalDocumentTransmittal .modal-title").text("Add New Document Transmittal");
    $('#modalDocumentTransmittal').modal({ show: true, keyboard: false, backdrop: 'static' });
    clearEntries();
    zsi.initDatePicker();
    //$("#tblDocumentTransmittal #document_code").val(default_document_code);
    loadAddressTo();
    loadDepartments();
    loadClients();
    loadProjects();
    getNewDocumentTransmittalNumber();
});

function getNewDocumentTransmittalNumber() {
    $.get(execURL  + "SELECT dbo.getNewDocumentTransmittalNumber() AS document_transmittal_no", function(data) {
        if (data.rows !== null) {
            g_new_document_transmittal_no = data.rows[0].document_transmittal_no;
            $("#tblDocumentTransmittal #document_transmittal_no").val(g_new_document_transmittal_no);
        }
    });
}

// Cancel button event click.
// Cancel the entries.
function Cancel() {
    var result = confirm(Messages.CancelContinue);
    if (result) {
        clearEntries();
        $('#modalDocumentTransmittal').modal('hide');
    }
}

// Cancel button event click.
// Cancel the entries.
function CancelDetails() {
    var result = confirm(Messages.CancelContinue);
    if (result) {
        clearEntries();
        $('#modalDocumentTransmittalDetails').modal('hide');
    }
}

// Submit button click event.
// Submit the form for saving Itinerary.
function SubmitItemsDocumentTransmittal(){
    var isValid = validEntries();
    if (isValid === false) {
        alert(Messages.MarkedFieldsRequired);
        return false;
    } else {
        var result = confirm(Messages.AllEntriesCorrectContinue);
        if (result) {
            $('.btn-primary').prop('disabled', true);
            showProcessMessage(Messages.Saving);
            $("#tblDocumentTransmittal").jsonSubmit({
                procedure: "document_transmittal_upd"
                , onComplete: function (data) {
                    if (data.isSuccess === true) {
                        showProcessMessage("");
                        $('.btn-primary').prop('disabled', false);
                        if (g_is_update === true) {
                            alert('Document transmittal updated successfully.');    
                            $("#modalDocumentTransmittal").modal('hide');
                        } else {
                            alert('New Document transmittal saved successfully.');   
                        }
                        
                        initDocumentTransmittal();
                        clearEntries();
                        getNewDocumentTransmittalNumber();
                        //$("#tblDocumentTransmittal #document_code").val(default_document_code);
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

// Submit button click event.
// Submit the form for saving documemt transmittal details.
function SubmitItemsDocumentTransmittalDetails(){
    if(zsi.form.checkMandatory() !== true) return false;
    var isValid = validDetails();
    if (isValid === false) {
        alert("Please add at least one document transmittal detail.");
        return false;
    } else {
        var result = confirm(Messages.AllEntriesCorrectContinue);
        if (result) {
            $('.btn-primary').prop('disabled', true);
            showProcessMessage(Messages.Saving);
            $("#tblDocumentTransmittalDetails").jsonSubmit({
                procedure: "document_transmittal_detail_upd"
                , optionalItems: ["document_transmittal_id"]
                , onComplete: function (data) {
                    if (data.isSuccess === true) {
                        showProcessMessage("");
                        $('.btn-primary').prop('disabled', false);
                        alert('Document transmital details saved successfully.');   
                        $("#modalDocumentTransmittalDetails").modal('hide');
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

// Closes the window for viewing the documemt transmittal.
function CloseviewDocumentTransmittal() {
    $('#modalViewDocumentTransmittal').modal('hide');
}

// Clear button click event.
// Shows a confirmation message before clearing the input items.
function ClearItems() {
    var result = confirm(Messages.ClearEntriesContinue);
    if (result) {
        clearEntries();
    }
} 

// Clear button click event.
// Shows a confirmation message before clearing the input items.
function ClearDetails() {
    var result = confirm(Messages.ClearEntriesContinue);
    if (result) {
        clearEntries();
    }
} 

// Search button click event.
$("#btnSearch").click(function () {
    var search_text = $.trim($("#search_filter").val());
    if (search_text !== '') {
        displayRecords(search_text);
    }
});
// -------------- Button Events --------------------------------------------------------- //

// -------------- Function / Methods --------------------------------------------------------- //

// Get the template which is for modal window.
function getTemplates(){
    $.get(base_url + "templates/bsDialogBox.txt", function(d) {
        var template = Handlebars.compile(d);
        $("body").append(template(contextNewDocumentTransmittal));
        $("body").append(template(contextNewDocumentTransmittalDetails));
        $("body").append(template(contextViewDocumentTransmittal));
    });    
}

// Load the address to
function loadAddressTo(callback) {
    var select = $("#tblDocumentTransmittal #address_to_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/department"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}
// Load the departments
function loadDepartments(callback) {
    var select = $("#tblDocumentTransmittal #department_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/department"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}
// Load the clients
function loadClients(callback) {
    var select = $("#tblDocumentTransmittal #client_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/client_name_options"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}
// Load the projects
function loadProjects(callback) {
    var select = $("#tblDocumentTransmittal #project_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/project"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}


// Display the records in the main grid.
function displayRecords(search_param){   
    $("#grid").dataBind({
        url: procURL + "document_transmittal_sel @search_param='" +search_param+ "'" 
        , width: $(document).width() - 30
        , height: $(document).height() - 350
        , blankRowsLimit: 0
        , isPaging: true
        , dataRows: [
            { 
                text: "Edit"      
                , width: 50     
                , style: "text-align:center;" 
                , onRender: function(d) { 
                    return "<a href='javascript:void(0);'onclick='showModalUpdate(\""
                            + svn(d, "document_transmittal_id") + "\",\"" + svn(d, "document_code") + "\");'><span class='glyphicon glyphicon-edit' style='font-size:12pt;'></span></a>"; 
                }
            }
            ,{
                text: "Reference No."                  
                , name: "document_transmittal_no"        
                , width: 150        
                , style: "text-align:left;"       
    		    , onRender:  function(d) { 
    		        return "<a href='javascript:void(0);'onclick='viewDocumentTransmittal(\""
    		        + svn(d,"document_transmittal_id") + "\");' class='link-button'>" 
    		        + svn(d,"document_transmittal_no") + " </a>";
                }
            }	 
            ,{
                text: "To"
                , name: "address_to"        
                , width: 200
                , style: "text-align:left;"       
                
             }   
            ,{
                text: "Department"
                , name: "department_name"       
                , width: 200       
                , style: "text-align:left;"
            }
            ,{
    		    text: "Client"
    		    , name: "client_name"       
    		    , width: 250
    		    , style: "text-align:left;"
    		    
    		}
    		,{
    		    text: "Project"
    		    , name: "project_name"       
    		    , width: 200
    		    , style: "text-align:left;"
    		    
    		}
    		,{
    		    text: "Date"
    		    , name: "prepared_date"       
    		    , width: 180
    		    , style: "text-align:left;"
    		    
    		}
            ,{
                text: "Details"
                , name: "countDetails"       
                , width: 80       
                , style: "text-align:center;"
                , onRender: function(d) { 
                    return "<a href='javascript:void(0);'onclick='manageDocumentTransmittalDetails(\""
    		        + svn(d,"document_transmittal_id") + "\");' class='link-button'>" 
    		        + svn(d,"countDetails") + " </a>";
    		        
    		      
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
// To show modal Document Transmital details.
function manageDocumentTransmittalDetails(document_transmittal_id){
    $("#DocumentTransmittalDetailGrid .modal-title").text("Update Document Transmital Details");
    $("#modalDocumentTransmittalDetails").modal({ show: true, keyboard: false, backdrop: 'static' });
    displayDocumentTransmittalDetails(document_transmittal_id);
}

// Display the Document Transmital details.
function displayDocumentTransmittalDetails(document_transmittal_id, callback){
    $("#DocumentTransmittalDetailGrid").dataBind({
         url: procURL + "document_transmittal_detail_sel @document_transmittal_id=" + document_transmittal_id
         ,width: 800
        //,height: 120
        ,blankRowsLimit: 5
        ,isPaging : false
        ,dataRows : [
            {
                text: ""   
                , width: 25
                , style : "text-align:left;"
                , onRender:  function(d) { 
                    return bs({name: "document_transmittal_detail_id", type: "hidden", value: svn(d,"document_transmittal_detail_id")})
                    + bs({name: "document_transmittal_id", type: "hidden", value: document_transmittal_id});
                }
            }   
            ,{  
                text: "Item"             
                , name: "item"            
                , type  : "input"      
                , width: 300      
                , style: "text-align:left;" 
            }
            ,{  
                text: "Particulars"        
                , name: "particulars"     
                , type  : "input"      
                , width: 250    
                , style: "text-align:left;" 
            }
            ,{  
                text: "No. of Copies" 
                , name: "no_of_copies"    
                , type  : "input" 
                , width: 150      
                , style: "text-align:left;" 
            }
           
        ]
        , onComplete:function() {
          
            markEntryMandatory();
        }
    });
}

// Mark the mandatory textboxes.
function markEntryMandatory(){
    zsi.form.markMandatory({       
        "groupNames":[
            {
                "names" : [
                    "item"
                    , "particulars"
                    , "no_of_copies"
                    
                ]
                , "type": "M"
            }             
        ]      
        , "groupTitles":[ 
            {
                "titles" : [
                    "Item"
                    , "Particulars"
                    , "No. of Copies"
                    
                ]
            }
        ]
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

// Validates the details fields.
// Returns true or false.
function validDetails() {
    var isValid = true;
    var zRowCount = 0;
    var count = 0;
    $("#DocumentTransmittalDetailGrid .right .zRow").each(function() {
        zRowCount++;
    });
    
    $("#DocumentTransmittalDetailGrid select#day_id").each(function() {
        if ($.trim($(this).val()) === '' || $.trim($(this).val()) === '0') {
            count++;
        }
    });
    
    if (zRowCount === count) isValid = false;
    
    if (isValid === false) 
        return false;
    else 
        return true;
}

// Show the process message.
function showProcessMessage(msg) {
    $("#modalDocumentTransmittal #process-message").html(msg);
}

// Show the modal window for update.
function showModalUpdate(document_transmittal_id, document_transmmittal_no) {
    g_is_update = true;
    clearEntries();
    $("#modalDocumentTransmittal .modal-title").text("Document Transmittal Update");
    $("#modalDocumentTransmittal").modal({ show: true, keyboard: false, backdrop: 'static' });
    $("#tblDocumentTransmittal #document_transmittal_id").val(document_transmittal_id);
    zsi.initDatePicker();
    
    loadAddressTo(function (){
       loadDepartments(function () {
           loadClients(function () {
               loadProjects(function () {
                    $.get(execURL + "document_transmittal_sel @document_transmittal_id=" + document_transmittal_id, function(data){
                        if (data.rows !== null) {
                            DocumentTransmittal.DocumentTransmittal_no = data.rows[0].document_transmittal_no;
                            DocumentTransmittal.DocumentCode = data.rows[0].document_code;
                            DocumentTransmittal.RevisionNo = data.rows[0].revision_no;
                            DocumentTransmittal.EffectiveDate = data.rows[0].effective_date.split(' ')[0];
                            DocumentTransmittal.AddressToId = data.rows[0].address_to_id;
                            DocumentTransmittal.DepartmentId = data.rows[0].department_id;
                            DocumentTransmittal.ClientID = data.rows[0].client_id;
                            DocumentTransmittal.ProjectId = data.rows[0].project_id;
                           
                            
                            $("#tblDocumentTransmittal #document_transmittal_no").val(DocumentTransmittal.DocumentTransmittal_no);
                            $("#tblDocumentTransmittal #document_code").val(DocumentTransmittal.DocumentCode);
                            $("#tblDocumentTransmittal #revision_no").val(DocumentTransmittal.RevisionNo);
                            $("#tblDocumentTransmittal #effective_date").val(DocumentTransmittal.EffectiveDate);
                            $("#tblDocumentTransmittal #address_to_id").val(DocumentTransmittal.AddressToId);
                            $("#tblDocumentTransmittal #department_id").val(DocumentTransmittal.DepartmentId);
                            $("#tblDocumentTransmittal #client_id").val(DocumentTransmittal.ClientId);
                            $("#tblDocumentTransmittal #project_id").val(DocumentTransmittal.ProjectId);
                           
                            
                          
                        }
                    });
                });    
           });   
       });
    });
}

// Clear all the textboxes and set the selected value of the dropdownlists to none.
function clearEntries() {
    $("#tblDocumentTransmittal input[type=text]").val('');
    $("#tblDocumentTransmittal input[type=hidden]").val('');
    $("#tblDocumentTransmittal select").val('');
    $("#tblDocumentTransmittalDetails input[type=text]").val('');
    $("#tblDocumentTransmittalDetails input[type=hidden]").val('');
    $("#tblDocumentTransmittalDetails select").val('');
    
    $('input:text.required').each(function() {
        $(this).removeClass('required-color');
    });
    $('select.required').each(function() {
            $(this).removeClass('required-color');
    });
}    


function viewDocumentTransmittal(document_transmittal_id){
    $("#modalviewDocumentTransmittal .modal-title").text("Document Transmittal");
    $("#modalviewDocumentTransmittal").modal({ show: true, keyboard: false, backdrop: 'static' });
    
    $.get(execURL + "document_transmittal_sel @document_transmittal_id=" + document_transmittal_id 
    , function(data){
		if (data.rows !== null) {
       // if (data.rows.length > 0) {
				DocumentTransmittal.DocumentTransmittal_no = data.rows[0].document_transmittal_no;
				DocumentTransmittal.DocumentCode = data.rows[0].document_code;
				DocumentTransmittal.RevisionNo = data.rows[0].revision_no;
				DocumentTransmittal.EffectiveDate = data.rows[0].effective_date.split(' ')[0];
				DocumentTransmittal.AddressToId = data.rows[0].address_to;
				DocumentTransmittal.DepartmentId = data.rows[0].department_name;
				DocumentTransmittal.ClientID = data.rows[0].client_id;
				DocumentTransmittal.ClientName = data.rows[0].client_name;
				DocumentTransmittal.ProjectId = data.rows[0].project_name;

				$("#tblViewDocumentTransmittal #document_transmittal_no").text(DocumentTransmittal.DocumentTransmittal_no);
				$("#tblViewDocumentTransmittal #document_code").text(DocumentTransmittal.DocumentCode);
				$("#tblViewDocumentTransmittal #revision_no").text(DocumentTransmittal.RevisionNo);
				$("#tblViewDocumentTransmittal #effective_date").text(DocumentTransmittal.EffectiveDate);
				$("#tblViewDocumentTransmittal #address_to").text(DocumentTransmittal.AddressToId);
				$("#tblViewDocumentTransmittal #department_name").text(DocumentTransmittal.DepartmentId);
				$("#tblViewDocumentTransmittal #client_name").text(DocumentTransmittal.ClientName);
				$("#tblViewDocumentTransmittal #project_name").text(DocumentTransmittal.ProjectId);
		
            console.log(DocumentTransmittal.ClientId);
        }
    });
}
    