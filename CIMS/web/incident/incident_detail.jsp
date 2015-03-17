<%-- 
    Document   : incident_detail
    Created on : 17-mrt-2015, 10:51:02
    Author     : Eric
--%>

<%@page import="java.util.List"%>
<%@page import="incident.Incident"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="cims.DatabaseManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    public int incidentId;
    public Incident currentIncident;
    public List<String> advice;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crisis Informatie Management Systeem</title>
        <link href="/CIMS/css/bootstrap.min.css" rel="stylesheet">
        <link href="/CIMS/css/Site.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="/navigationBar.jsp" %>
        <div class="container">

            <%
                if (request.getParameter("incident") != null)
                {
                    String id = request.getParameter("incident");
                    Incident incident = DatabaseManager.getIncientById(Integer.parseInt(id));
                    if (incident != null)
                    {
                        this.incidentId = Integer.parseInt(id);
                        this.currentIncident = incident;
                    }
                    else
                    {
                        response.sendRedirect("all.jsp");
                    }

                    advice = DatabaseManager.getAdviceById(Integer.parseInt(id));

                }
            %>

            <div class="jumbotron">
                <h2><%out.println(this.currentIncident.toString()); %></h2>
                <p><%out.println("Locatie: " + this.currentIncident.getLocation()); %></p>
                <p><%out.println("Gemeld op: " + this.currentIncident.getDate());%></p>
                <p><%out.println("Advies: " + this.currentIncident.getDate());%></p>
                <%
                    if (advice.size() > 0)
                    {

                        for (String singleAdvice : advice)
                        { %>
                <p><% out.println(singleAdvice); %></p>
                <% }
                }
                else
                { %>
                <p><% out.println("Nog geen advies beschikbaar. Blijf deze pagina in de gaten houden voor advies."); %></p>
                <% }
                %>

            </div>

            <footer>
                <p>&copy; <b>CIMS</b> 2015</p>
            </footer>
        </div> <!-- /container -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="/CIMS/js/bootstrap.min.js"></script>
    </body>

</html>