SSW.ErrorHandler
================

The ultimate MVC Error Handler. Once installed your website will show graceful error pages and will respond to AJAX requests with dignity.

## Included Files

    \App_Start
        \ErrorHandlerStartup.cs
    \Controllers
        \ErrorController.cs
    \Filters
        \CustomErrorFilter.cs
    \Views
        \Error
            \Index.cshtml
            \NotFound.cshtml
    \web.config

**ErrorHandlerStartup.cs**
This code hooks up our custom error filter and removes the default HandleErrorAttribute filter.

**ErrorController.cs**
A basic controller used to display our error views. Feel free to add to this controller.

**CustomErrorFilter.cs**
The magic happens here. This filter detects an exception and redirects to the appropriate error view. If it was an AJAX request, it responds with some standardised JSON.

**Index.cshtml**
This is the default exception view and will display the exception message.

**NotFound.cshtml**
This is a 404 view, with slightly different wording. Feel free to add more views.

**web.config**
The web.config is automatically updated to turn customErrors on. It is best practice to develop with this on so that you feel the pain of bad error screens, and update them to contain useful information. This also makes you think about how you will deal with production errors.


## Usage Instructions

Ensure your web.config has customErrors set to On.

    <configuration>
      <system.web>
        <customErrors mode="On" />
      </system.web>
    </configuration>
    
Enjoy useful, easy error screens and JSON messages.

