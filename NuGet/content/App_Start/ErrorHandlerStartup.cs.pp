using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using $rootnamespace$.Filters;

[assembly: WebActivatorEx.PostApplicationStartMethod(typeof($rootnamespace$.ErrorHandlerStartup), "Start")]
namespace $rootnamespace$
{
	public static class ErrorHandlerStartup
	{
	    public static void Start()
	    {
	        var existingErrorFilter = GlobalFilters.Filters.FirstOrDefault(x => x.Instance is HandleErrorAttribute);
	        
            if (existingErrorFilter != null)
            {
                GlobalFilters.Filters.Remove(existingErrorFilter.Instance);
            }

	        GlobalFilters.Filters.Add(new CustomErrorFilter());
	    }
	}
}