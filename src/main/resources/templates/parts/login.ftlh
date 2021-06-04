<#import "userAgreement.ftlh" as a>
<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Имя пользователя: </label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Пожалуйста, введите имя пользователя"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Пожалуйста, введите пароль"/>
            </div>
        </div>
        <#if !isRegisterForm>
            <a href="/registration">Регистрация нового пользователя</a>
        <#else>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Пол: </label>
                <div class="col-sm-2">
                    <select id="inputState" name="gender" class="form-control">
                        <option selected>Мужской</option>
                        <option>Женский</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Дата рождения </label>
                <div class="col-sm-2">
                    <input type="date" class="form-control" name="age" placeholder="20"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Я согласен с правилами платформы </label>
                <div class="col-sm-2">
                    <input class="col-sm-1" type="checkbox">
                </div>
                <!-- modal button -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Просмотреть пользовательское соглашение
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Пользовательское соглашение</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               <@a.agreement></@a.agreement>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </else>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Войти</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Выйти</button>
    </form>
</#macro>
