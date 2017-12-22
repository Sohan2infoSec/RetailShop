<%@page import="Package.DatabaseService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Package.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Detail Product</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </style>
</head>
<body>

    <hr>

    <div class="container-fluid">
        <div class="row content">

            <%
                DatabaseService dao = new DatabaseService();

                ArrayList<Product> listOfProduct = (ArrayList<Product>) session.getAttribute("product");
                for (int i = 0; i < listOfProduct.size(); i++) {
            %>

            <hr>
            <div class="col-sm-9">


                <h2><%=listOfProduct.get(i).getNameProduct()%></h2>
                <h5><button type="submit" class="label label-danger" >dislike</button>  <button type="submit"   class="label label-primary" >Like</button></h5><br>
                <p><%=listOfProduct.get(i).getDescriptionProduct()%></p>

                <br><br>

            </div>
            <div class="col-sm-3 sidenav">
                <div class="panel panel-primary">
                    <div class="panel-heading"><%=listOfProduct.get(i).getNameProduct()%> </div>
                    <div class="panel-body"><img src="<%=listOfProduct.get(i).getImageProduct()%>" class="img-responsive" style="width:100%" alt="Image"></div>
                    <div class="panel-footer">$<%=listOfProduct.get(i).getPriceProduct()%> <form>

                            <button type="submit" name="action" value="addtocard" >Add to cart</button> 
                        </form></div>
                </div>
            </div>

            <div class="col-sm-9">
                <h4>Leave a Comment:</h4>
                <form role="form">
                    <div class="form-group">
                        <textarea class="form-control" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success">Submit</button>
                </form>
                <br><br>

                <p><span class="badge">2</span> Comments:</p><br>

            </div>
        </div>




    </div>
</div>
<footer class="container-fluid text-center">
    <p>Footer Text</p>

</footer>

</body>
</html>
