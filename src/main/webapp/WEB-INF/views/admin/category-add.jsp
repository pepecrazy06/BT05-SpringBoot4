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

    <title>Thêm Category</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<div class="container py-5">


    <div
            class="card shadow mx-auto"
            style="max-width: 650px;">


        <div class="card-header bg-success text-white">


            <h3 class="mb-0">

                Thêm Category

            </h3>


        </div>


        <div class="card-body">


            <c:if test="${not empty error}">


                <div class="alert alert-danger">

                        ${error}

                </div>


            </c:if>


            <form
                    action="${pageContext.request.contextPath}/admin/categories/add"
                    method="post">


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
                            class="form-control"
                            placeholder="Tên file ảnh">


                </div>


                <div class="mb-3">


                    <label class="form-label">

                        Trạng thái

                    </label>


                    <select
                            name="status"
                            class="form-select">


                        <option value="1">

                            Hoạt động

                        </option>


                        <option value="0">

                            Không hoạt động

                        </option>


                    </select>


                </div>


                <button
                        type="submit"
                        class="btn btn-success">

                    Lưu Category

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