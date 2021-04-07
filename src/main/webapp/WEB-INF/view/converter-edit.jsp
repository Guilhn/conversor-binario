
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Editar Conversão" current_page="converter-edit">
    <jsp:body>
        <p class="location p-2"> <small>${cityName}</small></p>
        <main class="container">
            <div class="row">

                <div class="col-lg-12 area-conversor mb-5">
                    <h2 class="text-center">EDITAR CONVERSÃO</h2>
                </div>



                <div class="col-lg-4 offset-lg-4">


                        <div class="input-group mb-3">
                            <span class="label-editar input-group-text" id="basic-addon2">Identificador</span>
                            <input disabled type="text" class="label-input-editar form-control" value="${converter.id}"  aria-describedby="basic-addon3">
                        </div>
                        <div class="input-group mb-3">
                            <span class="label-editar-blue input-group-text" id="basic-addon3">Valor Decimal</span>
                            <input disabled type="text" class="label-input-editar form-control" value="${converter.decimal}"  aria-describedby="basic-addon3">
                        </div>
                        <div class="input-group mb-3">
                            <span class="label-editar-orange input-group-text" id="basic-addon4">Valor Binário</span>
                            <input disabled type="text" class="label-input-editar form-control" value="${converter.binary}" id="basic-url" aria-describedby="basic-addon3">
                        </div>
                        <form action="editar" method="post">
                            <input type="text" name="id" class="d-none" value="${converter.id}">
                            <div class="input-group mb-3">
                                <label class="label-editar input-group-text" for="inputGroupSelect01">Cidade</label>
                                <select name="city" class="form-select" id="inputGroupSelect01">
                                    <option value="${converter.city.id}" selected>${converter.city.name}</option>

                                    <c:forEach var="city" items="${cities}">
                                        <c:if test="${city.id != converter.city.id}">
                                            <option value="${city.id}">${city.name}</option>
                                        </c:if>

                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3 mt-3 text-center btn-card-login">
                                    <button  type="submit" class="btn-converter-area">Atualizar</button>
                                </div>
                            </div>
                        </form>

                </div>


            </div>
        </main>


    </jsp:body>
</t:template>