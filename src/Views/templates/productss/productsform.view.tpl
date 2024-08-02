<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion products {{modedsc}}</h2>

    {{with products}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md"
        action="index.php?page=Productss_Productss&mode={{~mode}}&productId={{id}}" method="POST"><input type="hidden"
            name="xss_token_products" value="{{~xss_token_products}}" />
        <section class="mb-4">
            <label for="productid" class="block text-gray-700 text-sm font-bold mb-2">productid</label>
            <input type="text" id="productid" name="productid" placeholder="productid de products "
                value="{{productid}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productid_error}}<div class="text-red-500 text-sm">{{productid_error}}</div>{{endif productid_error}}
        </section>
        <section class="mb-4">
            <label for="productname" class="block text-gray-700 text-sm font-bold mb-2">productname</label>
            <input type="text" id="productname" name="productname" placeholder="productname de products "
                value="{{productname}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productname_error}}<div class="text-red-500 text-sm">{{productname_error}}</div>{{endif
            productname_error}}
        </section>
        <section class="mb-4">
            <label for="productdescription"
                class="block text-gray-700 text-sm font-bold mb-2">productdescription</label>
            <input type="text" id="productdescription" name="productdescription"
                placeholder="productdescription de products " value="{{productdescription}}" {{if ~readonly}} readonly
                {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productdescription_error}}<div class="text-red-500 text-sm">{{productdescription_error}}</div>{{endif
            productdescription_error}}
        </section>
        <section class="mb-4">
            <label for="productprice" class="block text-gray-700 text-sm font-bold mb-2">productprice</label>
            <input type="text" id="productprice" name="productprice" placeholder="productprice de products "
                value="{{productprice}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productprice_error}}<div class="text-red-500 text-sm">{{productprice_error}}</div>{{endif
            productprice_error}}
        </section>
        <section class="mb-4">
            <label for="productimgurl" class="block text-gray-700 text-sm font-bold mb-2">productimgurl</label>
            <input type="text" id="productimgurl" name="productimgurl" placeholder="productimgurl de products "
                value="{{productimgurl}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productimgurl_error}}<div class="text-red-500 text-sm">{{productimgurl_error}}</div>{{endif
            productimgurl_error}}
        </section>
        <section class="mb-4">
            <label for="productstock" class="block text-gray-700 text-sm font-bold mb-2">productstock</label>
            <input type="text" id="productstock" name="productstock" placeholder="productstock de products "
                value="{{productstock}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productstock_error}}<div class="text-red-500 text-sm">{{productstock_error}}</div>{{endif
            productstock_error}}
        </section>
        <section class="mb-4">
            <label for="productstatus" class="block text-gray-700 text-sm font-bold mb-2">productstatus</label>
            <input type="text" id="productstatus" name="productstatus" placeholder="productstatus de products "
                value="{{productstatus}}" {{if ~readonly}} readonly {{endif ~readonly}}
                class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400" />
            {{if productstatus_error}}<div class="text-red-500 text-sm">{{productstatus_error}}</div>{{endif
            productstatus_error}}
        </section>
        <section class="col-12 right">
            {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
            {{endif ~showConfirm}}
            <button id="btnCancel">Cancel</button>
        </section>
</section>
</form>
</section>
{{endwith products}}

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("btnCancel").addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            document.location.assign("index.php?page=Productss_Products");
        });
    });
</script>