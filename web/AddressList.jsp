<%--
  Created by IntelliJ IDEA.
  User: Marc
  Date: 30.04.2015
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="addressList" class="com.vornetran.marc.beans.AddressList" scope="request"/>
<jsp:setProperty name="addressList" property="search"/>
<t:layout>
  <jsp:attribute name="title">Adressbuch</jsp:attribute>
  <jsp:attribute name="js">
    <script src="js/delete.js"></script>
  </jsp:attribute>
  <jsp:body>
    <div class="page-header">
      <h1>Adressbuch</h1>
    </div>
    <div class="row">
        <c:choose>
            <c:when test="${ pageContext.request.isUserInRole('admin') }">
                <div class="col-xs-9 col-md-10">
                    <jsp:include page="WEB-INF/includes/search.html"></jsp:include>
                </div>
                <div class="col-xs-3 col-md-2">
                    <c:if test="${ pageContext.request.isUserInRole('admin') }">
                        <a href="/AddressForm.jsp" class="btn btn-success btn-block">Neu</a>
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <div class="col-xs-12">
                    <jsp:include page="WEB-INF/includes/search.html"></jsp:include>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <hr/>
    <div class="list-group">
      <c:forEach items="${addressList.getList()}" var="address">
        <div class="row list-group-item animated">
          <div class="col-xs-4">
            <strong>${address.addressForm} ${address.christianName} ${address.name}</strong><br>
            ${address.street} ${address.number}<br>
            ${address.postcode} ${address.city}<br>
            ${address.country}<br>
          </div>
          <div class="col-xs-4">
            <em>Email:</em> <a href="mailto:${address.email}">${address.email}</a><br>
            <em>Telefon:</em> ${address.phone}<br>
            <em>Mobil:</em> ${address.mobile}<br>
            <em>Geburtstag:</em> ${address.displayBirthday()}<br>
          </div>
          <div class="col-xs-4">
            <div class="pull-right">
                <a href="/Address.jsp?id=${address.id}" class="btn btn-default btn-xs btn-block">Details</a><br>
                <c:if test="${ pageContext.request.isUserInRole('admin') }">
                    <button type="button" class="btn btn-danger btn-xs btn-block" data-id="${address.id}" data-delete data-redirect="reload">Löschen</button><br>
                </c:if>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </jsp:body>
</t:layout>
