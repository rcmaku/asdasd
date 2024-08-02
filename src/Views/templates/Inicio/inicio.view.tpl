<div class="grid-container">

  <section class="grid1">
    {{ifnot ~isClient}}
<h2>Bienvenido</h2>
<h3>Menu Administrativo: </h3>
<ul>
<li>Funciones y Roles: <a href="index.php?page=Funcioness_Funciones"> Ir a menu </a></li>
<li>Bitacora: <a href="index.php?page=Bitacoras_Bitacora"> Ir a menu </a></li>
<li>Funciones: <a href="index.php?page=Funcioness_Funciones"> Ir a menu </a></li>
<li>Productos: <a href="index.php?page=Productss_Products"> Ir a menu </a></li>
<li>Compras: <a href="index.php?page=Purchases_Purchase"> Ir a menu </a></li>
<li>Detalle Compras: <a href="index.php?page=Purchasedetails_Purchasedetail"> Ir a menu </a></li>
<li>Roles: <a href="index.php?page=Roless_Roles"> Ir a menu </a></li>
<li>Roles de Usuarios: <a href="index.php?page=Rolesusuarioss_Rolesusuarios"> Ir a menu </a></li>
<li>Usuarios: <a href="index.php?page=Usuarios_Usuario"> Ir a menu </a></li>
</ul>
{{endifnot ~isClient}}
 {{if ~isClient}}
 <div class="hero-banner">
  <h2>Aquí siempre tenemos música para ti</h2>
  <p>Infinitas posibilidades de canciones que <span>amarás</span></p>
</div>
<div>
<h2>Musica que arde🔥🔥🔥🔥</h2>
<hr>
</div>

<section class="products-list">
  {{foreach productos}}
<article id={{productId}}>
<img src={{productImgUrl}}></img>
<h3>{{productName}}</h3>
  <p>{{productDescription}}</p>
  <p>$<span>{{productPrice}}</span></p>
<form method="POST" action="index.php?page=Inicio_Inicio">
    <input type="hidden" name="xsxtoken" value="{{~token}}">
    <input type="hidden" name="productId" value="{{productId}}">
    <input type="hidden" name="productName" value="{{productName}}">
    <input type="hidden" name="productDescription" value="{{productDescription}}">
    <input type="hidden" name="productPrice" value="{{productPrice}}">
    <label for="productQuantity">Cantidad a compra:</label>
    <input type="number" id="productQuantity" name="productQuantity" min="0" placeholder="Cantidad" required>
    
    <button type="submit" name="addToCart">Agregar al carrito</button>
</form>


</article>
  {{endfor productos}}
{{endif ~isClient}}

</section>

  </section>
  <div class="profile">
    <h2>Tu Perfil</h2>
    <hr>
    <img id="profile" src="public/imgs/profile/profile.png">
    <h3>Datos personales</h3>
    <p> Correo: <span>{{useremail}}</span></p>
     <p>Nombre de Usuario <span>{{username}}</span></p>
{{ifnot ~isClient}}
     <p>Rol <span>Administrador</span></p>
     {{endifnot ~isClient}}
    {{if ~isClient}}
<hr>
    <section>
        <h2>Tus Compras</h2>
       
         <table border="1">
        <tr>
          <th>Fecha de Compra</th>
          <th>ID de Compra</th>
          <th>Detalles</th>
          <th>Total</th>
        </tr>
        
         {{foreach compras}}
         <tr>
          <td>{{purchase_date}}</td>
          <td>{{id_purchase}}</td>
          <td>{{details}}</td>
          <td>{{total}}</td>
           </tr>
          {{endfor compras}}
       
      </table>
        
    </section>
    {{endif ~isClient}}
      
  </div>
</div>
{{if ~isClient}}
  {{include components/shopping}}
  
{{endif ~isClient}}
<style>
table {
    max-width: 30%;
    border-collapse: collapse;
}

table td, table thead {
    border: 1px solid black;
    max-width: 200px;
    word-wrap: break-word;
    overflow-wrap: break-word; 
}

body
{

  background-image: linear-gradient(135deg, rgba(0, 0, 255, 0.3) 0%, rgba(0, 0, 255, 0) 30%);
  height:100vh;
  background-size: cover;
  background-position: center;
}
    #profile{
        width: 100px;
        height: 100px;
    }
.products-list {
  display: grid;
  
  grid-template-columns: 1fr 1fr; 
   grid-gap: 1rem; 
  }
  article:hover{
animation: pulse 2s infinite alternate;
}
 
article{
  padding:2rem;
   }

.grid-container {
  display: grid;
  margin: 6rem 3rem; 
  grid-template-columns: 1fr; 
  grid-gap: 1rem; 
}

.hero-banner {
  background-image: url('public/imgs/hero/hero5.png'); 
  height: 40vh; 
  background-size: cover;
  background-position: center;
  color: white;
  text-align: center;
  padding: 4rem 0; }


.hero-banner h1 {
  font-size: 36px; /* Tamaño del texto */
  font-weight: bold;
  margin: auto; 
}

/* Estilos para la primera columna */
.grid1 {
  
  padding: 20px; /* Espaciado interno */
}

/* Estilos para la segunda columna */
.profile {
   
  padding: 20px; /* Espaciado interno */
}

/* Media query para dispositivos de pantalla más grandes */
@media screen and (min-width: 768px) {
  .grid-container {
    grid-template-columns: 2fr 1fr; /* Dos columnas en pantallas más grandes */
  }
}

</style>
