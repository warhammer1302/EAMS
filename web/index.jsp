<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Scrolling Nav - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/scrolling-nav.css" rel="stylesheet">

    </head>

    <style>
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
                            <a class="nav-link js-scroll-trigger" href="#about" style ="color: white">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#services" style ="color: white">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link js-scroll-trigger" href="#contact" style ="color: white">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="bg text-white" style ="background-image: url(https://source.unsplash.com/1600x400/?technology,computer)">
            <div class="container text-center">
                <h1>Welcome to EAMS</h1>
                <p class="lead">A website dedicated to managing your assets</p>
                <button type="button" class="btn btn-danger" onclick="window.location = 'Login.jsp'">Login</button>
                <button type="button" class="btn btn-secondary" onclick="window.location = 'Register.jsp'">Register</button>
            </div>
        </header>

        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>About this page</h2>
                        <p class="lead">Welcome to Enterprise Asset Management System! We help you manage your assets in just a few clicks. Our web site features:</p>
                        <ul>
                            <li>User friendly design</li>
                            <li>Smooth dynamic contents</li>
                            <li>Multiple features for both admin and users</li>
                            <li>Soothing tabular display</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section id="services" class="bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Services we offer</h2>
                        <p class="lead">We help you add and remove your assets, allocate and deallocate assets to users and keep track of your assets.</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2>Contact us</h2>
                        <p class="lead">You can contact us via our email address - Team3@exavalu.com</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Team3@exavalu</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom JavaScript for this theme -->
        <script src="js/scrolling-nav.js"></script>

    </body>

</html>
