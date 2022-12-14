/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class HtmlWidgetService : WidgetService<HtmlWidget>
    {
        public HtmlWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }

        public override DbSet<HtmlWidget> CurrentDbSet => DbContext.HtmlWidget;

        protected override IEnumerable<string> GetFilesInWidget(HtmlWidget widget)
        {
            return ParseHtmlImageUrls(widget.HTML);
        }
    }
}
