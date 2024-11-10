<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/solid.min.css" 
      integrity="sha512-Hp+WwK4QdKZk9/W0ViDvLunYjFrGJmNDt6sCflZNkjgvNq9mY+0tMbd6tWMiAlcf1OQyqL4gn2rYp7UsfssZPA==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/brands.min.css" 
      integrity="sha512-DJLNx+VLY4aEiEQFjiawXaiceujj5GA7lIY8CHCIGQCBPfsEG0nGz1edb4Jvw1LR7q031zS5PpPqFuPA8ihlRA==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/regular.min.css" 
      integrity="sha512-KYEnM30Gjf5tMbgsrQJsR0FSpufP9S4EiAYi168MvTjK6E83x3r6PTvLPlXYX350/doBXmTFUEnJr/nCsDovuw==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/fontawesome.min.css" 
      integrity="sha512-UuQ/zJlbMVAw/UU8vVBhnI4op+/tFOpQZVT+FormmIEhRSCnJWyHiBbEVgM4Uztsht41f3FzVWgLuwzUqOObKw==" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
<!-- Incluir jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- Incluir DataTables JS desde CDN -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<style>
    :root{
        --primario: #003857;
        --contraste:#f9bf29;

    }

    .btn.btn-primario {
        border: 1px solid var(--primario);
        background-color: var(--primario);
        padding: 4px 20px !important;
    }
    .btn.btn-primario:hover {
        border: 1px solid var(--contraste);
        color: white !important;
        background-color: var(--contraste);
        padding: 4px 20px !important;
    }
    .btn.btn-agregar {
        border: 1px solid var(--primario);
        background-color: var(--primario);
        padding: 4px 20px !important;
    }
    .btn.btn-agregar:hover {
        border: 1px solid var(--contraste);
        background-color: var(--contraste);
    }
    .roboto-thin {
        font-family: "Roboto", sans-serif;
        font-weight: 100;
        font-style: normal;
    }

    .roboto-light {
        font-family: "Roboto", sans-serif;
        font-weight: 300;
        font-style: normal;
    }

    .roboto-regular {
        font-family: "Roboto", sans-serif;
        font-weight: 400;
        font-style: normal;
    }

    .roboto-medium {
        font-family: "Roboto", sans-serif;
        font-weight: 500;
        font-style: normal;
    }

    .roboto-bold {
        font-family: "Roboto", sans-serif;
        font-weight: 700;
        font-style: normal;
    }

    .roboto-black {
        font-family: "Roboto", sans-serif;
        font-weight: 900;
        font-style: normal;
    }

    .roboto-thin-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 100;
        font-style: italic;
    }

    .roboto-light-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 300;
        font-style: italic;
    }

    .roboto-regular-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 400;
        font-style: italic;
    }

    .roboto-medium-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 500;
        font-style: italic;
    }

    .roboto-bold-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 700;
        font-style: italic;
    }

    .roboto-black-italic {
        font-family: "Roboto", sans-serif;
        font-weight: 900;
        font-style: italic;
    }

    body::-webkit-scrollbar {
        width: 8px; /* Tama�o del scroll en vertical */
        background-color: #003857;
        font-family: "Roboto", sans-serif;
    }
    body::-webkit-scrollbar-thumb {
        background: #1c7fa7;
        border-radius: 50px;
        max-height: 50%;
    }
    .overflowing-text {
        white-space: pre-line; /* Mantiene los saltos de l�nea */
        word-wrap: break-word; /* Rompe palabras largas */
        overflow: hidden; /* Oculta el texto que se desborda */
        text-overflow: ellipsis;
    }
    .x-scroll::-webkit-scrollbar {
        background-color: #4b5063!important;
        height: 7px!important;
        padding-top: 20px;
        border-radius: 20px;
    }
    .x-scroll::-webkit-scrollbar-thumb{
        background: #0178c7!important;
        border-radius: 20px!important;
        height: 7px!important;
    }
    .y-scroll::-webkit-scrollbar {
        background-color: #4b5063!important;
        height: 5px!important;
        width: 5px;

    }
    .y-scroll::-webkit-scrollbar-thumb{
        background: #0178c7!important;
        border-radius: 20px!important;
        width: 5px;
    }

    .scroll-y-tabla::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        width: 5px;

    }
    .dataTables_scrollBody::-webkit-scrollbar {
        background-color: #4b5063!important;
        height: 5px!important;
        width: 5px!important;
    }
    .dataTables_scrollBody::-webkit-scrollbar-thumb{
        background: #0178c7!important;
        border-radius: 20px!important;
        height: 5px!important;
        width: 5px!important;
    }
    .dataTables_scroll::-webkit-scrollbar {
        background-color: #4b5063!important;
        height: 5px!important;
        width: 5px!important;
    }
    .dataTables_scroll::-webkit-scrollbar-thumb {
        background: #0178c7!important;
        border-radius: 20px!important;
        height: 5px!important;
        width: 5px!important;
    }
    .tabla-citas::-webkit-scrollbar {
        background-color: #4b5063;
        height: 5px;
        width: 5px;
    }
    .tabla-citas::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        height: 5px;
        width: 5px;
    }
    .carrito::-webkit-scrollbar {
        background-color: #a4a6af;
        width: 3px;
        height: 5px;
    }
    .carrito::-webkit-scrollbar-thumb {
        background: #0178c7;
        border-radius: 20px;
        height: 5px;
        width: 5px;
    }

    .container {
        width: 95%;
        max-width: 1200px;
        margin: 0 auto;
    }

    .salto {
        overflow-wrap: break-word !important; /* Para navegadores modernos */
        word-wrap: break-word !important;
    }

    @media screen and (min-width: 990px) {
        .bgservicio {
            background: url("./images/bg-desktop-img.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }
    }
    @media screen and (min-width: 2280px) {
        .bgservicio {
            background: url("./images/bg-desktop-img2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 45rem;
            background-position: right center;
        }
    }
    .bg-secondary-800{
        background-color:#1A1C23!important;
        background-color:#003857!important;
    }
    table{
        border-collapse: collapse!important;
    }
    table.dataTable{
        margin:0 0 auto!important;
    }
    .dataTables_scroll{
        overflow-x: auto!important;
    }

    .dataTables_scrollBody{
        overflow:hidden!important;
        overflow-y:auto!important;
        min-width: 70rem;
    }
    .dataTables_scrollHead{
        min-width: 70rem;
    }
    .dataTable tbody{
        height:50px!important;
        max-height:410px!important;
        overflow-y: auto!important;
    }
    .dataTable {
        width: 100%!important;
    }
    .dataTables_length label,.dataTables_filter label{
        color: white!important;
    }
    .dataTables_filter,.dataTables_length{
        margin-bottom: 15px;
    }
    .dataTables_length select option{
        color: black!important;
    }
    .dataTables_scrollHeadInner,.dataTables_scrollHeadInner table{
        width: 100%!important;
    }
    .container-fluid{
        max-width: 1200px;
    }
    .dataTables_empty{
        background-color: #1A1C23;
        color:white;
    }
    .section_gap {
        padding: 50px 0;
    }
    .features-inner {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        padding: 40px 0;
        background-color: white;
    }

    .single-features {
        text-align: center;
        border-right: 1px solid #eeeeee !important;
    }
    .single-features .f-icon {
        margin-bottom: 20px;
        font-size: 2rem;
    }
    .features-area .col-lg-3:last-child .single-features {
        border-right: 0 !important;
    }
    .single-features:hover .f-icon {
        color: var(--primario);
    }
    @media (max-width: 991px) {
        .single-features {
            border-right: none !important;
            margin-bottom: 30px;
        }
    }

    img{
        margin:  0 auto;
    }
    .img-fluid {
        max-width: 100px;
        height: auto;
    }
    .hero {
        padding: calc(4rem - 30px) 0 0rem 0;
    }
    .hero .hero-img-wrap img {
        position: relative;
        top: 0px;
        z-index: 2;
        max-width: 380px;
    }

    .intro-excerpt {
        align-items: center;
        justify-content: center;
        display: flex;
        flex-direction: column;
        text-align: center;
    }
    .hero .hero-img-wrap {
        position: relative;
    }

    .hero2 .hero-img-wrap img {
        position: relative;
        top: 0px;
        z-index: 2;
        max-width: 230px;
    }
    @media screen and (min-width: 360px) {
        .hero .hero-img-wrap img {
            max-width: 480px;
        }
        .hero2 .hero-img-wrap img {
            max-width: 320px;
        }
    }
    @media screen and (min-width: 460px) {
        .hero .hero-img-wrap img {
            max-width: 680px;
        }
        .hero2 .hero-img-wrap img {
            max-width: 380px;
        }
    }
    @media (min-width: 768px) {
        .hero .hero-img-wrap img {
            max-width: 780px;
        }
        .hero2 .hero-img-wrap img {
            max-width: 780px;
        }
        .hero {
            padding: calc(4rem - 30px) 0 4rem 0;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
        }
    }
    @media (min-width: 1024px) {
        .intro-excerpt {
            display: flex;
            align-items: start;
            justify-content: start;
            flex-direction: column;
            text-align: start;
        }
        .img-fluid {
            max-width: 100%;
            height: auto;
        }
        .hero {
            padding: calc(8rem - 30px) 0 8rem 0;
        }
        .hero .hero-img-wrap img {
            left: 0px;
            top: -80px;
            position: absolute;
            right: -50px;
        }
    }
    @media (min-width: 1200px) {
        .hero .hero-img-wrap img {
            left: 0px;
            top: -80px;
            right: -100px;
        }
    }
    .bg-image {
        background-image: url("../img/bg-desktop.png");
        background-size: cover;
        background-position: center center;
        background-repeat: no-repeat;
    }
    .bg-neutral-3000{
        background-color:  rgb(212 212 212 / var(--tw-bg-opacity))!important;
    }
    .dataTables_length label, .dataTables_filter label {
        color: black!important;
    }
    .dataTables_wrapper .dataTables_filter input {
        outline:none;
        border: 1px solid gray;
    }
    .dataTables_wrapper .dataTables_filter input:focus {
        border: 1px solid black;
    }
    .dataTables_wrapper.no-footer .dataTables_scrollBody {
        border-bottom: none !important;
    }
    table.dataTable.no-footer {
        border-bottom: none !important;
    }
    table.dataTable thead th, table.dataTable thead td {

        border-bottom: none!important;
    }
    .dataTables_scrollBody{
        padding-right: 1px!important;
    }
    .dataTables_scroll {
        border:1px solid rgb(120 113 108)!important;
        border-radius: 0.375rem;
    }
</style>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    "primario": "#003857",
                    "primario-200": "#176B8D",
                    "primario-400": "#1C7FA7",
                    "primario-500": "#05517A",
                    "primario-600": "#004266",
                    "primario-800": "#10466A",
                    "secundario": "#f9bf29",
                    "secundario-500": "#c99718",
                    "primary-100": "#2B9CE6",
                    "primary-200": "#0185DC",
                    "primary-300": "#0178C7",
                    "secondary-300": "#6c7293",
                    "secondary-800": "#10466A", //
                    "secondary-900": "#003857", //"#003857"
                    "contrast-600": "#7E3AF2",
                    "contrast-800": "#6816EF",
                    "black-50": "#00000045",
                    "black-20": "#00000025"
                },
                fontFamily: {
                    raleway: "'Raleway', sans-serif"
                },
                boxShadow: {
                    "e-top":
                            " 0px 3px 4px -2px rgb(0 0 0 / 0.1), 0px 2px 4px -2px rgb(0 0 0 / 0.1)",
                    md: " 0px 0px 4px -2px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)"
                },
                screens: {
                    xs: "480px"
                }
            }
        }
    };

    const clickLogButton = () => {
        const logbutton = document.getElementById('logbutton');
        logbutton.classList.toggle('hidden');
    };


</script>