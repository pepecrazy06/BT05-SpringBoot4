<%@ page
        contentType="text/html;charset=UTF-8"
        language="java" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

</head>


<body class="bg-light">


<div class="container py-5">


    <div class="card shadow">


        <div class="card-header bg-dark text-white">

            <h2 class="mb-0">

                ADMIN DASHBOARD

            </h2>

        </div>


        <div class="card-body">


            <h5 class="mb-4">

                Quản lý hệ thống

            </h5>


            <div class="row g-3">


                <div class="col-md-6">

                    <a
                            href="${pageContext.request.contextPath}/admin/categories"
                            class="btn btn-success w-100 py-4">

                        Quản lý Category

                    </a>

                </div>


                <div class="col-md-6">

                    <a
                            href="${pageContext.request.contextPath}/admin/users"
                            class="btn btn-primary w-100 py-4">

                        Quản lý User

                    </a>

                </div>


            </div>


        </div>


    </div>


</div>


</body>

</html>