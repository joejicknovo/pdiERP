var bs = zsi.bs.ctrl;
var svn =  zsi.setValIfNull;
var g_new_bid_code;
var g_is_update = false;
var g_is_init = false;

// Create a bid object.
var Bid = {
    Code: '',
    Date: '',
    TypeId: '',
    Type: '',
    PreparedById: '',
    PreparedByName: '',
    ParticularId: '',
    ParticularName: '',
    ProjectTypeId: '',
    ProjectTypeName: '',
    TotalArea: '',
    DirectCost: '',
    ExtendedCost: '',
    SellingCost: '',
    SubmissionDate: '',
    Duration: '',
    ClientId: '',
    ClientName: '',
    Remark: '',
    StatusId: '',
    StatusName: '',
    PrebidDatetimeConference: '',
    PrebidVenueConference: '',
    SiteDatetimeInspection: '',
    SiteVenueInspection: '',
    SubmissionCourier: '',
    SubmissionEmail: '',
    SubmissionHardcopy: '',
    ValidityOfBid: '',
    BidDocumentAmount: ''
};

// Document ready.
zsi.ready(function(){
    displayRecords('');
    getTemplate();
});

// Initialize the bid object.
function initBid() {
    Bid.Code = '';
    Bid.Date = '';
    Bid.TypeId = '';
    Bid.Type = '';
    Bid.PreparedById = '';
    Bid.PreparedByName = '';
    Bid.ParticularId = '';
    Bid.ParticularName = '';
    Bid.ProjectTypeId = '';
    Bid.ProjectTypeName = '';
    Bid.TotalArea = '';
    Bid.DirectCost = '';
    Bid.ExtendedCost = '';
    Bid.SellingCost = '';
    Bid.SubmissionDate = '';
    Bid.Duration = '';
    Bid.ClientId = '';
    Bid.ClientName = '';
    Bid.Remark = '';
    Bid.StatusId = '';
    Bid.StatusName = '';
    Bid.PrebidDatetimeConference = '';
    Bid.PrebidVenueConference = '';
    Bid.SiteDatetimeInspection = '';
    Bid.SiteVenueInspection = '';
    Bid.SubmissionCourier = '';
    Bid.SubmissionEmail = '';
    Bid.SubmissionHardcopy = '';
    Bid.ValidityOfBid = '';
    Bid.BidDocumentAmount = '';
}

// -------------- Window Objects --------------------------------------------------------- //

// Initialize a modal window object for entering new bid.
var  contextNewBid = {
    id: "modalBid"
    , title: ""
    , sizeAttr: "modal-lg x-modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="SubmitItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk">'
            + '</span>&nbsp;Submit</button>'
            + '<button type="button" onclick="Cancel();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Cancel</button>'
            + '<button type="button" onclick="ClearItems(this);" class="btn btn-primary"><span class="glyphicon glyphicon-refresh">'
            + '</span>&nbsp;Clear</button>'
            + '<span id="process-message" class="message">&nbsp;</span>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblBid"class="col-xs-12">'+
                        '<div class="col-xs-12 header-container"><label>Bid Information </label> </div>'+
                        '<div class="form-group" >' +
                            '<input type="hidden" name="bid_id" id="bid_id" class="form-control input-sm" >' +
                            '<label class="col-xs-2 control-label">Bid No.: </label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="bid_code" id="bid_code" class="form-control input-sm" readonly>'+
                            '</div>'+
                            '<label class="col-xs-4 control-label">Direct Cost: </label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="direct_cost" id="direct_cost" class="form-control input-sm required required-number">'+
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Date: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="bid_date" id="bid_date" class="form-control input-sm required">'+
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-3 control-label">Extended Cost: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="extended_cost" id="extended_cost" class="form-control input-sm number">'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Bid Type: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<select type="text" name="bid_type_id" id="bid_type_id" class="form-control input-sm required">'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-2 control-label">Selling Cost: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="selling_cost" id="selling_cost" class="form-control input-sm number">'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Prepared By: </label>' +
                            '<div class="col-xs-3">'+
                                '<select type="text" name="prepared_by" id="prepared_by" class="form-control input-sm required" >'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +    
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-2 control-label">Submission Date: </label>' +
                            '<div class="col-xs-2">'+
                                '<input type="text" name="submission_date" id="submission_date" class="form-control input-sm ">'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Project Name: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<select type="text" name="project_id" id="project_id" class="form-control input-sm required">' +
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +   
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                            '<label class="col-xs-2 control-label">Project Type: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<select type="text" name="project_type_id" id="project_type_id" class="form-control input-sm required">'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Duration (days): </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="duration" id="duration" class="form-control input-sm integer">' +
                            '</div>'+
                            '<label class="col-xs-4 control-label">Client: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<select type="text" name="client_id" id="client_id" class="form-control input-sm required">'+
                                    '<option value="0">&nbsp;</option>' +
                                '</select>' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Prebid Conference Date/Time: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="prebid_datetime_conference" id="prebid_datetime_conference" class="form-control input-sm">' +
                            '</div>'+
                            '<label class="col-xs-4 control-label">Prebid Conference Venue: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="prebid_venue_conference" id="prebid_venue_conference" class="form-control input-sm">' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Site Inspection Date/Time: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="site_datetime_inspection" id="site_datetime_inspection" class="form-control input-sm">' +
                            '</div>'+
                            '<label class="col-xs-4 control-label">Site Inspection Venue: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="site_venue_inspection" id="site_venue_inspection" class="form-control input-sm">' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Submission Type Courier: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="submission_courier" id="submission_courier" class="form-control input-sm">' +
                            '</div>'+
                            '<label class="col-xs-3 control-label">Submission Type Email: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="submission_email" id="submission_email" class="form-control input-sm email-address">' +
                            '</div>'+
                            '<div class="col-xs-1">'+
                                '<span class="required-label">*</span>' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Submission Type Hardcopy: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="submission_hardcopy" id="submission_hardcopy" class="form-control input-sm">' +
                            '</div>'+
                            '<label class="col-xs-3 control-label">Validity of Bid: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="validity_of_bid" id="validity_of_bid" class="form-control input-sm date" placeholder="mm/dd/yyyy">' +
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Bid Document Amount: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<input type="text" name="bid_document_amount" id="bid_document_amount" class="form-control input-sm number">' +
                            '</div>'+
                            '<label class="col-xs-4 control-label">Remarks: </label>'+ 
                            '<div class="col-xs-3">'+
                                '<input type="text" name="remark" id="remark" class="form-control input-sm">'+
                            '</div>'+
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-2 control-label">Status: </label>'+ 
                            '<div class="col-xs-2">'+
                                '<select type="text" name="status_id" id="status_id" class="form-control input-sm required">'+
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

// Initialize a modal window object for viewing the bid details.
var  contextViewBid = {
    id: "modalViewBid"
    , title: ""
    , sizeAttr: "modal-lg"
    , footer: '<div class="pull-left">'
            + '<button type="button" onclick="CloseViewBid();" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle">'
            + '</span>&nbsp;Close</button>'
    , body: '<div class="col-xs-12">'+
                '<div class="form-horizontal" style="padding:5px">' +
                    '<div id="tblViewBid" class="col-xs-12">'+
                    
                        '<div class="col-xs-12 header-container"><label>Bid Information </label> </div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Bid Code: </label>' +
                            '<label class="col-xs-3 control-label label-display" id="bid_code" name="bid_code">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Bid Date: </label>' +
                            '<label class="col-xs-3 control-label label-display" id="bid_date" name="bid_date">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Bid Type: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="bid_type_name" name="bid_type_name">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Prepared By: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="prepared_by_name" name="prepared_by_name">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Project Name: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="project_name" name="project_name">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Project Type: </label>' +
                            '<label class="col-xs-3 control-label label-display" id="project_type_name" name="project_type_name">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Direct Cost: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="direct_cost" name="direct_cost">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Extended Cost: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="extended_cost" name="extended_cost">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Selling Cost: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="selling_cost" name="selling_cost">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Submission Date: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="submission_date" name="submission_date">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Duration: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="duration" name="duration">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Client: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="client_name" name="client_name">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Prebid Conference Date/Time: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="prebid_datetime_conference" name="prebid_datetime_conference">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Prebid Conference Venue: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="prebid_venue_conference" name="prebid_venue_conference">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Site Inspection Date/Time: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="site_datetime_inspection" name="site_datetime_inspection">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Site Inspection Venue: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="site_venue_inspection" name="site_venue_inspection">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Submission Type Courier: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="submission_courier" name="submission_courier">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Submission Type Email: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="submission_email" name="submission_email">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Submission Type Hardcopy: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="submission_hardcopy" name="submission_hardcopy">&nbsp;</label>' +
                            '<label class="col-xs-3 control-label">Validity of Bid: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="validity_of_bid" name="validity_of_bid">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Bid Document Amount: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="bid_document_amount" name="bid_document_amount">&nbsp;</label>' +
                           '<label class="col-xs-3 control-label">Remarks: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="remark" name="remark">&nbsp;</label>' +
                        '</div>'+
                        '<div class="form-group" >' +
                            '<label class="col-xs-3 control-label">Status: </label>'+ 
                            '<label class="col-xs-3 control-label label-display" id="status_name" name="status_name">&nbsp;</label>' +
                        '</div>'+
                    '</div>'+
                    
                '</div>'+
            '</div>'
};

// -------------- Window Objects --------------------------------------------------------- //

// -------------- Button Events --------------------------------------------------------- //

// Search button click event.
$("#btnSearch").click(function () {
    var search_text = $.trim($("#search_filter").val());
    if (search_text !== '') {
        displayRecords(search_text);
    }
});

// New button click event.            
$("#btnNew").click(function () {
    g_is_update = false;
    $("#modalBid .modal-title").text("Add New Bid");
    $('#modalBid').modal({ show: true, keyboard: false, backdrop: 'static' });
    clearEntries();
    zsi.initDatePicker();
    _initDateTimePicker();
    initNumberFormat();
    $("#bid_date").val(zsi.getCurrentDate());
    
    loadBidTypes();
    loadEmployees(function () {
        $("#prepared_by").val(userId);
    });
    loadProjects();
    loadParticulars();
    loadProjectTypes();
    loadClients();
    loadBidStatus();
    
    getNewBidCode();
});

// Cancel the entries.
function Cancel() {
    var result = confirm(Messages.CancelContinue);
    if (result) {
        clearEntries();
        $('#modalBid').modal('hide');
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
    } else if (isValidEmail($.trim($('#tblBid #submission_email').val())) === false) {
        alert(Messages.InvalidEmailAddress);
        return false;
    } else {
        var result = confirm(Messages.AllEntriesCorrectContinue);
        if (result) {
            $('.btn-primary').prop('disabled', true);
            showProcessMessage(Messages.Saving);
            removeCommasInNumbers();
            $("#tblBid").jsonSubmit({
                procedure: "bid_upd"
                , notInclude: "#prepared_by"
                , onComplete: function (data) {
                    if (data.isSuccess === true) {
                        showProcessMessage("");
                        $('.btn-primary').prop('disabled', false);
                        if (g_is_update === true) {
                            alert('Bid updated successfully.');   
                            $('#modalBid').modal('hide');
                        } else {
                            alert('New bid saved successfully.');    
                            getNewBidCode();
                        }
                        
                        initBid();
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
function showModalUpdate(bid_id, bid_code) {
    g_is_update = true;
    clearEntries();
    $("#modalBid .modal-title").text("Bid Update");
    $("#modalBid").modal({ show: true, keyboard: false, backdrop: 'static' });
    $("#tblBid #bid_id").val(bid_id);
    
    zsi.initDatePicker();
    _initDateTimePicker();
    
    loadBidTypes(function() {
        loadEmployees(function() {
            loadProjects(function() {
                loadParticulars(function() {
                    loadClients(function() {
                        loadProjectTypes(function() {
                            loadBidStatus(function() {
                                $.get(execURL + "bid_sel @bid_id=" + bid_id 
                                , function(data){
                                    if (data.rows !== null) {
                                        Bid.Code = data.rows[0].bid_code;
                                        Bid.Date = data.rows[0].bid_date;
                                        Bid.TypeId = data.rows[0].bid_type_id;
                                        Bid.PreparedById = data.rows[0].prepared_by;
                                        Bid.ProjectId = data.rows[0].project_id;
                                        Bid.ParticularId = data.rows[0].particular_id;
                                        Bid.ProjectTypeId = data.rows[0].project_type_id;
                                        Bid.TotalArea = data.rows[0].total_area;
                                        Bid.DirectCost = data.rows[0].direct_cost;
                                        Bid.ExtendedCost = data.rows[0].extended_cost;
                                        Bid.SellingCost = data.rows[0].selling_cost;
                                        Bid.SubmissionDate = data.rows[0].submission_date;
                                        Bid.Duration = data.rows[0].duration;
                                        Bid.ClientId = data.rows[0].client_id;
                                        Bid.Remark = data.rows[0].remark;
                                        Bid.StatusId = data.rows[0].status_id;
                                        Bid.PrebidDatetimeConference = data.rows[0].prebid_datetime_conference;
                                        Bid.PrebidVenueConference = data.rows[0].prebid_venue_conference;
                                        Bid.SiteDatetimeInspection = data.rows[0].site_datetime_inspection;
                                        Bid.SiteVenueInspection = data.rows[0].site_venue_inspection;
                                        Bid.SubmissionCourier = data.rows[0].submission_courier;
                                        Bid.SubmissionEmail = data.rows[0].submission_email;
                                        Bid.SubmissionHardcopy = data.rows[0].submission_hardcopy;
                                        Bid.ValidityOfBid = data.rows[0].validity_of_bid;
                                        Bid.BidDocumentAmount = data.rows[0].bid_document_amount;
                                        
                                        $("#tblBid #bid_code").val(Bid.Code);
                                        $("#tblBid #bid_date").val(Bid.Date.split(' ')[0]);
                                        $("#tblBid #bid_type_id").val(Bid.TypeId);
                                        $("#tblBid #prepared_by").val(Bid.PreparedById);
                                        $("#tblBid #project_id").val(Bid.ProjectId);
                                        $("#tblBid #particular_id").val(Bid.ParticularId);
                                        $("#tblBid #project_type_id").val(Bid.ProjectTypeId);
                                        $("#tblBid #total_area").val(Bid.TotalArea);
                                        $("#tblBid #direct_cost").val(Bid.DirectCost);
                                        $("#tblBid #extended_cost").val(Bid.ExtendedCost);
                                        $("#tblBid #selling_cost").val(Bid.SellingCost);
                                        $("#tblBid #submission_date").val(Bid.SubmissionDate.split(' ')[0]);
                                        $("#tblBid #duration").val(Bid.Duration);
                                        $("#tblBid #client_id").val(Bid.ClientId);
                                        $("#tblBid #remark").val(Bid.Remark);
                                        $("#tblBid #status_id").val(Bid.StatusId);
                                        $("#tblBid #prebid_datetime_conference").val(Bid.PrebidDatetimeConference);
                                        $("#tblBid #prebid_venue_conference").val(Bid.PrebidVenueConference);
                                        $("#tblBid #site_datetime_inspection").val(Bid.SiteDatetimeInspection);
                                        $("#tblBid #site_venue_inspection").val(Bid.SiteVenueInspection);
                                        $("#tblBid #submission_courier").val(Bid.SubmissionCourier);
                                        $("#tblBid #submission_email").val(Bid.SubmissionEmail);
                                        $("#tblBid #submission_hardcopy").val(Bid.SubmissionHardcopy);
                                        $("#tblBid #validity_of_bid").val(Bid.ValidityOfBid.toDateFormat());
                                        $("#tblBid #bid_document_amount").val(Bid.BidDocumentAmount);
                                        
                                        initNumberFormat();
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

// Initialize a modal window object for viewing the bid details.
function viewBidDetails(bid_id) {
    $("#modalViewBid .modal-title").text("Bid Details");
    $('#modalViewBid').modal({ show: true, keyboard: false, backdrop: 'static' });
    
    $.get(execURL + "bid_sel @bid_id=" + bid_id 
    , function(data){
        if (data.rows !== null) {
            Bid.Code = data.rows[0].bid_code;
            Bid.Date = data.rows[0].bid_date;
            Bid.Type = data.rows[0].bid_type_name;
            Bid.PreparedByName = data.rows[0].prepared_by_name;
            Bid.ProjectName = data.rows[0].project_name;
            Bid.ParticularName = data.rows[0].particular_name;
            Bid.ProjectTypeName = data.rows[0].project_type_name;
            Bid.TotalArea = data.rows[0].total_area;
            Bid.DirectCost = data.rows[0].direct_cost;
            Bid.ExtendedCost = data.rows[0].extended_cost;
            Bid.SellingCost = data.rows[0].selling_cost;
            Bid.SubmissionDate = data.rows[0].submission_date;
            Bid.Duration = data.rows[0].duration;
            Bid.ClientName = data.rows[0].client_name;
            Bid.Remark = data.rows[0].remark;
            Bid.StatusName = data.rows[0].status_name;
            Bid.PrebidDatetimeConference = data.rows[0].prebid_datetime_conference;
            Bid.PrebidVenueConference = data.rows[0].prebid_venue_conference;
            Bid.SiteDatetimeInspection = data.rows[0].site_datetime_inspection;
            Bid.SiteVenueInspection = data.rows[0].site_venue_inspection;
            Bid.SubmissionCourier = data.rows[0].submission_courier;
            Bid.SubmissionEmail = data.rows[0].submission_email;
            Bid.SubmissionHardcopy = data.rows[0].submission_hardcopy;
            Bid.ValidityOfBid = data.rows[0].validity_of_bid;
            Bid.BidDocumentAmount = data.rows[0].bid_document_amount;
            
            $("#tblViewBid #bid_code").html(Bid.Code);
            $("#tblViewBid #bid_date").html(Bid.Date.split(' ')[0]);
            $("#tblViewBid #bid_type_name").html(Bid.Type);
            $("#tblViewBid #prepared_by_name").html(Bid.PreparedByName);
            $("#tblViewBid #project_name").html(Bid.ProjectName);
            $("#tblViewBid #particular_name").html(Bid.ParticularName);
            $("#tblViewBid #project_type_name").html(Bid.ProjectTypeName);
            $("#tblViewBid #total_area").html($.number(Bid.TotalArea, 2));
            $("#tblViewBid #direct_cost").html($.number(Bid.DirectCost, 2));
            $("#tblViewBid #extended_cost").html($.number(Bid.ExtendedCost, 2));
            $("#tblViewBid #selling_cost").html($.number(Bid.SellingCost, 2));
            $("#tblViewBid #submission_date").html(Bid.SubmissionDate.split(' ')[0]);
            $("#tblViewBid #duration").html(Bid.Duration);
            $("#tblViewBid #client_name").html(Bid.ClientName);
            $("#tblViewBid #remark").html(Bid.Remark);
            $("#tblViewBid #status_name").html(Bid.StatusName);
            $("#tblViewBid #prebid_datetime_conference").html(Bid.PrebidDatetimeConference);
            $("#tblViewBid #prebid_venue_conference").html(Bid.PrebidVenueConference);
            $("#tblViewBid #site_datetime_inspection").html(Bid.SiteDatetimeInspection);
            $("#tblViewBid #site_venue_inspection").html(Bid.SiteVenueInspection);
            $("#tblViewBid #submission_courier").html(Bid.SubmissionCourier);
            $("#tblViewBid #submission_email").html(Bid.SubmissionEmail);
            $("#tblViewBid #submission_hardcopy").html(Bid.SubmissionHardcopy);
            $("#tblViewBid #validity_of_bid").html(Bid.ValidityOfBid.toDateFormat());
            $("#tblViewBid #bid_document_amount").html($.number(Bid.BidDocumentAmount, 2));
        }
    });
}

// Closes the window for viewing the bid details.
function CloseViewBid() {
    $('#modalViewBid').modal('hide');
}

// Generate a work order for the bid.
function generateWorkOrder(bid_id) {
    
}

// -------------- Button Events --------------------------------------------------------- //

// -------------- Function / Methods --------------------------------------------------------- //

// Get the new bid number.
function getNewBidCode(callback) {
    $.get(execURL  + "SELECT dbo.getNewBidCode() AS bid_code", function(data) {
        if (data.rows !== null) {
            g_new_bid_code = data.rows[0].bid_code;
            $("#tblBid #bid_code").val(g_new_bid_code);
            
            if(callback) callback();
        }
    });
}

// Get the template which is for modal window.
function getTemplate(){
    $.get(base_url + "templates/bsDialogBox.txt", function(d) {
        var template = Handlebars.compile(d);
        $("body").append(template(contextNewBid));
        $("body").append(template(contextViewBid));
    });    
}

// Display the records in the grid.
function displayRecords(search_param){   
    $("#grid").dataBind({
	    url: procURL + "bid_sel @search_param='" + search_param + "'" 
	    , width: 1305
	    , height: $(document).height() - 250
        , blankRowsLimit: 0
        , isPaging: true
        , dataRows: [
            { 
                text: "Edit"      
                , width: 50     
                , style: "text-align:center;" 
                , onRender: function(d) { 
                    return "<a href='javascript:void(0);'onclick='showModalUpdate(" + svn(d, "bid_id") + ", " + 
                    svn(d, "bid_id") + ");'><span class='glyphicon glyphicon-edit' style='font-size:12pt;'></span></a>"; 
                }
            }
            ,{
                text: "Bid No."
                , name: "bid_code"        
                , width: 100
                , style: "text-align:left;"       
    		    , onRender:  function(d) { 
    		        return "<a href='javascript:void(0);'onclick='viewBidDetails(\""
    		        + svn(d,"bid_id") + "\");' class='link-button'>" 
    		        + svn(d,"bid_code") + " </a>";
                }
             }	 
    		,{
    		    text: "Client Name"
    		    , name: "client_name"       
    		    , width: 300       
    		    , style: "text-align:left;"
    		    , class: "test"
    		    , onRender: function(d) { 
    		        return    svn(d,"client_name");
                }
    		}
    		,{
    		    text: "Project Name"
    		    , name: "project_name"       
    		    , width: 290       
    		    , style: "text-align:left;"
    		    , class: "test"
    		    , onRender: function(d) { 
    		        return    svn(d,"project_name");
                }
    		}
    		,{
    		    text: "Selling Cost"
    		    , name: "selling_cost"       
    		    , width: 150      
    		    , style: "text-align:left;"
    		    , class: "test"
    		    , onRender: function(d) {
    		        var val = svn(d, "selling_cost");
                    val = $.number(val, 2);
                    if (val === 'NaN') {
                        return '';
                    } else {
                        return val;
                    }
                }
    		}
    		,{
    		    text: "Submission Date"
    		    , name: "submission_date"       
    		    , width: 120
    		    , style: "text-align:left;"
    		    , onRender: function(d) { 
    		        return    svn(d,"submission_date").split(' ')[0];
                }
    		}
    		,{
    		    text: "Validity of Bid"
    		    , name: ""       
    		    , width: 120
    		    , style: "text-align:left;"
    		     , onRender: function(d) { 
    		        return    svn(d,"validity_of_bid").toDateFormat(); //split(' ')[0];
                }
    		}
    		,{
    		    text: "Work Order Request"
    		    , name: ""       
    		    , width: 150
    		    , style: "text-align:center;"
    		    , onRender: function(d) { 
    		        return    "<a href='javascript:void(0);'onclick='generateWorkOrder(\""
    		        + svn(d,"bid_id") + "\");' class='link-button'> Generate </a>";
                }
    		}
	    ]
	    , onComplete:function(){
            var $rows = $('#table .zRow');
        	$('#bid_search_code_filter').keyup(function(e) { 
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

// Validate an email address.
function isValidEmail(email_address) {
    var reg_ex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    
    if(reg_ex.test(email_address)){
        $("#tblBid #submission_email").removeClass('required-color');
    }else{
        $("#tblBid #submission_email").addClass('required-color');
    }
    
    return reg_ex.test(email_address);
}

// Show the process message.
function showProcessMessage(msg) {
    $("#modalBid #process-message").html(msg);
}

// Clear all the textboxes and set the selected value of the dropdownlists to none.
function clearEntries() {
    $("#tblBid input[type=text]").val('');
    $("#tblBid input[type=hidden]").val('');
    $("#tblBid select").val('');
    $('input:text.required').each(function() {
        $(this).removeClass('required-color');
    });
    $('select.required').each(function() {
            $(this).removeClass('required-color');
    });
}    

// Load the bid types.
function loadBidTypes(callback) {
    var select = $("#tblBid #bid_type_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/bid_type_options"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the employees.
function loadEmployees(callback) {
    var select = $("#tblBid #prepared_by");
    $(select).dataBind({
        url: base_url + "selectoption/code/employee"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the projects.
function loadProjects(callback) {
    var select = $("#tblBid #project_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/project"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the particulars.
function loadParticulars(callback) {
    var select = $("#tblBid #particular_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/particulars"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the project types.
function loadProjectTypes(callback) {
    var select = $("#tblBid #project_type_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/project_type_option"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the clients.
function loadClients(callback) {
    var select = $("#tblBid #client_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/client_name_options"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Load the bid status.
function loadBidStatus(callback) {
    var select = $("#tblBid #status_id");
    $(select).dataBind({
        url: base_url + "selectoption/code/bid_status_option"
        , onComplete : function(){
            if (callback) callback();
        }
    });
}

// Initialize number format for input elements that are numeric or decimal.
function initNumberFormat() {
    $(".required-number, .number").focusout(function() {
        var val = $(this).val();
        $(this).val($.number(val, 2));
    });
    
    $(".integer").focusout(function() {
        var val = $(this).val();
        $(this).val($.number(val, 0));
    });
    
    $("input:text.required-number, input:text.number").each(function() {
        var val = $(this).val();
        $(this).val($.number(val, 2));
    });
    
    $("input:text.integer").each(function() {
        var val = $(this).val();
        $(this).val($.number(val, 0));
    });
}

function isNumeric(n) {
    n = n.replace(/,/g , "");
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function removeCommasInNumbers() {
    $(".required-number, .number").each(function() {
        var val = $(this).val();
        val = val.replace(/,/g , "");
        $(this).val(val);
    });
}

function isDecimal(val) {   
    var decimal=  /^[-+]?[0-9]+\.[0-9]+$/;   
    if(val.match(decimal)) {   
        return true;  
    }  
    else {   
        return false;  
    }  
}       

function _initDateTimePicker(){
    $("#prebid_datetime_conference").datepicker('remove');
    $("#site_datetime_inspection").datepicker('remove');
    $("#prebid_datetime_conference").dateTimePicker({ format:'m.d.Y H:i'});
    $("#site_datetime_inspection").dateTimePicker({ format:'m.d.Y H:i'});
    
    var inputDate = $('input.date');
    inputDate.keyup(function(){      
        if(this.value.length==2 || this.value.length==5 ) this.value += "/";
    });
   
    if(inputDate.length > 0){
        inputDate.datepicker({
            format: 'mm/dd/yyyy'
            ,autoclose:true
        }).on('show', function(e){
            var l_dp     = $('.datepicker');
            l_dp.css("z-index",zsi.getHighestZindex() + 1);
        });
    }
};
 