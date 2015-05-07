<%--
  Created by IntelliJ IDEA.
  User: Marc
  Date: 07.05.2015
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:layout>
  <jsp:attribute name="title">Login</jsp:attribute>
  <jsp:body>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-4 center-block">
            <div class="page-header">
                <h1>Login</h1>
            </div>
            <c:if test="${param.failed != null}">
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    Incorrect login credentials!
                </div>
            </c:if>
            <form action="j_security_check" method="POST">
                <div class="form-group">
                    <label for="j_username">Username</label>
                    <input id="j_username" type="text" name="j_username" class="form-control" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="j_password">Password</label>
                    <input id="j_password" type="password" name="j_password" class="form-control" placeholder="Password">
                </div>
                <hr/>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>
    </div>
  </jsp:body>
</t:layout>
