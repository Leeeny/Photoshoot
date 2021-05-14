<#list posts as post>
    <div class="card text-muted my-3">
        <div>
            <#if post.filename??>
                <img class="card-img-top" src="/img/${post.filename}">
            </#if>
            <div class="text-muted m-2">Запостил: @${post.authorName}</div>
            <div class="text-muted m-2">
                <a href="/user-posts/${post.author.id}" ${post.text}
            </div>
        </div>
    </div>
<#else>
    Нет постов
</#list>
