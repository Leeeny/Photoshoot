<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Введите сообщение" />
            <input type="file" name = "file">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список постов</div>
    <#list posts as post>
        <div>
            <b>post_id: ${post.post_idId}</b>
            <span>text: ${post.text}</span>

            <strong>author: ${post.authorName}</strong>
            <div>
                <#if post.filename??>
                    <img src="/img/${post.filename}"
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</@c.page>