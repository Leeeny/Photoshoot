<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль: </label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Пожалуйста, введите пароль"/>
        </div>
    </div>
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
        <label class="col-sm-2 col-form-label">Дата рождения: </label>
        <div class="col-sm-2">
            <input type="date" class="form-control" name="age" placeholder="20"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Приватный аккаунт: </label>
        <div class="col-sm-2">
            <input class="form-control col-sm-1" name="type" type="checkbox">
        </div>
    </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</@c.page>