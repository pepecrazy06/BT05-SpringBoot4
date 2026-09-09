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

    <title>Sửa Category</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<div class="container py-5">


    <div
            class="card shadow mx-auto"
            style="max-width: 650px;">


        <div class="card-header bg-warning">


            <h3 class="mb-0">

                Sửa Category

            </h3>


        </div>


        <div class="card-body">


            <c:if test="${not empty error}">


                <div class="alert alert-danger">

                        ${error}

                </div>


            </c:if>


            <form
                    action="${pageContext.request.contextPath}/admin/categories/edit"
                    method="post">


                <input
                        type="hidden"
                        name="categoryId"
                        value="${category.categoryId}">


                <div class="mb-3">


                    <label class="form-label">

                        ID

                    </label>


                    <input
                            type="text"
                            value="${category.categoryId}"
                            class="form-control"
                            readonly>


                </div>


                <div class="mb-3">


                    <label class="form-label">

                        Tên Category

                    </label>


                    <input
                            type="text"
                            name="categoryname"
                            value="${category.categoryname}"
                            class="form-control"
                            required>


                </div>


                <div class="mb-3">


                    <label class="form-label">

                        Images

                    </label>


                    <input
                            type="text"
                            name="images"
                            value="${category.images}"
                            class="form-control">


                </div>


                <div class="mb-3">


                    <label class="form-label">

                        Trạng thái

                    </label>


                    <select
                            name="status"
                            class="form-select">


                        <option
                                value="1"
                                <c:if test="${category.status == 1}">
                                    selected
                                </c:if>>

                            Hoạt động

                        </option>


                        <option
                                value="0"
                                <c:if test="${category.status == 0}">
                                    selected
                                </c:if>>

                            Không hoạt động

                        </option>


                    </select>


                </div>


                <button
                        type="submit"
                        class="btn btn-warning">

                    Cập nhật

                </button>


                <a
                        href="${pageContext.request.contextPath}/admin/categories"
                        class="btn btn-secondary">

                    Quay lại

                </a>


            </form>


        </div>


    </div>


</div>


</body>

</html>