<nav class="navbar">
    <div class="logo">
        <img src="public/imgs/logo/logo.jpeg" alt="Logo de la aplicación">
        <h1>KevsTrx</h1>
    </div>
    
    <div class="nav-links">
    <a href="index.php?page=Inicio_Inicio">Inicio</a>
        <a href="index.php?page=sec_logout">Cerrar Sesión</a>
    </div>
</nav>


<style>
nav {
    padding: 2rem 1rem;
   
    width: 100%;
    backdrop-filter: blur(10px); 
    z-index: 1000;
}
textarea{
    padding: 0 2rem; 
    display: flex;
    align-items: center; 
    justify-items: center; 
    text-align: center; 
}
.navbar {
    display: flex;
    align-items: center;
    justify-content: space-between;

}

.logo img {
    height: 40px; 
}
.logo{
    display: flex; 
    flex-direction: row; 
}
.logo h1{
    margin: auto 2rem; 
}

.nav-links a {
    text-decoration: none;
    border-radius: 5px;
    margin: auto 2rem; 
    transition: background-color 0.3s;
}



</style>
