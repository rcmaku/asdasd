<button id="openModal" class="floating-button"  onclick="openModal()">
  <img src="public/imgs/shopping/shopping-bag.png">
</button>

<div id="modal" class="modal">
  <div class="modal-content">
   <span class="close" onclick="closeModal()">&times;</span>

    <h2>Carrito de compras</h2>
    <hr>
   {{ifnot ~isEmpty}}
    <h3>Opciones</h3>
    <div class="opciones_carrito">
 <form action="index.php?page=Inicio_Inicio" method="POST">
                  <button type="submit" name="deleteButton">Eliminar mis datos</button>
      </form>
                  <form action="index.php?page=Checkout_Checkout" method="POST">
              <button type="submit">
                Realizar Compra
              </button>
            </form>
    </div>
  
    <hr>
    <h3>Total a pagar: <span>{{total_products}} </span></h3>
    <p>Cantidad de productos: {{quantity}}</p>
    <p>Contenido del carrito de compras...</p>
     <table>
     
    
  <tr>
    <thead>
    <tr>
      <th>Producto</th>
      <th>Cantidad</th>
      <th>Precio</th>
      <th>Fecha</th>
    </tr>
  </thead>
 <tbody>
   {{foreach products}}

    <tr>
      <td>
        <p>{{productName}}</p>
      </td>
      <td>
        <p> {{crrctd}}</p>
      
      </td>
      <td>     
        <p>{{crrprc}}</p>
      </td>
      <td>
      <p>{{crrfching}}</p>
      </td>
    </tr>
       {{endfor products}}
  </tbody>

</table>

       {{endifnot ~isEmpty}}
       {{if ~isEmpty}}
       <h3>Ningun producto agregado</h3>
        {{endif ~isEmpty}}
  </div>
</div>

<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 20px;
  width: 100%;
  height: 100%;
  overflow: auto;
  backdrop:blur
  background-color: rgba(0,0,0,0.4); /* Transparencia */
}
.opciones_carrito
{
  display: flex;
  padding: 2rem;
  justify-content: space-around;
}
.modal:hover{
  animation: pulse 2s infinite alternate;
}
.modal-content {
  
  margin: 15% auto;
  padding: 4rem;
  backdrop-filter: blur(5rem);
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.floating-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  height: 50px;
  width: 50px; 
  background-color: white;
  border-radius: 25px; /* Reducido el radio para hacerlo más ovalado */
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;
  text-decoration: none;
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
  cursor: pointer; 
}

.floating-button img {
  width: 35px; /* Ajustado el tamaño del ícono */
  height: 35px;
  display: block; 
  margin: auto; 
}

.floating-button p {
  margin: 0; /* Eliminado el margen predeterminado del párrafo */
}
</style>

<script>
var modal = document.getElementById('modal');
var openModalBtn = document.getElementById('openModal');
var closeModalBtn = document.getElementsByClassName('close')[0];

function closeModal() {
  modal.style.display = 'none';
}
function openModal()
{
  modal.style.display = 'block';
}
// Función para abrir el modal
openModalBtn.onclick = function() {
  modal.style.display = 'block';
}

</script>

