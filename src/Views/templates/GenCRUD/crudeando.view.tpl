<div class="flex justify-center items-center h-screen bg-gray-100">
    <div class="max-w-md bg-white p-6 rounded-md items-center shadow-md">
        <h1 class="text-2xl font-bold mb-4">Ingrese el nombre de la tabla de SQL</h1>
        <form action="index.php?page=GenCRUD_GenerarCRUD" method="POST">
            <div class="mb-4">
                <label for="nombre_tabla" class="block text-gray-700 text-sm font-bold mb-2">Nombre de la Tabla:</label>
                <input type="text" id="nombre_tabla" name="nombre_tabla" required
                    class="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <div class="mt-6">
                <button type="submit" name="generate" value="Enviar"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded
                           focus:outline-none focus:shadow-outline">
                    Generate
                </button>
            </div>
        </form>
    </div>
</div>
