
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<t:template title="Relatorio" current_page="relatorio">
    <jsp:body>
        <p class="location p-2"> <small>${cityName}</small> <small>${stateName}</small></p>
        <main class="container">

            <div class="row">

                    <div class="col-lg-12 area-conversor mb-5">
                        <h2 class="text-center">RELATÓRIO</h2>
                    </div>
                <c:if test="${not empty converter}">
                    <div class="col-lg-12 table-historico">

                        <table class=" table mt-3">
                            <thead class="tabela-header">
                            <tr class="tabela-line">
                                <th scope="col">#</th>
                                <th scope="col">Valor Decimal</th>
                                <th scope="col">Valor Binário</th>
                                <th scope="col">Cidade</th>
                                <th scope="col">Gerenciar</th>
                            </tr>
                            </thead>
                            <tbody>


                                <ul>
                                    <c:forEach var="converter" items="${converter}">
                                        <tr class="tabela-line">
                                            <th scope="row">${converter.id}</th>
                                            <td>${converter.decimal}</td>
                                            <td>${converter.binary}</td>
                                            <td>${converter.city.name}</td>
                                            <td>
                                                <a href="/conversor-binario/remover?id=${converter.id}" type="button" class="btn btn-outline-black btn-outline-danger">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                                    </svg>
                                                </a>
                                                <a href="/conversor-binario/editar?id=${converter.id}" type="button" class="btn btn-black btn-primary">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
                                                        <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
                                                    </svg>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </ul>

                            </tbody>
                        </table>
                    </div>
                </c:if>
                <c:if test="${empty converter}">
                    <div class="row">
                        <div class="col-lg-6 offset-lg-3">
                            <div class="alert alert-warning" role="alert">
                                <h4 class="text-center"> Nenhuma conversão!  &#128557</h4>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>


    </jsp:body>
</t:template>