<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Base') }}</title>

    <!-- Scripts -->
    <script src="{{ mix('js/manifest.js') }}" defer></script>
    <script src="{{ mix('js/vendor.js') }}" defer></script>
    <script src="{{ mix('js/app.js') }}" defer></script>
    <script src="{{ mix('js/sidebar.js') }}" defer></script>
    @auth
        <script src="{{ mix('js/dropdown.js') }}" defer></script>
    @endauth

    <!-- Styles -->
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">

    <!-- Favicon -->
    <link rel="icon" href="{{ asset('img/Favicon.png') }}">
    @yield('css')

    @yield('header')
</head>

<body>
    <div id="app" class="app-container">
        <aside class="animate__animated animate__faster aside">
            <div class="top">
                <div class="logo">
                    <img src="{{ asset('logos/logo.svg') }}" alt="" />
                </div>
                <div class="close close-btn">
                    <a href="#">
                        <span class="material-icons"> close </span>
                    </a>
                </div>
            </div>

            <div class="sidebar">
                @auth
                    <a href="/home" class="option-menu">
                        <span class="material-icons">dashboard</span>
                        <h3>Inicio</h3>
                    </a>

                    {{-- Administración --}}
                    <li class="dropdown-sidebar">
                        <a href="#" class=" option-menu">
                            <span class="material-icons">settings</span>
                            <h3>Administración</h3>
                        </a>
                        <ul class="sub-menu animate__animated animate__faster animate__fadeIn">
                            <li><a href="{{ url('/role') }}">Roles</a></li>
                            <li><a href="{{ url('/user') }}">Usuarios</a></li>
                        </ul>
                    </li>
                    {{-- Administración --}}
                @endauth
                @guest
                    <a href="/login" class="active option-menu">
                        <span class="material-icons">login</span>
                        <h3>Iniciar sesión</h3>
                    </a>
                    {{-- Fake button --}}
                    <a href="#" class="option-menu d-none">
                        <span class="material-icons"></span>
                        <h3></h3>
                    </a>
                @endguest
            </div>
        </aside>

        <!-- Main -->
        <main>
            <nav>
                <div class="navbar">
                    <div class="nav-left">
                        <div class="menu">
                            <a href="#">
                                <span class="material-icons">menu</span>
                            </a>
                        </div>
                        <div class="title">
                            <h1>{{ config('app.name') }}</h1>
                        </div>
                    </div>
                    <div class="nav-right">
                        @auth
                            <div class="user d-none d-md-block d-lg-block d-xl-block">
                                <a href="#" class="user-btn">
                                    <img src="/img/sheen.webp" alt="" />
                                    <span class="material-icons">expand_more</span>
                                </a>
                                <div class="dropdown-list animate__animated animate__faster">
                                    <ul>
                                        <li class="profile-nav">
                                            <img class="mx-auto" src="/img/sheen.webp" alt="avatar" />
                                            <h2 class="text-center">{{ auth()->user()->name }}</h2>
                                            <h4 class="text-muted text-center">Administrador</h4>
                                            <hr />
                                        </li>
                                        <li class="p-0">
                                            <a href="{{ route('logout') }}" class="option"
                                                onclick="event.preventDefault();document.getElementById('logout-form').submit();">Cerrar
                                                sesión</a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                                class="d-none">
                                                @csrf
                                            </form>
                                    </ul>
                                </div>
                            </div>
                        @endauth
                    </div>
                </div>
            </nav>

            @yield('content')
        </main>
        <!-- Main -->

        <!-- Footer  -->
        <footer>
            <div class="footer-title">
                <h5>{{ config('app.name') }} &copy 2022</h5>
            </div>
            <span class="text-muted">Todos los derechos reservados.</span>
        </footer>
        <!-- Footer  -->
    </div>

    <!-- Scripts -->
    @yield('scripts')
</body>

</html>
