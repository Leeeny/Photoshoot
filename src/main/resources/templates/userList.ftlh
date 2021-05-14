<#import "parts/common.ftlh" as c>
<#import "parts/security.ftlh" as g>

<@c.page>
    <table>
        <thead>
        <tr>
            <th>Имя</th>
            <th>Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <#if g.isModer>
                <td><a href="/user/${user.id}">изменить</a></td>
                </#if>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>