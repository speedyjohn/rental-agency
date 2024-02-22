<!DOCTYPE html>
<html>
<head>
    <title>rental agency</title>
</head>
<body>
    <h1>Подробнее о квартире </h1><hr>
    <hr>
    <b>Название ЖК или апартаментов: </b>${ad.title}<br>
    <b>Описание ЖК или апартаментов: </b>${ad.description}<br>
    <b>Местоположение ЖК или апартаментов: </b>${ad.city}<br>
    <form action="/ad/delete/${ad.id}" method="post">
        <input type="submit" value="Удалить обьявление"/>
    </form>

    <#list comments as comment>
        ${comment.author}: ${comment.text}
    </#list>

</body>
</html>