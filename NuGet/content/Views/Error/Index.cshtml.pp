@using $rootnamespace$
@model HandleErrorInfo

@{
    ViewBag.Title = "Error";
}

<div class="container">
    <div class="row form-group">
        <div class="col-sm-12">
            <h1>System Error</h1>
            <h3>Status Code: @(Model.Exception is HttpException ? ((HttpException)Model.Exception).GetHttpCode() : 500)</h3>
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-12">
            <h2>Error Message for Humans:</h2>
            <p>@Model.Exception.Message</p>
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-12">
            <h2>What should I do?:</h2>
            <p>
                This error is usually our fault. Something has gone wrong with the system or we don't quite understand what you're trying to do. 
                Your best bet is double check that the data you're providing us, or the action you're taking is correct and try again. If you receive the error again, please see below.
            </p>
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-12">
            <h2>This is happening more than just once:</h2>
            <p>We log all errors that occur, but to help us out please send an email with what you're trying to do and we'll take a look for you.</p>
        </div>
    </div>
</div>