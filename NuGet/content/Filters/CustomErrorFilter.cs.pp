using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using $rootnamespace$.Controllers;

namespace $rootnamespace$.Filters
{
    public class CustomErrorFilter : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            if (filterContext.ExceptionHandled)
            {
                return;
            }

            // if the request is AJAX return JSON else view.
            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
                filterContext.Result = new JsonResult
                {
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet,
                    Data = new
                    {
                        error = true,
                        message = filterContext.Exception.Message
                    }
                };

                filterContext.ExceptionHandled = true;
                filterContext.HttpContext.Response.Clear();
                filterContext.HttpContext.Response.StatusCode = filterContext.Exception is HttpException ? ((HttpException)filterContext.Exception).GetHttpCode() : 500;
                filterContext.HttpContext.Response.TrySkipIisCustomErrors = true;

                return;
            }

            if (!filterContext.HttpContext.IsCustomErrorEnabled)
            {
                return;
            }

            var controllerName = (string)filterContext.RouteData.Values["controller"];
            var actionName = (string)filterContext.RouteData.Values["action"];
            var model = new HandleErrorInfo(filterContext.Exception, controllerName, actionName);

            //filterContext.Result = new ViewResult
            //{
            //    ViewName = View,
            //    MasterName = Master,
            //    ViewData = new ViewDataDictionary<HandleErrorInfo>(model),
            //    TempData = filterContext.Controller.TempData
            //};

            var controller = DependencyResolver.Current.GetService<ErrorController>();
            var routeData = new RouteData();
            var action = "Index";

            if (filterContext.Exception is HttpException)
            {
                var httpEx = filterContext.Exception as HttpException;

                switch (httpEx.GetHttpCode())
                {
                    case 404:
                        action = "NotFound";
                        break;

                        // others if any
                }
            }

            filterContext.ExceptionHandled = true;
            filterContext.HttpContext.Response.Clear();
            filterContext.HttpContext.Response.StatusCode = filterContext.Exception is HttpException ? ((HttpException)filterContext.Exception).GetHttpCode() : 500;
            filterContext.HttpContext.Response.TrySkipIisCustomErrors = true;

            routeData.Values["controller"] = "Error";
            routeData.Values["action"] = action;

            controller.ViewData.Model = model;
            ((IController)controller).Execute(new RequestContext(filterContext.HttpContext, routeData));

            // log the error using log4net.
            //_logger.Error(filterContext.Exception.Message, filterContext.Exception);
        }
    }
}