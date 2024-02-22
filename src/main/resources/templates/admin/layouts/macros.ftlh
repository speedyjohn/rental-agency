<#macro sidebar>
    <div class="left-side-menu" style="top: 0">

        <div class="h-100" data-simplebar>

            <!--- Sidemenu -->
            <div id="sidebar-menu">

                <ul id="side-menu">
                    <li>
                        <a href="/admin">
                            <i class="mdi mdi-view-dashboard-outline"></i>
                            <span class="badge bg-success rounded-pill float-end">9+</span>
                            <span> Dashboard </span>
                        </a>
                    </li>

                    <li class="menu-title mt-2">Navigation</li>

                    <li>
                        <a href="#email" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Ads </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="email">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="/admin/ads">View</a>
                                </li>
                                <li>
                                    <a href="/admin/ads/create">Create</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#email" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Categories </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="email">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="/categories">View</a>
                                </li>
                                <li>
                                    <a href="/categories/create">Create</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
            <!-- End Sidebar -->

            <div class="clearfix"></div>

        </div>
        <!-- Sidebar -left -->

    </div>
</#macro>

<#macro navbar>

    <div class="navbar-custom" style="top: 0">

        <!-- LOGO -->
        <div class="logo-box">
            <a href="/admin" class="logo logo-light text-center bg-transparent">
                            <span class="logo-sm">
                                <img src="/static/admin/images/logo-sm.png" alt="" height="22">
                            </span>
                <span class="logo-lg">
                                <img src="/static/admin/images/logo-light.png" alt="" height="16">
                            </span>
            </a>
            <a href="index.html" class="logo logo-dark text-center">
                            <span class="logo-sm">
                                <img src="/static/admin/images/logo-sm.png" alt="" height="22">
                            </span>
                <span class="logo-lg">
                                <img src="/static/admin/images/logo-dark.png" alt="" height="16">
                            </span>
            </a>
        </div>
        <ul class="list-unstyled topnav-menu topnav-menu-left mb-0">
            <li>
                <h4 class="page-title-main">Admin panel</h4>
            </li>
        </ul>
    </div>
</#macro>

<#macro adsTable>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Author</th>
                        <th>City</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th>Views</th>
                        <th>Area</th>
                        <th>Phone</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list ads as ad>
                        <tr>
                            <th><#if ad.id??>${ad.id}<#else>-</#if></th>
                            <th><#if ad.author??>${ad.author}<#else>-</#if></th>
                            <th><#if ad.city??>${ad.city}<#else>-</#if></th>
                            <th><#if ad.title??>${ad.title}<#else>-</#if></th>
                            <th><#if ad.price??>${ad.price}<#else>-</#if></th>
                            <th><#if ad.description??>${ad.description}<#else>-</#if></th>
                            <th><#if ad.views??>${ad.views}<#else>-</#if></th>
                            <th><#if ad.area??>${ad.area}<#else>-</#if></th>
                            <th><#if ad.phone??>${ad.phone}<#else>-</#if></th>
                            <th><#if ad.category.name??>${ad.category.name}<#else>-</#if></th>
                            <th>TODO</th>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>

<#macro createAd>
    <div class="card">
        <div class="card-body">
            <form action="/admin/ads/store" method="POST">
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Title</label>
                    <input type="text" id="simpleinput" class="form-control" name="title">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Description</label>
                    <input type="text" id="simpleinput" class="form-control" name="description">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Price</label>
                    <input type="number" id="simpleinput" class="form-control" name="price">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Type</label>
                    <input type="text" id="simpleinput" class="form-control" name="typeOfApartment">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Area</label>
                    <input type="number" id="simpleinput" class="form-control" name="area">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Phone</label>
                    <input type="tel" id="simpleinput" class="form-control" name="phone">
                </div>
                <div class="mb-3">
                    <label for="simpleinput" class="form-label">Category</label>
                    <input type="text" id="simpleinput" class="form-control" name="category">
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>