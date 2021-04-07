<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Inicio" current_page="converter">
    <jsp:body>
        <p class="location p-2"> <small>${cityName}</small> <small>${stateName}</small></p>
        <main class="container">
            <div class="row">

                <div class="col-lg-12 area-conversor mb-5">
                    <h2 class="text-center">CONVERSOR  BINÁRIO  </h2>
                </div>

                <div class="row d-none" id="msg-form-error">
                    <div class="col-lg-4 offset-lg-4">
                        <div class="alert alert-warning" role="alert">
                            <p class="text-center">Preencha um dos campos abaixo! &#128545</p>
                        </div>
                    </div>
                </div>

                    <%--DEC to BIN--%>

                <form method="post" action="decimal" class="convert-form content ">
                    <div class="row d-flex">
                        <div class="col-lg-6 order-1" id="form-dec">
                            <div class="area-label-left"><div class="row"><div class="col-lg-11"><label class="form-label label-left">Número decimal</label></div><div class="col-lg-1 "><p  id="counterConverterDec" class="text-center align-middle contador-conversoes"><strong><c:if test="${counterConverterDec != 0}">${counterConverterDec}</c:if></strong></p></div></div></div>
                            <input  pattern="^[0-9]{1,10}" name="decimal" id="form-dec-input" type="text" value="<c:if test="${type_conversion == 'binary'}">${dec}</c:if>" class="form-control form-conversor form-conversor-left">
                        </div>

                        <div class="col-lg-6  order-3 " id="form-bin">
                            <div class="area-label-right"><div class="row"><div class="col-lg-11"><label class="form-label label-right">Número binário</label></div><div class="col-lg-1 "><p id="counterConverterBin" class="text-center align-middle contador-conversoes"><strong><c:if test="${counterConverterBin != 0}">${counterConverterBin}</c:if></strong></p></div></div></div>
                            <input  type="text" pattern="^[10]+$" name="binario" id="form-bin-input"  value="<c:if test="${type_conversion == 'decimal'}">${bin}</c:if>" class="form-control form-conversor form-conversor-right" >
                        </div>

                        <input type="text" id="state" name="state" class="d-none">
                        <input type="text" id="city" name="city" class="d-none">

                    </div>
                    <div class="row">
                        <div class="col-lg-6 offset-lg-3">
                            <div class="mb-3 mt-3 text-center btn-card-login">
                                <button  type="submit" class="btn-converter-area">Converter</button>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="row mt-3 table-historico">
                    <div class="col-lg-5  card text-white bg-dark mb-3 mr-4">
                        <div class="card-header text-center"><strong>FÓRMULA DECIMAL PARA BINÁRIO</strong></div>
                        <div class="card-body">
                            <p class="text-center">Exemplo: <strong>Decimal</strong> = 6  <strong>&nbsp;&nbsp;&nbsp;&nbsp; Binário</strong> = 110</p>
                            &emsp;6 &#247; 2 = 3, restante&nbsp;&nbsp;&nbsp;&nbsp;<b>0</b>&nbsp;&nbsp;&nbsp;&nbsp;(LSB - Byte menos significativo)<br>
                            &emsp;3 &#247; 2 = 1, restante&nbsp;&nbsp;&nbsp;&nbsp;<b>1</b><br>
                            &emsp;1 &#247; 2 = 0, restante&nbsp;&nbsp;&nbsp;&nbsp;<b>1</b>&nbsp;&nbsp;&nbsp;&nbsp;(MSB - Byte mais significativo)
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <p id="resultado-conversao"></p>
                    </div>
                    <div class="col-lg-5 card text-white bg-dark mb-3">
                        <div class="card-header text-center"><strong>FÓRMULA BINÁRIO PARA DECIMAL</strong></div>
                        <div class="card-body text-center">
                            <p class="text-center">Exemplo: <strong>Binário</strong> = 110  <strong>&nbsp;&nbsp;&nbsp;&nbsp; Decimal</strong> = 6</p>
                            <strong cla>110<sub>2</sub></strong> = <strong>1</strong> &#215; 2<sup>2</sup> + <strong>1</strong> &#215; 2<sup>2</sup>+ <strong>0</strong> &#215; 2<sup>2</sup> = <strong>6 <sub>10</sub></strong> <br>
                            <strong>110<sub>2</sub></strong> = <strong>6 <sub>10</sub></strong>
                        </div>
                    </div>

                </div>




            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="assets/resources/scripts/main.js"></script>
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
            $.ajax({
                url: "https://geolocation-db.com/jsonp",
                jsonpCallback: "callback",
                dataType: "jsonp",
                success: function( location ) {
                    $('#city').val(location.city);
                }
            });
        </script>

    </jsp:body>
</t:template>