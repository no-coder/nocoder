<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html lang="zh-CN">
<jsp:include page="../common/head.jsp"></jsp:include>
<body>
	<div style="text-align:left;margin-left:15px; float:left;"><a class="btn btn-primary" href="<%=basePath%>/editor">写文章</a></div>
	<!--
	<div style="text-align:right;margin-left:15px;float:right;"><a class="btn btn-warning" href="javascript:void(0);" onclick="refreshCache();">刷新缓存</a></div>
	-->
	<table class="table table-responsive table-striped table-hover" style="margin:1em; width:98%;" >
		<caption>文章列表</caption>
		<thead align="center">
			<tr>
				<th width="30%">标题</th>
				<th width="10%">作者</th>
				<th width="10%">标签</th>
				<th width="20%">创建日期</th>
				<th width="10%">发布状态</th>
				<th width="10%" style="text-align: center;">操 作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${archiveList }" var="archive">
				<tr>
					<td>${archive.title }</td>
					<td>${archive.author }</td>
					<td>${archive.tag }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${archive.createTime }" /></td>
					<td>${archive.state == 1 ? "草稿" : "已发布" }</td>
					<td style="text-align: center;">
						<a href="<%=basePath%>/archive/edit?id=${archive.id}">编辑</a>&nbsp;&nbsp;&nbsp;
						<a href="javascript:if(confirm('确实要删除吗?'))location='<%=basePath%>/archive/delete?id=${archive.id}'">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div style="text-align: center;">
		<ul class="pagination">
			<li><a href="<%=basePath%>/admin?page=${(page==1) ? page : page-1}">上一页</a></li>
			<c:forEach var="i" begin="1" end="${totalPages }">
				<li><a href="<%=basePath%>/admin?page=${i}">${i}</a></li>
			</c:forEach>
			<li><a href="<%=basePath%>/admin?page=${page == totalPages ? page : page+1}">下一页</a></li>
		</ul>
	</div>
</body>
</html>