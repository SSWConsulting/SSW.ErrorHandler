@using $rootnamespace$
@model HandleErrorInfo

@{
    ViewBag.Title = "Not Found";
}

<div class="container">
    <div class="row form-group">
        <div class="col-sm-12">
            <h1>Not Found</h1>
            <h3>Status Code: 404</h3>
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
            <p>This error usually occurs because data has changed since you requested this action. The best thing to do is go back, refresh your page and try again.</p>
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-12">
            <h2>This is happening more than just once:</h2>
            <p>We log all errors that occur, but to help us out please send an email with what you're trying to do and we'll take a look for you.</p>            
        </div>
    </div>
</div>
