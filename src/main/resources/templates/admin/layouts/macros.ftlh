<#macro index>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h1 class="display-6 text-primary">Ads</h1>
                    <h3>Total: ${adsCount}</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h1 class="display-6 text-primary">Comments</h1>
                    <h3>Total: ${commentsCount}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h1 class="display-6 text-primary">Categories</h1>
                    <h3>Total: ${categoriesCount}</h3>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h1 class="display-6 text-primary">Images</h1>
                    <h3>Total: ${imagesCount}</h3>
                </div>
            </div>
        </div>
    </div>
</#macro>

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
                        <a href="#ads" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Ads </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="ads">
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
                        <a href="#categories" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Categories </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="categories">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="/admin/categories">View</a>
                                </li>
                                <li>
                                    <a href="/admin/categories/create">Create</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#comments" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Comments </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="comments">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="/admin/comments">View</a>
                                </li>
                                <li>
                                    <a href="/admin/comments/create">Create</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#images" data-bs-toggle="collapse">
                            <i class="mdi mdi-calendar-blank-outline"></i>
                            <span> Images </span>
                            <span class="menu-arrow"></span>
                        </a>
                        <div class="collapse" id="images">
                            <ul class="nav-second-level">
                                <li>
                                    <a href="/admin/images">View</a>
                                </li>
                                <li>
                                    <a href="/admin/images/create">Create</a>
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
            <a href="/admin" class="logo logo-dark text-center">
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

<#macro adView>
    <div class="card">
        <div class="card-body">
            <div class="mb-3">
                <a href="/admin/ads/edit/<#if ad.id??>${ad.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                <form class="d-inline" action="/admin/ads/delete/<#if ad.id??>${ad.id}<#else></#if>" method="POST">
                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th><#if ad.id??>${ad.id}<#else>-</#if></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>Author</th>
                        <th><#if ad.author??>${ad.author}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>City</th>
                        <th><#if ad.city??>${ad.city}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Title</th>
                        <th><#if ad.title??>${ad.title}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <th><#if ad.price??>${ad.price}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Description</th>
                        <th><#if ad.description??>${ad.description}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Views</th>
                        <th><#if ad.views??>${ad.views}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Area</th>
                        <th><#if ad.area??>${ad.area}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <th><#if ad.phone??>${ad.phone}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Category</th>
                        <th><#if ad.category.name??>${ad.category.name}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Comments count</th>
                        <th><#if count??>${count}<#else>-</#if></th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
                            <th><#if ad.category??>${ad.category.name}<#else>-</#if></th>
                            <th>
                                <a href="/admin/ads/view/<#if ad.id??>${ad.id}<#else></#if>"><span class="mdi mdi-eye-outline" style="font-size: 20px;"></span></a>
                                <a href="/admin/ads/edit/<#if ad.id??>${ad.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                                <form class="d-inline" action="/admin/ads/delete/<#if ad.id??>${ad.id}<#else></#if>" method="POST">
                                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                                </form>
                            </th>
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
                    <label class="form-label">Your name</label>
                    <input type="text" class="form-control" name="author">
                </div>
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="title">
                </div>
                <div class="mb-3">
                    <label class="form-label">City</label>
                    <input type="text" class="form-control" name="city">
                </div>
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <input type="text" class="form-control" name="description">
                </div>
                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number" class="form-control" name="price">
                </div>
                <div class="mb-3">
                    <label class="form-label">Area</label>
                    <input type="number" class="form-control" name="area">
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-control" name="phone">
                </div>
                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select name="category" class="form-select">
                        <#list categories as cat>
                            <option value="${cat.id}">${cat.name}</option>
                        </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>

<#macro editAd>
    <div class="card">
        <div class="card-body">
            <form action="/admin/ads/update/${ad.id}" method="POST">
                <div class="mb-3">
                    <label class="form-label">Your name</label>
                    <input type="text" class="form-control" name="author"
                    value="<#if ad.author??>${ad.author}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="title"
                    value="<#if ad.title??>${ad.title}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">City</label>
                    <input type="tel" class="form-control" name="city"
                           value="<#if ad.city??>${ad.city}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <input type="text" class="form-control" name="description"
                    value="<#if ad.description??>${ad.description}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number" id="price" class="form-control" name="price">
                    <script>
                        let price = "${ad.price}"
                        price = price.replace(/\s/g, '');
                        $('#price').val(Number(price))
                    </script>
                </div>
                <div class="mb-3">
                    <label class="form-label">Area</label>
                    <input type="number" class="form-control" name="area"
                    value="<#if ad.area??>${ad.area}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-control" name="phone"
                    value="<#if ad.phone??>${ad.phone}<#else></#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select name="category" class="form-select">
                        <#list categories as cat>
                            <option value="<#if cat.id??>${cat.id}<#else>-</#if>"><#if cat.name??>${cat.name}<#else>-</#if></option>
                        </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>

<#macro catView>
    <div class="card">
        <div class="card-body">
            <div class="mb-3">
                <a href="/admin/categories/edit/<#if cat.id??>${cat.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                <form class="d-inline" action="/admin/categories/delete/<#if cat.id??>${cat.id}<#else></#if>" method="POST">
                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th><#if cat.id??>${cat.id}<#else>-</#if></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>Name</th>
                            <th><#if cat.name??>${cat.name}<#else>-</#if></th>
                        </tr>
                        <tr>
                            <th>Ads count</th>
                            <th><#if count??>${count}<#else>-</#if></th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>

<#macro catsTable>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list categories as cat>
                        <tr>
                            <th><#if cat.id??>${cat.id}<#else>-</#if></th>
                            <th><#if cat.name??>${cat.name}<#else>-</#if></th>
                            <th>
                                <a href="/admin/categories/view/<#if cat.id??>${cat.id}<#else></#if>"><span class="mdi mdi-eye-outline" style="font-size: 20px;"></span></a>
                                <a href="/admin/categories/edit/<#if cat.id??>${cat.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                                <form class="d-inline" action="/admin/categories/delete/<#if cat.id??>${cat.id}<#else></#if>" method="POST">
                                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                                </form>
                            </th>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>


<#macro createCat>
    <div class="card">
        <div class="card-body">
            <form action="/admin/categories/store" method="POST">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>

<#macro editCat>
    <div class="card">
        <div class="card-body">
            <form action="/admin/categories/update/${cat.id}" method="POST">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="name"
                           value="<#if cat.name??>${cat.name}<#else>-</#if>">
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>

<#macro commentView>
    <div class="card">
        <div class="card-body">
            <div class="mb-3">
                <a href="/admin/comments/edit/<#if comment.id??>${comment.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                <form class="d-inline" action="/admin/comments/delete/<#if comment.id??>${comment.id}<#else></#if>" method="POST">
                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th><#if comment.id??>${comment.id}<#else>-</#if></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>Name</th>
                        <th><#if comment.author??>${comment.author}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Text</th>
                        <th><#if comment.text??>${comment.text}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Ad</th>
                        <th><#if comment.ad.id??>${comment.ad.id}<#else>-</#if>: <#if comment.ad.title??>${comment.ad.title}<#else>-</#if></th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>

<#macro commentsTable>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Author</th>
                        <th>Text</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list comments as comment>
                        <tr>
                            <th><#if comment.id??>${comment.id}<#else>-</#if></th>
                            <th><#if comment.author??>${comment.author}<#else>-</#if></th>
                            <th><#if comment.text??>${comment.text}<#else>-</#if></th>
                            <th>
                                <a href="/admin/comments/view/<#if comment.id??>${comment.id}<#else></#if>"><span class="mdi mdi-eye-outline" style="font-size: 20px;"></span></a>
                                <a href="/admin/comments/edit/<#if comment.id??>${comment.id}<#else></#if>"><span class="mdi mdi-pencil" style="font-size: 20px;"></span></a>
                                <form class="d-inline" action="/admin/comments/delete/<#if comment.id??>${comment.id}<#else></#if>" method="POST">
                                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                                </form>
                            </th>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>


<#macro createComment>
    <div class="card">
        <div class="card-body">
            <form action="/admin/comments/store" method="POST">
                <div class="mb-3">
                    <label class="form-label">Author</label>
                    <input type="text" class="form-control" name="author">
                </div>
                <div class="mb-3">
                    <label class="form-label">Text</label>
                    <input type="text" class="form-control" name="text">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ad</label>
                    <select name="ad" class="form-select">
                        <#list ads as ad>
                            <option value="<#if ad.id??>${ad.id}<#else>-</#if>"><#if ad.id??>${ad.id}<#else>-</#if>: <#if ad.title??>${ad.title}<#else>-</#if></option>
                        </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>

<#macro editComment>
    <div class="card">
        <div class="card-body">
            <form action="/admin/comments/update/${comment.id}" method="POST">
                <div class="mb-3">
                    <label class="form-label">Author</label>
                    <input type="text" class="form-control" name="author"
                           value="<#if comment.author??>${comment.author}<#else>-</#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Text</label>
                    <input type="text" class="form-control" name="text"
                           value="<#if comment.text??>${comment.text}<#else>-</#if>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ad</label>
                    <select name="ad" class="form-select">
                        <#list ads as ad>
                            <option value="<#if ad.id??>${ad.id}<#else>-</#if>"><#if ad.id??>${ad.id}<#else>-</#if>: <#if ad.title??>${ad.title}<#else>-</#if></option>
                        </#list>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>


<#macro imageView>
    <div class="card">
        <div class="card-body">
            <div class="mb-3">
                <form class="d-inline" action="/admin/images/delete/<#if image.id??>${image.id}<#else></#if>" method="POST">
                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                </form>
            </div>
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th><#if image.id??>${image.id}<#else>-</#if></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>Preview</th>
                        <th><#if image.previewImage??>${image.previewImage?c}<#else>False</#if></th>
                    </tr>
                    <tr>
                        <th>Ad</th>
                        <th><#if image.ad.id??>${image.ad.id}<#else>-</#if>: <#if image.ad.title??>${image.ad.title}<#else>-</#if></th>
                    </tr>
                    <tr>
                        <th>Image</th>
                        <th><img src="<#if image.path??>${image.path}<#else></#if>" alt="image" class="img-fluid rounded" width="400"></th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>

<#macro imagesTable>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Preview</th>
                        <th>Ad</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list images as image>
                        <tr>
                            <th><#if image.id??>${image.id}<#else>-</#if></th>
                            <th><#if image.previewImage??>${image.previewImage?c}<#else>-</#if></th>
                            <th><#if image.ad.id??>${image.ad.id}<#else>-</#if></th>
                            <th><img src="<#if image.path??>${image.path}<#else></#if>" alt="image" class="img-fluid rounded" width="200"></th>
                            <th>
                                <a href="/admin/images/view/<#if image.id??>${image.id}<#else></#if>"><span class="mdi mdi-eye-outline" style="font-size: 20px;"></span></a>
                                <form class="d-inline" action="/admin/images/delete/<#if image.id??>${image.id}<#else></#if>" method="POST">
                                    <button class="bg-transparent border-0 d-inline" type="submit"><span class="mdi mdi-delete text-danger" style="font-size: 20px;"></span></button>
                                </form>
                            </th>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</#macro>


<#macro createImage>
    <div class="card">
        <div class="card-body">
            <form action="/admin/images/store" method="POST" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Preview</label>
                    <select name="isPreviewImage" class="form-select">
                        <option value="0">No</option>
                        <option value="1">Yes</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ad</label>
                    <select name="ad" class="form-select">
                        <#list ads as ad>
                            <option value="<#if ad.id??>${ad.id}<#else>-</#if>"><#if ad.id??>${ad.id}<#else>-</#if>: <#if ad.title??>${ad.title}<#else>-</#if></option>
                        </#list>
                    </select>
                </div>
                <div class="mb-3">
                    <input name="files" type="file" class="form-control" multiple>
                </div>
                <script>
                    $(document).ready(function() {
                        // Отслеживание изменения в select
                        $('select[name="isPreviewImage"]').change(function() {
                            // Проверка выбранного значения
                            if ($(this).val() == "1") {
                                // Если выбрано Yes, убираем multiple
                                $('input[name="files"]').removeAttr('multiple');
                            } else {
                                // Если выбрано No, добавляем multiple
                                $('input[name="files"]').attr('multiple', 'multiple');
                            }
                        });
                    });
                </script>
                <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
            </form>
        </div>
    </div>
</#macro>
