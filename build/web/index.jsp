<%@page import="Package.Product"%>
<%@page import="Package.DatabaseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Package.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Nam Food Shop Homepage</title>


        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

        <link href="Source/css/agency.css" rel="stylesheet" type="text/css"/>
        <link href="Source/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="Source/css/font-awesome.css" rel="stylesheet" type="text/css"/>

        <style>
            a.logo{
                text-shadow: 2px 0 black, -2px 0 black, 0 2px black, 0 -2px black, 1px 1px black, -1px -1px black, -1px 1px black, 1px -1px black;
            }
            .logoutButton{
                border-radius: 6px;
            }
        </style>

    </head>

    <body id="page-top">
        <%
            DatabaseService dao = new DatabaseService();
            session.setAttribute("listProduct", dao.getAllProduct());
//            session.setAttribute("listUser", dao.getAllUser());
//            session.setAttribute("listSearchedUser", dao.getUser(1));
        %>




        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger logo" href="#page-top">Nam Food Shop</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#page-top">Main Page</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#product">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="manageUser.jsp" name="action" value="ManageUser">Member</a>
                        </li>
                        <%
                            if (session.getAttribute("admin") == null && session.getAttribute("user") == null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="loginPage.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="loginPage.jsp">Login</a>
                        </li>
                        <%
                        } else {
                        %>

                        <li class="nav-item">
                            <form role="form" action="logout" method="post" class="nav-link js-scroll-trigger">
                                <input type="submit" value="Logout" class="logoutButton">
                            </form>
                        </li>
                        <%
                            }
                        %>




                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <header class="masthead">
            <div class="container">
                <div class="intro-text">
                    <div class="intro-lead-in">Welcome To Nam's Food Shop :) !</div>
                    <div class="intro-heading text-uppercase">It's Nice To Meet You</div>
                    <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#product">Tell Me More</a>
                </div>
            </div>
        </header>

        <div class="container">

            <div class="row">

                <div class="col-lg-3">

                    <h1 class="my-4"><a name="product">Food Gallery</a></h1>
                    <div class="list-group">
                        <a href="#" class="list-group-item">All</a>
                        <a href="#" class="list-group-item">Rice</a>
                        <a href="#" class="list-group-item">Seafood</a>
                        <a href="#" class="list-group-item">Fast food</a>
                        <a href="#" class="list-group-item">Pancake</a>
                        <a href="#" class="list-group-item">Drink</a>

                    </div>

                </div>

                <div class="col-lg-9">

                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="Source/img/product1.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="Source/img/product2.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="Source/img/product3.jpg" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row">
                        <%--
                                                <%
                                            ArrayList<ProductDTO> listOfproduct = (ArrayList<ProductDTO>) session.getAttribute("ln");
                                            for (int i = 0; i < listOfproduct.size(); i++) {
                                        %>


                <a href="/SEproject/ProductController?viewproducts=<%=i%>&action=details" > <div class="col-sm-4">
                        <img src="<%=listOfproduct.get(i).getProimg()%>" class="img-responsive" style="size: 100%" alt="Image">
                        <p><%=listOfproduct.get(i).getProname()%></p>
                    </div></a> <% }%>
                    
                        --%>


                        <%
                            ArrayList<Product> listOfProduct = (ArrayList<Product>) session.getAttribute("listProduct");
                            for (int i = 0; i < listOfProduct.size(); i++) {
                        %>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="/RetailShop/ControllerUser?viewproducts=<%=i+1%>&action=details"><img class="card-img-top" src="<%=listOfProduct.get(i).getImageProduct()%>" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#"><%=listOfProduct.get(i).getNameProduct()%></a>
                                    </h4>

                                    <p class="card-text"><%=listOfProduct.get(i).getDescriptionProduct()%></p>
                                </div>
                                <div class="card-footer">
                                    <h5>$<%=listOfProduct.get(i).getPriceProduct()%></h5>
                                    <!--<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>-->
                                </div>
                            </div>
                        </div>

                        <% }%>


                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
        <br>



        <%
            System.out.println("Test");
        %>



        <br>
    </div>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <script src="Source/js/jquery.js" type="text/javascript"></script>
    <script src="Source/js/bootstrap.bundle.js" type="text/javascript"></script>
    <script src="Source/js/jquery.easing.js" type="text/javascript"></script>
    <script src="Source/js/agency.js" type="text/javascript"></script>



</body>

</html>
