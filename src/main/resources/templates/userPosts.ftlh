<#import "parts/common.ftlh" as c>
<body>
<@c.page>
<#if !isCurrentUser>
    <#if isSubscriber>
        <a class="btn btn-info" href="/user/unsubscribe/${userProfile.id}">Отпискаться</a>
    <#else>
        <a class="btn btn-info" href="/user/subscribe/${userProfile.id}">Подписаться</a>
    </#if>
</#if>
<div class="container my-3">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Подписки</div>
                    <h3 class="card-text">
                        <a href="/user/subscriptions/${userProfile.id}/list">${subscriptionsCount}</a>
                    </h3>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">Подписчики</div>
                    <h3 class="card-text">
                        <a href="/user/subscribers/${userProfile.id}/list">${subscribersCount}</a>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</div>
    <#if isCurrentUser>
        <#include "parts/postEdit.ftlh" />
    </#if>
    <#include "parts/postList.ftlh" />
</@c.page>