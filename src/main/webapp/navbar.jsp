
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Toggle button -->
        <button id="toggler" style="color: white;" class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation" onclick="IsToggler()">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navbar brand -->

            <a style="color: white;" class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/resouces/favicon/favicon-32x32.png" class="img-fluid" alt="Logo"/>
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a style="color: white;" class="nav-link" href="/food/list">Menu</a>
                </li>

                <li class="nav-item" style="display: <%= request.getSession().getAttribute("admin") == null ? "none" : "inline"%>">
                    <a style="color: white;" class="nav-link" href="/admin">Manager</a>
                </li>
            </ul>
            <!-- Left links -->
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div id="information" style="display: block;">
            <div class="d-flex align-items-center">
                <!-- Icon -->
                <a class="link-secondary me-3" href="/order">
                    <span class="badge badge-pill bg-danger"></span>
                    <i class="fas fa-shopping-cart"></i>
                </a>

                <div class="dropdown">
                    <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#"
                       id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown"
                       aria-expanded="false">
                        <img src="https://www.pngitem.com/pimgs/m/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png"
                             class="rounded-circle" height="25" alt="Black and White Portrait of a Man"
                             loading="lazy" />
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                        <li>
                            <a class="dropdown-item" href="/employee/infor">My profile</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/account/signout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Right elements -->
    </div>
    <!-- Container wrapper -->
</nav>

