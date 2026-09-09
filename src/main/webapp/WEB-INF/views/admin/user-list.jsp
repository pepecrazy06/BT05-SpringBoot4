<%@ page
        contentType="text/html;charset=UTF-8"
        language="java" %>

<%@ taglib
        prefix="c"
        uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Quản lý User</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<div class="container py-4">


    <div
            class="d-flex
                   justify-content-between
                   align-items-center
                   mb-4">


        <h2>

            Quản lý User

        </h2>


        <a
                href="${pageContext.request.contextPath}/admin"
                class="btn btn-dark">

            Admin Dashboard

        </a>


    </div>


    <c:if test="${param.deleteError == '1'}">

        <div class="alert alert-danger">

            Không thể xóa User này.

        </div>

    </c:if>


    <!-- SEARCH -->

    <form
            action="${pageContext.request.contextPath}/admin/users"
            method="get"
            class="row g-2 mb-4">


        <div class="col-md-8">

            <input
                    type="text"
                    name="keyword"
                    value="${keyword}"
                    class="form-control"
                    placeholder="Tìm username, email, fullname hoặc phone">

        </div>


        <div class="col-md-4">


            <button
                    type="submit"
                    class="btn btn-primary">

                Tìm kiếm

            </button>


            <a
                    href="${pageContext.request.contextPath}/admin/users"
                    class="btn btn-secondary">

                Hiển thị tất cả

            </a>


        </div>


    </form>


    <div class="mb-3">


        <a
                href="${pageContext.request.contextPath}/admin/users/add"
                class="btn btn-success">

            + Thêm User

        </a>


    </div>


    <div class="table-responsive">


        <table
                class="table
                       table-bordered
                       table-hover
                       align-middle">


            <thead class="table-dark">


            <tr>

                <th>ID</th>

                <th>Username</th>

                <th>Email</th>

                <th>Fullname</th>

                <th>Phone</th>

                <th>Role</th>

                <th>Active</th>

                <th>Created Date</th>

                <th>Hành động</th>

            </tr>


            </thead>


            <tbody>


            <c:forEach
                    var="u"
                    items="${users}">


                <tr>


                    <td>
                            ${u.id}
                    </td>


                    <td>
                            ${u.username}
                    </td>


                    <td>
                            ${u.email}
                    </td>


                    <td>
                            ${u.fullname}
                    </td>


                    <td>
                            ${u.phone}
                    </td>


                    <td>


                        <c:choose>


                            <c:when test="${u.roleid == 1}">

                                <span class="badge bg-danger">

                                    ADMIN

                                </span>

                            </c:when>


                            <c:otherwise>

                                <span class="badge bg-primary">

                                    USER

                                </span>

                            </c:otherwise>


                        </c:choose>


                    </td>


                    <td>


                        <c:choose>


                            <c:when test="${u.active}">

                                <span class="badge bg-success">

                                    Active

                                </span>

                            </c:when>


                            <c:otherwise>

                                <span class="badge bg-secondary">

                                    Inactive

                                </span>

                            </c:otherwise>


                        </c:choose>


                    </td>


                    <td>
                            ${u.createdDate}
                    </td>


                    <td>


                        <a
                                href="${pageContext.request.contextPath}/admin/users/edit/${u.id}"
                                class="btn btn-warning btn-sm">

                            Sửa

                        </a>


                        <a
                                href="${pageContext.request.contextPath}/admin/users/delete/${u.id}"
                                class="btn btn-danger btn-sm"
                                onclick="return confirm('Bạn có chắc muốn xóa User này?')">

                            Xóa

                        </a>


                    </td>


                </tr>


            </c:forEach>


            <c:if test="${empty users}">


                <tr>


                    <td
                            colspan="9"
                            class="text-center text-muted">

                        Không tìm thấy User

                    </td>


                </tr>


            </c:if>


            </tbody>


        </table>


    </div>


</div>


</body>

</html>