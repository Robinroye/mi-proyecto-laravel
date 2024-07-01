<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    @vite(['resources/css/index.css'])
</head>

<body>
    <header>
        <section class="header-logo justify-content-center align-items-enter">
            <img src="{{ asset('images/logoR.png') }}" alt="Logo">
        </section>
        <section class="buscar">
            <input type="texto" placeholder="Buscar" required>
            <div class="btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
            </div>

        </section>
        <section class="header-help">
            <div class="ayuda">
            <i class="bi bi-question-circle fs-1"></i>
                <figcaption>Ayuda</figcaption>
            </div>
            <div class="carrito">
            <i class="bi bi-cart fs-1"></i>
                <figcaption>Carrito</figcaption>
            </div>
        </section>
    </header>
    <!-- <section class="navegation"> -->
        <nav>
            <ul class="nav nav-tabs servi" id="myTab" role="tablist">
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('index') }}"> Home</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('variedades') }}"> Variedades</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('giros') }}"> Giros</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('tramites') }}"> Tramites</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('carrito') }}"> Carrito</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('encuentranos') }}"> Encuentranos</a></li>
                <li class="serviciosR nav-item" role="presentation"><a class="rounded" href="{{ route('contacto') }}"> Contacto</a></li> 
            </ul>
        </nav>
   <!--  </section> -->
    @yield('content')
</body>

</html>