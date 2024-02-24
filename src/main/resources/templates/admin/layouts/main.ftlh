<#import "../layouts/macros.ftlh" as macros>
<#macro content></#macro>

<#macro page>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description"/>
        <meta content="Coderthemes" name="author"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <!-- App favicon -->
        <link rel="shortcut icon" href="/assets/images/favicon.ico">
        <!-- App css -->
        <link href="/static/admin/css/app.min.css" rel="stylesheet" type="text/css" id="app-style"/>
        <!-- icons -->
        <link href="/static/admin/css/icons.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <!-- body start -->
    <body class="loading" data-layout-color="light" data-layout-mode="default" data-layout-size="fluid"
          data-topbar-color="light" data-leftbar-position="fixed" data-leftbar-color="light" data-leftbar-size='default'
          data-sidebar-user='true'>
    <script src="/static/admin/libs/jquery/jquery.min.js"></script>
    <div class="wrapper">
        <@macros.sidebar/>
        <@macros.navbar/>
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <@content/>
                </div>
            </div>
        </div>
    </div>

    <!-- Vendor -->
    <script src="/static/admin/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/static/admin/libs/simplebar/simplebar.min.js"></script>
    <script src="/static/admin/libs/node-waves/waves.min.js"></script>
    <script src="/static/admin/libs/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="/static/admin/libs/jquery.counterup/jquery.counterup.min.js"></script>
    <script src="/static/admin/libs/feather-icons/feather.min.js"></script>

    <!-- knob plugin -->
    <script src="/static/admin/libs/jquery-knob/jquery.knob.min.js"></script>

    <!--Morris Chart-->
    <script src="/static/admin/libs/morris.js06/morris.min.js"></script>
    <script src="/static/admin/libs/raphael/raphael.min.js"></script>

    <!-- Dashboar init js-->
    <script src="/static/admin/js/pages/dashboard.init.js"></script>

    <!-- App js-->
    <script src="/static/admin/js/app.min.js"></script>

    </body>
    </html>
</#macro>
