<#import "parts/common.ftlh" as c>
<body>
<@c.page>
    <#if isCurrentUser>
        <#include "parts/postEdit.ftlh" />
    </#if>

    <#include "parts/postList.ftlh" />
</@c.page>