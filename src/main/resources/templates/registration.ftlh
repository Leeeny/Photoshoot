<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-2">Пожалуйста, заполните поля ниже: </div>
    ${message?ifExists}
    <@l.login "/registration" true/>
</@c.page>