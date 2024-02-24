<#import "../layouts/macros.ftlh" as macros>
<#include "../layouts/main.ftlh">
<#macro content>

    <div class="text-center" style="padding: 100px 0 100px 0">
        <h1 class="text-danger">${errorTitle}</h1>
        <p>${errorMessage}</p>
    </div>

</#macro>

<@page/>