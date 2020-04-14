#pragma checksum "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "61e8fd0074b45d73bbe1d81f882a0ef69a5c0d33"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(A.C.E.S.Pages.Students.Pages_Students_Student), @"mvc.1.0.razor-page", @"/Pages/Students/Student.cshtml")]
namespace A.C.E.S.Pages.Students
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\_ViewImports.cshtml"
using A.C.E.S;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemMetadataAttribute("RouteTemplate", "/Students/{ID:int}")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"61e8fd0074b45d73bbe1d81f882a0ef69a5c0d33", @"/Pages/Students/Student.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"0fe3f33a1bbfb825705ae137818486ffb09d4dab", @"/Pages/_ViewImports.cshtml")]
    public class Pages_Students_Student : global::Microsoft.AspNetCore.Mvc.RazorPages.Page
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 3 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
  
    ViewData["Title"] = Model.Student.Name;

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n<section class=\"flex-space margin\">\r\n    <div>\r\n        <h3>Contact</h3>\r\n        <p><a");
            BeginWriteAttribute("href", " href=\"", 213, "\"", 247, 2);
            WriteAttributeValue("", 220, "mailto:", 220, 7, true);
#nullable restore
#line 10 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
WriteAttributeValue("", 227, Model.Student.Email, 227, 20, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 10 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                            Write(Model.Student.Email);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</a></p>
    </div>
    <div>
        <h3>Academic Standing:</h3>
        <div id=""student-standing""></div>
    </div>
</section>

<section class=""margin"">
    <h2>Recent Submissions</h2>
    <table class=""table"">
        <colgroup>
            <col />
            <col />
            <col style=""width:100px;"" />
            <col style=""width:100px;"" />
            <col style=""width:120px;"" />
        </colgroup>
        <thead>
            <tr>
                <td>Assignment</td>
                <td># Submissions</td>
                <td>Grade</td>
                <td>Standing</td>
                <td></td>
            </tr>
        </thead>
        <tbody id=""recent-submissions"">
");
#nullable restore
#line 38 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
             if (Model.RecentSubmissions.Count == 0)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td colspan=\"5\">There are no assignment submissions for this student.</td>\r\n            </tr>\r\n");
#nullable restore
#line 43 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
            }

#line default
#line hidden
#nullable disable
#nullable restore
#line 44 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
             foreach (var recentSubmission in Model.RecentSubmissions)
            {
                var submissions = Model.Submissions.FindAll(s => s.AssignmentID == recentSubmission.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td><a");
            BeginWriteAttribute("href", " href=\"", 1433, "\"", 1499, 4);
            WriteAttributeValue("", 1440, "/Students/", 1440, 10, true);
#nullable restore
#line 48 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
WriteAttributeValue("", 1450, Model.Student.ID, 1450, 17, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1467, "/Assignment/", 1467, 12, true);
#nullable restore
#line 48 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
WriteAttributeValue("", 1479, recentSubmission.ID, 1479, 20, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 48 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                                                                     Write(recentSubmission.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></td>\r\n                <td class=\"align-right\">");
#nullable restore
#line 49 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                   Write(submissions.Count);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td class=\"align-right\">");
#nullable restore
#line 50 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                   Write(Model.Submissions.Find(s => s.AssignmentID == recentSubmission.ID).Grade);

#line default
#line hidden
#nullable disable
            WriteLiteral("/");
#nullable restore
#line 50 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                                                                                             Write(recentSubmission.Grade);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n");
#nullable restore
#line 51 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                   
                    int sum = 0;
                    foreach (var submission in submissions)
                    {
                        sum += (int)submission.Standing;
                    }
                    int avg = sum / submissions.Count;
                

#line default
#line hidden
#nullable disable
            WriteLiteral("                <td class=\"align-right\">");
#nullable restore
#line 59 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                                   Write(avg);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td></td>\r\n            </tr>\r\n");
#nullable restore
#line 62 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n    </table>\r\n</section>\r\n\r\n<section class=\"margin\">\r\n    <h2>Past Submissions</h2>\r\n");
            WriteLiteral("</section>\r\n\r\n<script>\r\n    submissions = JSON.parse(\'");
#nullable restore
#line 82 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                         Write(Json.Serialize(Model.Submissions));

#line default
#line hidden
#nullable disable
            WriteLiteral("\');\r\n    assignments = JSON.parse(\'");
#nullable restore
#line 83 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                         Write(Json.Serialize(Model.Assignments));

#line default
#line hidden
#nullable disable
            WriteLiteral("\');\r\n    recentSubmissions = JSON.parse(\'");
#nullable restore
#line 84 "D:\Documents\_School\2020_1_Spring\CS 4450 Software\A.C.E.S\A.C.E.S. 2.0\ACES Dashboard\A.C.E.S\A.C.E.S\Pages\Students\Student.cshtml"
                               Write(Json.Serialize(Model.RecentSubmissions));

#line default
#line hidden
#nullable disable
            WriteLiteral(@"');

    UpdateStudentStanding();
    //UpdateRecentSubmissions();

    function UpdateStudentStanding() {
        var sum = 0;
        for (var assignment of assignments) {
            if (assignment.overrideStanding) {
                sum += assignment.overrideStanding;
            }
            else {
                var subsum = 0;
                for (var submission of submissions) {
                    subsum += submission.standing;
                }
                sum += Math.round(subsum / submissions.length);
            }
        }
        var avgStanding = Math.round(sum / assignments.length);
        console.log(avgStanding);
        switch (avgStanding) {
            case 0:
                $('#student-standing').html('<i class=""green-text fas fa-star""></i><i class=""green-text fas fa-star""></i><i class=""green-text fas fa-star""></i> Good');
                break;
            case 1:
                $('#student-standing').html('<i class=""orange-text fas fa-star""></i><i cl");
            WriteLiteral(@"ass=""orange-text fas fa-star""></i><i class=""far fa-star""></i> Moderate');
                break;
            case 2:
                $('#student-standing').html('<i class=""red-text fas fa-star""></i><i class=""far fa-star""></i><i class=""far fa-star""></i> Bad');
                break;
            default:
                $('#student-standing').html('<i class=""far fa-star""></i><i class=""far fa-star""></i><i class=""far fa-star""></i> N/A');
                break;
        }
    }

    function UpdateRecentSubmissions() {
        if (recentSubmissions.length == 0)
        {
            $('#recent-submissions').html('<tr><td colspan=""5"">There are no assignment submissions for this student.</td></tr>');
        }
        for (var recentSubmission of recentSubmissions)
        {
        }
    }
</script>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<A.C.E.S.Pages.Students.StudentModel> Html { get; private set; }
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<A.C.E.S.Pages.Students.StudentModel> ViewData => (global::Microsoft.AspNetCore.Mvc.ViewFeatures.ViewDataDictionary<A.C.E.S.Pages.Students.StudentModel>)PageContext?.ViewData;
        public A.C.E.S.Pages.Students.StudentModel Model => ViewData.Model;
    }
}
#pragma warning restore 1591
