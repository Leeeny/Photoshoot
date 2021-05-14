<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <body>
    ${message?ifExists}
    <@l.login "/login" false/>
    </body>
</@c.page>