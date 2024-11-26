<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Transportes</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
</head>

<h1 class="text-black text-4xl font-bold">Agregar Transporte</h1>

<form action="/transporte/add" method="post" class="max-w-[50rem] bg-trasparent text-black my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="placa" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Placa: </label>
            <input id="placa" name="placa" type="text" class="bg-transparent outline-none font-sans 
                   px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="modelo" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Modelo:</label>
            <input id="modelo" name="modelo" type="text" class="bg-transparent outline-none font-sans 
                   px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
        </div>
    </div>
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="marca" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Marca:</label>
            <input id="marca" name="marca" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
        </div> 
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="descripcion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Descripcion:</label>
            <input id="descripcion" name="descripcion" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
        </div> 
    </div>
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a  href="/admin?pagina=transporte" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
            px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Registrar</button>
    </div>
</form>
