<h1 class="center">{{SITE_TITLE}}</h1>

<style>
    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f0f0;
        font-family: 'Roboto', sans-serif; 
    }

    .button-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 50px; 
    }

    .big-button {
        display: flex;
        flex-direction: column; 
        justify-content: center;
        align-items: center;
        width: 400px;  
        height: 200px; 
        background-color: #007BFF;
        color: #FFFFFF; 
        border: none;
        font-size: 28px; 
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        position: relative;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); 
    }

    .big-button img {
        max-width: 100px; 
        max-height: 100px; 
        margin-bottom: 10px;
    }

    .big-button:hover {
        background-color: #0056b3;
    }

    footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        text-align: center;
        background-color: #007BFF;
        color: #FFFFFF;
        padding: 10px 0;
    }
    @media screen and (min-width: 768px) {
  .grid-container {
    grid-template-columns: 2fr 1fr; /* Dos columnas en pantallas más grandes */
  }
}
    </style>
</head>
<body>
    <div class="button-container">
        <a href="index.php?page=Tienda_Tienda" class="big-button"><img src="/asdasd/public/imgs/utilities/discount.png"><span>Descuentos</span></a>
        <a href="index.php?page=Usuarios_Usuario" class="big-button"><img src="/asdasd/public/imgs/utilities/man.png"><span>Usuarios</span></a>
        <a href="index.php?page=Productss_Products" class="big-button"><img src="/asdasd/public/imgs/utilities/box.png"><span>Productos</span></a>
        <a href="index.php?page=Roless_Roles" class="big-button"><img src="/asdasd/public/imgs/utilities/management.png"><span>Roles</span></a>
    </div>