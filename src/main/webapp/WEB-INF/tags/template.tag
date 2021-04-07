
<%@tag description="Template Inicial" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="title"%>
<%@attribute name="current_page"%>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.9.55/css/materialdesignicons.min.css" rel="stylesheet">
    <link rel='stylesheet' href='https://cdn.3up.dk/flexgrid.io@2.5.1/css/flexgrid.min.css'>
    <link rel="stylesheet" href="https://unpkg.com/tippy.js@6/animations/scale.css"/>
    <link href="assets/libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/resources/styles/style.css" rel="stylesheet">
    <link href="assets/resources/styles/error.css" rel="stylesheet">
</head>

<body class="d-flex flex-column h-100" style="background-color: white;">
<nav class="navbar navbar-expand-md navbar-dark ">
    <div class="container-fluid">
        <a class="navbar-brand" href="/conversor-binario"><img src="assets/resources/images/logo-white.png" width="250px" alt="logo"></a>
        <a class="menu-toggler navbar-toggler" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample"></a>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <!-- ml-auto still works just fine-->
            <div class="navbar-nav ms-auto">
                <a class="<c:if test="${current_page == 'converter'}">active</c:if> nav-link" aria-current="page" href="/conversor-binario">Conversor</a>
                <a class="<c:if test="${current_page == 'relatorio'}">active</c:if> nav-link" aria-current="page" href="listar">Relatório</a>

            </div>
        </div>
    </div>
</nav>

<div class="offcanvas offcanvas-start background-sidnav text-white " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header ">

        <button type="button" class="btn-close btn-close-white text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body sidnav-title">

        <ul class="nav nav-pills flex-column mb-auto">
            <li>
                <a href="/conversor-binario" class="nav-link text-white">
                    Conversor
                </a>
            </li>
            <li>
                <a href="listar" class="nav-link text-white">
                    Relatório
                </a>
            </li>

        </ul>
    </div>
</div>


<jsp:doBody></jsp:doBody>


<footer class="footer mt-auto py-3  footer-main">

    <div class="container">
        <div class="align-items-center">
            <div class=" mx-auto text-center footer-area">
                <p><strong>&#169 Copyright 2021 - Conversor Binário - Todos os direitos</strong></p><p></p>
            </div>
        </div>
    </div>
</footer>
<audio controls class="d-none" id="hehe" ><source src="https://www.myinstants.com/media/sounds/turret-thankyou.mp3" type="audio/mpeg"></source></audio>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/libraries/jquery/jquery-2.2.4.min.js"></script>
<script src="assets/libraries/in-view/in-view.min.js"></script>
<script src="assets/resources/scripts/error.js"></script>
<script>
    tippy('.contador-conversoes', {
        content: '<strong>  Conversões</strong>',
        animation: 'scale',
        theme: 'orange',
        allowHTML: true,
        inlinePositioning: true,
        placement: 'top',
    });
</script>

</body onload="initialize()">
</html>
