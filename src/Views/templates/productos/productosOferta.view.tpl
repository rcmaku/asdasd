
<h1>Productos en Oferta</h1>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="row">
                {{foreach products}}
                <div class="col-4">
                    <div class="card">
                        <img src="/BetaGaming/public/imgs/games/{{imagen}}" class="card-img-top" alt="{{nombre}}">
                        <h2>{{nombre}}</h2>
                        <span>{{precio}}</span>
                        <span>{{stock}}</span>
                        <button type="button" class="open-popup" data-id="{{id}}" data-name="{{nombre}}" data-price="{{precio}}" data-stock="{{stock}}">Add to Cart</button>
                    </div>
                </div>
                {{endfor products}}
            </div>
        </div>
    </div>
</div>


<!-- The Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">×</span>
        <h2 id="product-name"></h2>
        <form id="add-to-cart-form" action="index.php?page=CartController" method="POST">
            <input type="hidden" name="product_id" id="product-id">
            <input type="hidden" name="product_name" id="product-name-input">
            <input type="hidden" name="product_price" id="product-price">
            <input type="hidden" name="product_stock" id="product-stock">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" max="10" required>
            <button type="submit">Add to Cart</button>
        </form>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', (event) => {
    var modal = document.getElementById("myModal");
    var span = document.getElementsByClassName("close")[0];

    document.querySelectorAll('.open-popup').forEach(button => {
        button.onclick = function() {
            var productId = this.getAttribute('data-id');
            var productName = this.getAttribute('data-name');
            var productPrice = this.getAttribute('data-price');
            var productStock = this.getAttribute('data-stock');

            document.getElementById('product-id').value = productId;
            document.getElementById('product-name').innerText = productName;
            document.getElementById('product-name-input').value = productName;
            document.getElementById('product-price').value = productPrice;
            document.getElementById('product-stock').value = productStock;

            modal.style.display = "block";
        }
    });

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
});
</script>