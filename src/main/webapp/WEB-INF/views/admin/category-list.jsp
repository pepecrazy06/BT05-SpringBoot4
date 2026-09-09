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

    <title>Quản lý Category</title>

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

            Quản lý Category

        </h2>


        <a
                href="${pageContext.request.contextPath}/admin"
                class="btn btn-dark">

            Admin Dashboard

        </a>


    </div>


    <!-- DELETE ERROR -->

    <c:if test="${param.deleteError == '1'}">

        <div class="alert alert-danger">

            Không thể xóa Category vì Category
            đang được sử dụng bởi dữ liệu khác.

        </div>

    </c:if>


    <!-- SEARCH -->

    <form
            action="${pageContext.request.contextPath}/admin/categories"
            method="get"
            class="row g-2 mb-4">


        <div class="col-md-8">

            <input
                    type="text"
                    name="keyword"
                    value="${keyword}"
                    class="form-control"
                    placeholder="Nhập tên Category cần tìm">

        </div>


        <div class="col-md-4">


            <button
                    type="submit"
                    class="btn btn-primary">

                Tìm kiếm

            </button>


            <a
                    href="${pageContext.request.contextPath}/admin/categories"
                    class="btn btn-secondary">

                Hiển thị tất cả

            </a>


        </div>


    </form>


    <!-- ADD BUTTON -->

    <div class="mb-3">


        <a
                href="${pageContext.request.contextPath}/admin/categories/add"
                class="btn btn-success">

            + Thêm Category

        </a>


    </div>


    <!-- TABLE -->

    <div class="table-responsive">


        <table
                class="table
                       table-bordered
                       table-hover
                       align-middle">


            <thead class="table-dark">


            <tr>

                <th>ID</th>

                <th>Tên Category</th>

                <th>Images</th>

                <th>Status</th>

                <th width="180">
                    Hành động
                </th>

            </tr>


            </thead>


            <tbody>


            <c:forEach
                    var="cate"
                    items="${categories}">


                <tr>


                    <td>

                            ${cate.categoryId}

                    </td>


                    <td>

                            ${cate.categoryname}

                    </td>


                    <td>


                        <c:choose>


                            <c:when test="${not empty cate.images}">

                                ${cate.images}

                            </c:when>


                            <c:otherwise>

                                <span class="text-muted">

                                    Không có

                                </span>

                            </c:otherwise>


                        </c:choose>


                    </td>


                    <td>


                        <c:choose>


                            <c:when test="${cate.status == 1}">

                                <span class="badge bg-success">

                                    Hoạt động

                                </span>

                            </c:when>


                            <c:otherwise>

                                <span class="badge bg-secondary">

                                    Không hoạt động

                                </span>

                            </c:otherwise>


                        </c:choose>


                    </td>


                    <td>


                        <a
                                href="${pageContext.request.contextPath}/admin/categories/edit/${cate.categoryId}"
                                class="btn btn-warning btn-sm">

                            Sửa

                        </a>


                        <a
                                href="${pageContext.request.contextPath}/admin/categories/delete/${cate.categoryId}"
                                class="btn btn-danger btn-sm"
                                onclick="return confirm('Bạn có chắc muốn xóa Category này?')">

                            Xóa

                        </a>


                    </td>


                </tr>


            </c:forEach>


            <c:if test="${empty categories}">


                <tr>


                    <td
                            colspan="5"
                            class="text-center text-muted">

                        Không tìm thấy Category

                    </td>


                </tr>


            </c:if>


            </tbody>


        </table>


    </div>


</div>


</body>

</html>