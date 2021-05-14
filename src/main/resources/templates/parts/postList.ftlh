<#list posts as post>
    <div class="card my-5">
        <#if post.filename??>
            <img src="/img/${post.filename}" class="card-img-top">
        </#if>
        <div class="m-2">
            <span>${post.text}</span>
            <br/>
        </div>
        <div class="card-footer text-muted">
            Запостил:
            <a href="/user-messages/${post.author.id}">${post.authorName}</a>
        </div>
    </div>
<#else>
    Нет постов
</#list>
