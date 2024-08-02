<div class="container">
  <div class="row">
    <div class="col-12">
      <div class="row">

        {{foreach productos}}
        <div class="col-4">
          <div class="grid-item">
            <article id={{productId}}>
              <div class="card">
                <img src="/asdasd/public/imgs/hero/{{productImgUrl}}" class="card-img-top" alt="{{productName}}">
                <h3>{{productName}}</h3>
                <p>$<span>{{productPrice}}</span></p>
              </div>
              <form method="POST" action="index.php?page=Tienda_Tienda">
                <input type="hidden" name="xsxtoken" value="{{~token}}">
                <input type="hidden" name="productId" value="{{productId}}">
                <input type="hidden" name="productName" value="{{productName}}">
                <input type="hidden" name="productDescription" value="{{productDescription}}">
                <input type="hidden" name="productPrice" value="{{productPrice}}">
                <div class="col-12" name="submitInfo">
                  <label for="productQuantity">Cantidad a compra:</label>
                  <br>
                  <div id="cartManip">
                    <input class="col-2 margin-right 10px" type="number" id="productQuantity" name="productQuantity"
                      min="0" placeholder="###" required>
                    <button type="submit" name="addToCart" id="addToCart"><svg width="40px" height="40px"
                        viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="#000000"
                        stroke-width="0.504">
                        <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                        <g id="SVGRepo_iconCarrier">
                          <path fill-rule="evenodd" clip-rule="evenodd"
                            d="M14 2C14 1.44772 13.5523 1 13 1C12.4477 1 12 1.44772 12 2V8.58579L9.70711 6.29289C9.31658 5.90237 8.68342 5.90237 8.29289 6.29289C7.90237 6.68342 7.90237 7.31658 8.29289 7.70711L12.2929 11.7071C12.6834 12.0976 13.3166 12.0976 13.7071 11.7071L17.7071 7.70711C18.0976 7.31658 18.0976 6.68342 17.7071 6.29289C17.3166 5.90237 16.6834 5.90237 16.2929 6.29289L14 8.58579V2ZM1 3C1 2.44772 1.44772 2 2 2H2.47241C3.82526 2 5.01074 2.90547 5.3667 4.21065L5.78295 5.73688L7.7638 13H18.236L20.2152 5.73709C20.3604 5.20423 20.9101 4.88998 21.4429 5.03518C21.9758 5.18038 22.29 5.73006 22.1448 6.26291L20.1657 13.5258C19.9285 14.3962 19.1381 15 18.236 15H8V16C8 16.5523 8.44772 17 9 17H16.5H18C18.5523 17 19 17.4477 19 18C19 18.212 18.934 18.4086 18.8215 18.5704C18.9366 18.8578 19 19.1715 19 19.5C19 20.8807 17.8807 22 16.5 22C15.1193 22 14 20.8807 14 19.5C14 19.3288 14.0172 19.1616 14.05 19H10.95C10.9828 19.1616 11 19.3288 11 19.5C11 20.8807 9.88071 22 8.5 22C7.11929 22 6 20.8807 6 19.5C6 18.863 6.23824 18.2816 6.63048 17.8402C6.23533 17.3321 6 16.6935 6 16V14.1339L3.85342 6.26312L3.43717 4.73688C3.31852 4.30182 2.92336 4 2.47241 4H2C1.44772 4 1 3.55228 1 3ZM16 19.5C16 19.2239 16.2239 19 16.5 19C16.7761 19 17 19.2239 17 19.5C17 19.7761 16.7761 20 16.5 20C16.2239 20 16 19.7761 16 19.5ZM8 19.5C8 19.2239 8.22386 19 8.5 19C8.77614 19 9 19.2239 9 19.5C9 19.7761 8.77614 20 8.5 20C8.22386 20 8 19.7761 8 19.5Z"
                            fill="#000000"></path>
                        </g>
                      </svg></button>
                  </div>
                </div>
              </form>
            </article>
          </div>
        </div>
        {{endfor productos}}
      </div>
    </div>
    
  </div>
</div>



<style>
  #cartManip {
    display: flex;
    justify-content: center;
  }

  #addToCart {
    border: none;
    cursor: pointer;
    appearance: none;
    background-color: inherit;
  }

  #productQuantity {

    height: 70px;
  }

  .grid-item {
    margin: 40px;
    height: 700px;
    width: 400px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    background-color: #fff;
    transition: transform 0.2s ease;
  }

  .grid-item:hover {
    transform: scale(1.05);
  }

  .card-img-top {
    max-width: 100%;
    border-radius: 8px 8px 0 0;
  }

  .product-name {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 8px;
  }

  .product-description {
    font-size: 14px;
    color: #777;
    margin-bottom: 12px;
  }

  .product-price {
    font-size: 16px;
    color: #333;
  }

  #submitInfo {
    background-color: #007bff;
    color: #007bff;
    padding: 8px 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .submitInfo button:hover {
    background-color: #0056b3;
  }

  @media screen and (min-width: 768px) {
    .grid-container {
      grid-template-columns: 2fr 1fr;
      /* Dos columnas en pantallas más grandes */
    }
  }
</style>

<button id="openModal" class="floating-button" onclick="openModal()">
  <svg width="64px" height="64px" viewBox="-3.5 0 48 48" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>Paypal-color</title> <desc>Created with Sketch.</desc> <defs> </defs> <g id="Icons" stroke-width="0.00048000000000000007" fill="none" fill-rule="evenodd"> <g id="Color-" transform="translate(-804.000000, -660.000000)" fill="#022B87"> <path d="M838.91167,663.619443 C836.67088,661.085983 832.621734,660 827.440097,660 L812.404732,660 C811.344818,660 810.443663,660.764988 810.277343,661.801472 L804.016136,701.193856 C803.892151,701.970844 804.498465,702.674333 805.292267,702.674333 L814.574458,702.674333 L816.905967,688.004562 L816.833391,688.463555 C816.999712,687.427071 817.894818,686.662083 818.95322,686.662083 L823.363735,686.662083 C832.030541,686.662083 838.814901,683.170138 840.797138,673.069296 C840.856106,672.7693 840.951363,672.194809 840.951363,672.194809 C841.513828,668.456868 840.946827,665.920407 838.91167,663.619443 Z M843.301017,674.10803 C841.144899,684.052874 834.27133,689.316292 823.363735,689.316292 L819.408334,689.316292 L816.458414,708 L822.873846,708 C823.800704,708 824.588458,707.33101 824.733611,706.423525 L824.809211,706.027531 L826.284927,696.754676 L826.380183,696.243184 C826.523823,695.335698 827.313089,694.666708 828.238435,694.666708 L829.410238,694.666708 C836.989913,694.666708 842.92604,691.611256 844.660308,682.776394 C845.35583,679.23045 845.021677,676.257496 843.301017,674.10803 Z" id="Paypal"> </path> </g> </g> </g></svg>
</button>

<div id="modal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>

    <h2>Carrito de compras</h2>
    <hr>
    {{ifnot ~isEmpty}}
    <div class="container" id="payPalCont">
      <div class="row">
        <div class="col-sm"></div>
        <div class="col-sm">

          <div id="alerts" class="ms-text-center"></div>
          <div id="loading" class="spinner-container ms-div-center">
            <div class="spinner"></div>
          </div>
          <div id="content" class="hide">
            <div class="ms-card ms-fill">
              <div class="ms-card-content">
                <h2>Checkout</h2>
                <div class="order-summary">
                  <h3>Order Summary</h3>
                  <table>
                    <thead>
                      <form action="index.php?page=Tienda_Tienda" method="POST">
                        <button id="killCartman" class="flex-box" type="submit" name="deleteButton">Vaciar Carrito</button>
                      </form>
                      <tr>
                        <th>Item</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Date</th>
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

                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
            <div id="paypal-button-container"></div>
              <p id="result-message"></p>
              
              <!-- Initialize the JS-SDK -->
              <script src="https://www.paypal.com/sdk/js?client-id=AVrBR-g2gaf2ZiD4PRfbH9JFQwJZ8OQRh6nrnMYUcPSX806ZpXPSvPUwHMpcu4iqK6IBnf7UD6U0nTJb&buyer-country=US&currency=USD&components=buttons&enable-funding=venmo" data-sdk-integration-source="developer-studio"></script>
            <script src="app.js"></script>
      </div>
    </div>
    </body>

    </html>
      </form>
    </div>

    <hr>
    <h3>Total a pagar: <span>{{total_products}} </span></h3>
    <p>Cantidad de productos: {{quantity}}</p>
    <p>Contenido del carrito de compras...</p>
    <table>


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
    background-color: rgba(0, 0, 0, 0.4);
    /* Transparencia */
  }

#killCartMan{
  background-color: white;
  color: white;
  border: none;
  display: inline-block;
}
  #payPalCont {
    background-color: #FFF;
  }

  .opciones_carrito {
    display: flex;
    padding: 2rem;
    justify-content: space-around;
  }

  .modal:hover {
    animation: pulse 2s infinite alternate;
  }

  .modal-content {

    margin: 15% auto;
    padding: 4rem;
    backdrop-filter: blur(5rem);
    background-color: #FFF;
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
    border-radius: 25px;
    /* Reducido el radio para hacerlo más ovalado */
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    text-decoration: none;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    cursor: pointer;
  }

  .floating-button img {
    width: 35px;
    /* Ajustado el tamaño del ícono */
    height: 35px;
    display: block;
    margin: auto;
  }

  .floating-button p {
    margin: 0;
    /* Eliminado el margen predeterminado del párrafo */
  }
</style>

<script>
  var modal = document.getElementById('modal');
  var openModalBtn = document.getElementById('openModal');
  var closeModalBtn = document.getElementsByClassName('close')[0];

  function closeModal() {
    modal.style.display = 'none';
  }
  function openModal() {
    modal.style.display = 'block';
  }
  // Función para abrir el modal
  openModalBtn.onclick = function () {
    modal.style.display = 'block';
  }

</script>
<style>
  .order-summary,
  .payment-details {
    margin-bottom: 20px;
  }

  .order-summary table,
  .payment-details table {
    width: 100%;
    border-collapse: collapse;
  }

  .order-summary th,
  .order-summary td,
  .payment-details th,
  .payment-details td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
  }

  .order-summary th,
  .payment-details th {
    background-color: #007BFF;
    color: #fff;
  }

  .total {
    text-align: right;
    font-size: 18px;
    font-weight: bold;
  }

  .button-container {
    text-align: center;
  }

  .button-container button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
  }

  .button-container button:hover {
    background-color: #0056b3;
  }
</style>

<script src="script.js"></script>