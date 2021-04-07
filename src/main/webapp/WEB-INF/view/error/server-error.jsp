<%@ page isErrorPage="true"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d" %>


<t:template title="Error">
    <jsp:body>
      <main style="background-color: #333333; height: 80vh">
          <div class="container mt-5">
              <div class="row">
                  <div class="xs-12 md-6 mx-auto">
                      <div id="countUp">
                          <div class="number" data-count="${requestScope['javax.servlet.error.status_code']}">0</div>
                          <div class="text">${requestScope['javax.servlet.error.message']}.</div>
                      </div>
                  </div>
              </div>
          </div>
      </main>


    </jsp:body>
</t:template>

