<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DashboardCustomItemGantt._Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Custom GanttItem</title>

    <link rel="stylesheet" href="https://cdn3.devexpress.com/jslib/21.1.5/css/dx-gantt.min.css" />
    <script src="https://cdn3.devexpress.com/jslib/21.1.5/js/dx-gantt.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.7/quill.min.js"></script>

    <style type="text/css">
        html, body, form {  
            height: 100%;  
            margin: 0;  
            padding: 0;  
            overflow: hidden;  
        }
    </style>
    <script type="text/javascript">
        //<![CDATA[
        function onBeforeRender(s, e) {
            var dashboardControl = s.GetDashboardControl();

            dashboardControl.registerExtension(new GanttItem(dashboardControl));
        }
        //]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" OnDataLoading="ASPxDashboard1_DataLoading"
            DashboardStorageFolder="~/App_Data/Dashboards" Height="100%">
            <ClientSideEvents BeforeRender="onBeforeRender" />
        </dx:ASPxDashboard>
        <script src="Scripts/GanttItem.js"></script>
    </form>
</body>
</html>