<#import 'spring.ftl' as spring>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <title>Rental agency</title>
</head>
<body>
<header>
    <h1 class="logo" style="font-size: 20px;">Rental Agency</h1>
    <div class="navbar">
        <nav>
            <a href="#">Главная</a>
            <a href="#">Обьявления</a>
            <a href="#">Преимущества компании</a>
            <a href="#"> Подать обьявление </a>
            <a href="#" id="account">
                <ion-icon name="person-circle-outline"></ion-icon>
            </a>
        </nav>
    </div>
</header>

<section class="info">`
    <h1>Найди квартиру своей мечты и живи с комфортом.</h1>
    <div class="picture">
        <img src="/static/img/pict.jpg" alt="img">
    </div>
</section>

<section class="our-benefits">
    <h3 style="text-align: center; color: #129BBD;
font-size: 20px; font-weight: bold"> Что мы предоставляем ? </h3>
    <h1 style="text-align: center; color: #000;
    font-size: 35px; font-weight: bold">Преимущества
        нашего агенства</h1>
    <div class="container">
        <div class="benefits-card">
            <div class="b-logo">
                <ion-icon name="star-outline"></ion-icon>
            </div>
            <h2 style="font-size: 16px;">Комфортабельное жилье </h2>
            <p style="font-size: 10px;">Множества вариантов бизнес класса</p>
        </div>
        <div class="benefits-card">
            <div class="b-logo">
                <ion-icon name="key-outline"></ion-icon>
            </div>
            <h2 style="font-size: 16px;">Продажа вашего имущества под ключ</h2>
            <p style="font-size: 10px;">Поможем вам продать ваше имущество</p>
        </div>
        <div class="benefits-card">
            <div class="b-logo">
                <ion-icon name="aperture-outline"></ion-icon>
            </div>
            <h2 style="font-size: 16px;">Удобная инфраструктура</h2>
            <p style="font-size: 10px;">Обеспечим вас всей необходимой инфраструктурой около вашего дома</p>
        </div>
    </div>
</section>

<section class="ads" style="margin-bottom: 30px;">
    <h3 style="text-align: center; color: #129BBD;
font-size: 20px; font-weight: bold"> Что предоставляют наши клиенты </h3>
    <h1 style="text-align: center; color: #000;
    font-size: 35px; font-weight: bold">Объявления</h1>
    <div class="container" style="flex-wrap: wrap">
        <#list ads as ad>
            <div class="benefits-card" style="position:relative; width: 30%;">
                <div class="b-logo">
                    <ion-icon name="aperture-outline"></ion-icon>
                </div>
                <h2 style="font-size: 16px;">${ad.title}</h2>
                <p style="font-size: 10px;">${ad.description}</p>
                <a class="ad-link" href="/ad/${ad.id}">Подробнее</a>
            </div>
        </#list>
    </div>

</section>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>


</html>

