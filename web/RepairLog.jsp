<%-- 
    Document   : RepairAssets
    Created on : Mar 21, 2021, 8:17:12 PM
    Author     : Windows10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="eams.utilities.ConnectionProviderToDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Users</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">

        <!-- Style -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



        <script>
            function myFunction() {
                // Declare variables
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("sailorTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>

        <style>
            #myInput {
                background-image: url('/css/searchicon.png'); /* Add a search icon to input */
                background-position: 10px 12px; /* Position the search icon */
                background-repeat: no-repeat; /* Do not repeat the icon image */
                width: 30%; /* Full-width */
                font-size: 16px; /* Increase font-size */
                padding: 12px 20px 12px 40px; /* Add some padding */
                border: 1px solid #ddd; /* Add a grey border */
                /*  margin-bottom: 12px;  Add some space below the input */
            }

            #sailorTable tr:hover  {
                /* Add a grey background color to the table header and on hover */
                background-color: #cc0000;
                color:white;
            }

            .navbar .navbar-nav .nav-link {
                color: #000000;
                font-size: 1.1em;
                position: relative;
            }
            .navbar .navbar-nav .nav-link:hover {
                color: #000000;
            }
            .navbar .navbar-nav .nav-link::after {
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                background-color: #000000;
                color: transparent;
                width: 0%;
                content: '.';
                height: 3px;
            }
            .navbar .navbar-nav .nav-link:hover::after {
                width: 100%;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <img src="https://www.exavalu.com/wp-content/uploads/2019/05/exavaluLogo.png" alt="" width="150" height="50" class="d-inline-block align-mid">
                    ASSET MANAGEMENT
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="AdminHome.jsp" style ="color: white">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#services" style ="color: white">Logout</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div class="table-responsive" id="sailorTableArea">
            <br><br>
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by name..">

            <table id="sailorTable" class="table table-striped table-bordered" width="100%">
                <thead>

                    <tr>
                        <th scope="col">Model No</th>
                        <th scope="col">type</th>
                        <th scope="col">Department</th>
                        <th scope="col">RepairDate</th>
                        <th scope="col">ReturnDate</th>
                        <!--                    <th scope="col">info</th>-->
                    </tr>
                </thead>

                <tbody>
                    <%               // InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/Db_Params.properties");
                        //  System.out.println(inputFile);
                        Connection con = null;
                        try {

                            InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                            con = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                            //  PreparedStatement ps1 = con.prepareStatement("SELECT modelNo, type, department, value, status FROM departmentalasset WHERE status='DEFECTIVE' OR status='ON REPAIR'");
                            PreparedStatement ps1 = con.prepareStatement("SELECT repairlog.modelNo,repairlog.repairDate, repairlog.returnDate,departmentalasset.department,departmentalasset.type FROM repairlog INNER join departmentalasset on departmentalasset.modelNo=repairlog.modelNo");
                            ResultSet rs = ps1.executeQuery();

                            while (rs.next()) {

                    %>

                    <tr>
                        <td><%= rs.getInt("modelNo")%></td>
                        <td><%= rs.getString("type")%></td>
                        <td><%= rs.getString("department")%></td>
                        <td><%= rs.getString("repairDate")%></td>
                        <td><%= rs.getString("returnDate")%></td>




                    </tr>





                    <%}

                        } catch (Exception e) {
                            System.out.println(e);
                        } finally {
                            con.close();
                        }

                        Connection conn = null;
                        try {

                            InputStream inputFile = getServletContext().getResourceAsStream("/WEB-INF/db_params.properties");
                            conn = ConnectionProviderToDB.getConnectionObject().getConnection(inputFile);

                            //  PreparedStatement ps1 = con.prepareStatement("SELECT modelNo, type, department, value, status FROM departmentalasset WHERE status='DEFECTIVE' OR status='ON REPAIR'");
                            PreparedStatement ps1 = conn.prepareStatement("SELECT repairlog.modelNo,repairlog.repairDate, repairlog.returnDate,personalasset.Department,personalasset.type FROM repairlog INNER join personalasset on personalasset.modelNo=repairlog.modelNo");
                            ResultSet rs = ps1.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("modelNo")%></td>
                        <td><%= rs.getString("type")%></td>
                        <td><%= rs.getString("Department")%></td>
                        <td><%= rs.getString("repairDate")%></td>
                        <td><%= rs.getString("returnDate")%></td>





                    </tr>
                    <%
                            }
                            //System.out.println("</table>");  
                            //System.out.println("</html></body>");  
                        } catch (Exception e) {
                            System.out.println(e);
                        } finally {
                            conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>

    <footer class="py-5 bg-dark fixed-bottom">
        <div class="container">
            <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
        </div>
    </footer>

</html>
</body>
</html>