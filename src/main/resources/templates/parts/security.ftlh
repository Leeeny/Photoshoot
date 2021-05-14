<#assign known = Session.SPRING_SECURITY_CONTEXT??>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    isModer = user.isModer()
    currentUserId = user.getId()
    >
<#else>
    <#assign
    name = ""
    isAdmin = false
    isModer = false
        currentUserId = -1
    >
</#if>