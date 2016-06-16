<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<!-- add js resources -->
<template:addResources type="javascript" resources="application.js" />
<template:addResources type="javascript" resources="bootstrap-collapse.js" />
<template:addResources type="javascript" resources="bootstrap-tab.js" />
<template:addResources type="javascript" resources="bootstrap-transition.js" />
<template:addResources type="javascript" resources="jquery-1.9.1.min.js" />
<template:addResources type="javascript" resources="owl.carousel.js" />
<template:addResources type="javascript" resources="custom.js" />

<!-- add css resources -->
<template:addResources type="css" resources="bootstrapTheme.css" />
<template:addResources type="css" resources="custom.css" />
<template:addResources type="css" resources="owl.carousel.css" />
<template:addResources type="css" resources="owl.theme.css" />
<template:addResources type="css" resources="owl.transitions.css" />
<template:addResources type="css" resources="responsive.css" />
<template:addResources type="css" resources="lastCSS.css" />

<c:if test="${renderContext.editMode}">
  <template:module path="*"/>
  <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carousel2Image')}" var="curNode">
    <c:set var="pic" value="${curNode.properties['image']}"/>
    <c:url value="${pic.node.url}" var="imgUrl"></c:url>
    <div class="item">
    	<img src="${imgUrl}"/>
    </div>
  </c:forEach>
</c:if>

<c:set var="thisID" value="${currentNode.properties['id'].string}"/>
<c:set var="uniqueID" value="carousel${thisID}"/>

<div class="hiddenVars ${uniqueID}">
  
  <!-- Number of items per page -->
  <!-- At max browser width -->
  <c:if test="${not empty currentNode.properties['items']}">
      <c:set var="items" value="${currentNode.properties['items'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['items']}">
      <c:set var="items" value="none"/>
	  </c:if>
    <div class="${uniqueID} carouselItems">${items}</div>
  <!-- Option to display only a single item -->
  <c:if test="${empty currentNode.properties['items']}">
      <c:set var="singleItem" value="none"/>
  </c:if>
  <c:if test="${not empty currentNode.properties['items']}">
  	<c:if test="${currentNode.properties['singleItem'].string == 'true'}">
      	<c:set var="singleItem" value="true"/>
  	</c:if>
  	<c:if test="${currentNode.properties['singleItem'].string == 'false'}">
  		<c:set var="singleItem" value="false"/>
  	</c:if>
  </c:if>
  <div class="${uniqueID} carouselSingleItem">${singleItem}</div>
  
</div>

<div class="owl-carousel carouselMain" id="${uniqueID}">

<c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carousel2Image')}" var="curNode">
  <c:set var="pic" value="${curNode.properties['image']}"/>
  <c:url value="${pic.node.url}" var="imgUrl"></c:url>
  <div class="item">
  	<img src="${imgUrl}"/>
  </div>
</c:forEach>
  
</div>