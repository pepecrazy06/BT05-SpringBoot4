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

    <title>Sửa User</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<div class="container py-5">


    <div
            class="card shadow mx-auto"
            style="max-width: 750px;">


        <div class="card-header bg-warning">


            <h3 class="mb-0">

                Sửa User

            </h3>


        </div>


        <div class="card-body">


            <c:if test="${not empty error}">

                <div class="alert alert-danger">

                        ${error}

                </div>

            </c:if>


            <form
                    action="${pageContext.request.contextPath}/admin/users/edit"
                    method="post">


                <input
                        type="hidden"
                        name="id"
                        value="${user.id}">


                <div class="mb-3">

                    <label class="form-label">

                        ID

                    </label>

                    <input
                            type="text"
                            value="${user.id}"
                            class="form-control"
                            readonly>

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Username

                    </label>

                    <input
                            type="text"
                            name="username"
                            value="${user.username}"
                            class="form-control"
                            required>

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Email

                    </label>

                    <input
                            type="email"
                            name="email"
                            value="${user.email}"
                            class="form-control"
                            required>

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Fullname

                    </label>

                    <input
                            type="text"
                            name="fullname"
                            value="${user.fullname}"
                            class="form-control">

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Password mới

                    </label>

                    <input
                            type="password"
                            name="password"
                            class="form-control"
                            placeholder="Để trống nếu không đổi password">

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Phone

                    </label>

                    <input
                            type="text"
                            name="phone"
                            value="${user.phone}"
                            class="form-control">

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Avatar

                    </label>

                    <input
                            type="text"
                            name="avatar"
                            value="${user.avatar}"
                            class="form-control">

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Role

                    </label>

                    <select
                            name="roleid"
                            class="form-select">


                        <option
                                value="1"
                                <c:if test="${user.roleid == 1}">
                                    selected
                                </c:if>>

                            Admin

                        </option>


                        <option
                                value="2"
                                <c:if test="${user.roleid == 2}">
                                    selected
                                </c:if>>

                            User

                        </option>


                    </select>

                </div>


                <div class="mb-3">

                    <label class="form-label">

                        Trạng thái

                    </label>

                    <select
                            name="active"
                            class="form-select">


                        <option
                                value="true"
                                <c:if test="${user.active}">
                                    selected
                                </c:if>>

                            Active

                        </option>


                        <option
                                value="false"
                                <c:if test="${not user.active}">
                                    selected
                                </c:if>>

                            Inactive

                        </option>


                    </select>

                </div>


                <button
                        type="submit"
                        class="btn btn-warning">

                    Cập nhật

                </button>


                <a
                        href="${pageContext.request.contextPath}/admin/users"
                        class="btn btn-secondary">

                    Quay lại

                </a>


            </form>


        </div>


    </div>


</div>


</body>

</html>