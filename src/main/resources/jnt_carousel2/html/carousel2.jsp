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

<c:if test="${not renderContext.editMode}">
  <div class="hiddenVars ${uniqueID}">
  </c:if>
  <c:if test="${renderContext.editMode}">
    <div class="${uniqueID}">
    </c:if>
    
    <!-- ================== Number of items per page ======================== -->
    <!-- At max browser width -->
    <c:if test="${not empty currentNode.properties['items']}">
      <c:set var="items" value="${currentNode.properties['items'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['items']}">
      <c:set var="items" value="none"/>
    </c:if>
    <div class="${uniqueID} carouselItems">${items}</div>
    
    <!-- Set desktop browser width -->
    
    <!-- Check if size was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['desktopSize']}">
      <c:set var="desktopSize" value="${currentNode.properties['desktopSize'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['desktopSize']}">
      <c:set var="desktopSize" value="1199"/>
    </c:if>
    <div class="${uniqueID} carouselChangeDesktopSize">${desktopSize}</div>
    
    <!-- Check if number of items was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['desktopItems']}"> 
      <c:set var="desktopItems" value="${currentNode.properties['desktopItems'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['desktopItems']}">
      <c:set var="desktopItems" value="4"/>
    </c:if>
    <div class="${uniqueID} carouselChangeDesktopItemNumber">${desktopItems}</div>
    
    
    <!-- Set small desktop browser width -->
    
    <!-- Check if size was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['smallDesktopSize']}">
      <c:set var="smallDesktopSize" value="${currentNode.properties['smallDesktopSize'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['smallDesktopSize']}">
      <c:set var="smallDesktopSize" value="979"/>
    </c:if>
    <div class="${uniqueID} carouselChangeSmallDesktopSize">${smallDesktopSize}</div>
    
    <!-- Check if number of items was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['smallDesktopItems']}"> 
      <c:set var="smallDesktopItems" value="${currentNode.properties['smallDesktopItems'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['smallDesktopItems']}">
      <c:set var="smallDesktopItems" value="4"/>
    </c:if>
    <div class="${uniqueID} carouselChangeSmallDesktopItemNumber">${smallDesktopItems}</div>
    
    
    <!-- Set tablet browser width -->
    
    <!-- Check if size was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['tabletSize']}">
      <c:set var="tabletSize" value="${currentNode.properties['tabletSize'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['tabletSize']}">
      <c:set var="tabletSize" value="979"/>
    </c:if>
    <div class="${uniqueID} carouselChangeTabletSize">${tabletSize}</div>
    
    <!-- Check if number of items was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['tabletItems']}"> 
      <c:set var="tabletItems" value="${currentNode.properties['tabletItems'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['tabletItems']}">
      <c:set var="tabletItems" value="4"/>
    </c:if>
    <div class="${uniqueID} carouselChangeTabletItemNumber">${tabletItems}</div>
    
    
    <!-- Set small tablet browser width -->
    
    <!-- Because it's false by default, if neither is changed, just say false -->
    <c:if test="${empty currentNode.properties['smallTabletSize'] && empty currentNode.properties['smallTabletItems']}">
      <div class="${uniqueID} carouselSmallTabletChanged">false</div>
    </c:if>
    
    <!-- Check if size was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['smallTabletSize']}">
      <c:set var="smallTabletSize" value="${currentNode.properties['smallTabletSize'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['smallTabletSize']}">
      <c:set var="smallTabletSize" value="979"/>
    </c:if>
    <div class="${uniqueID} carouselChangeSmallTabletSize">${smallTabletSize}</div>
    
    <!-- Check if number of items was changed, otherwise set to default -->
    <c:if test="${not empty currentNode.properties['smallTabletItems']}"> 
      <c:set var="smallTabletItems" value="${currentNode.properties['smallTabletItems'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['smallTabletItems']}">
      <c:set var="smallTabletItems" value="4"/>
    </c:if>
    <div class="${uniqueID} carouselChangeSmallTabletItemNumber">${smallTabletItems}</div>
    
   
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
    
    <!-- ================== Navigation Options ======================== -->
    <!-- Autoplay -->
    <c:if test="${empty currentNode.properties['autoPlay']}">
      <c:set var="autoPlay" value="none"/>
    </c:if>
    <c:if test="${not empty currentNode.properties['autoPlay']}">
      <c:if test="${currentNode.properties['autoPlay'].string == 'true'}">
        <c:if test="${empty currentNode.properties['autoPlayTime']}">
          <c:set var="autoPlay" value="5000"/>
        </c:if>
        <c:if test="${not empty currentNode.properties['autoPlayTime']}">
          <c:set var="autoPlay" value="${currentNode.properties['autoPlayTime'].string}"/>
        </c:if>
      </c:if>
      <c:if test="${currentNode.properties['autoPlay'].string == 'false'}">
        <c:set var="autoPlay" value="false"/>
      </c:if>
    </c:if>
    <div class="${uniqueID} carouselAutoPlay">${autoPlay}</div>
    <!-- Show or Hide Navigation Buttons -->
    <c:if test="${empty currentNode.properties['navigation']}">
      <c:set var="navigation" value="none"/>
    </c:if>
    <c:if test="${not empty currentNode.properties['navigation']}">
      <c:if test="${currentNode.properties['navigation'].string == 'true'}">
        <c:set var="navigation" value="true"/>
      </c:if>
      <c:if test="${currentNode.properties['navigation'].string == 'false'}">
        <c:set var="navigation" value="false"/>
      </c:if>
    </c:if>
    <div class="${uniqueID} carouselNavigation">${navigation}</div>
    
    <!-- ================== Pagination Options ======================== -->
    <!-- Show/Hide pagination -->
    <c:if test="${empty currentNode.properties['pagination']}">
      <c:set var="pagination" value="none"/>
    </c:if>
    <c:if test="${not empty currentNode.properties['pagination']}">
      <c:if test="${currentNode.properties['pagination'].string == 'true'}">
        <c:set var="pagination" value="false"/>
      </c:if>
      <c:if test="${currentNode.properties['pagination'].string == 'false'}">
        <c:set var="pagination" value="true"/>
      </c:if>
    </c:if>
    <div class="${uniqueID} carouselPagination">${pagination}</div>
    <!-- enable/disable pagination numbers -->
    <c:if test="${empty currentNode.properties['paginationNumbers']}">
      <c:set var="paginationNumbers" value="none"/>
    </c:if>
    <c:if test="${not empty currentNode.properties['paginationNumbers']}">
      <c:if test="${currentNode.properties['paginationNumbers'].string == 'true'}">
        <c:set var="paginationNumbers" value="true"/>
      </c:if>
      <c:if test="${currentNode.properties['paginationNumbers'].string == 'false'}">
        <c:set var="paginationNumbers" value="false"/>
      </c:if>
    </c:if>
    <div class="${uniqueID} carouselPaginationNumbers">${paginationNumbers}</div>
    
    
    
    
  </div>
  <c:if test="${not renderContext.editMode}">  
    <div class="owl-carousel carouselMain" id="${uniqueID}">
      
      <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carousel2Image')}" var="curNode">
        <c:set var="pic" value="${curNode.properties['image']}"/>
        <c:url value="${pic.node.url}" var="imgUrl"></c:url>
        <div class="item">
          <img src="${imgUrl}"/>
        </div>
      </c:forEach>
      
    </div>
  </c:if>