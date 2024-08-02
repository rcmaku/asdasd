<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion purchasedetail {{modedsc}}</h2>
    
{{with purchasedetail}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Purchasedetails_Purchasedetails&mode={{~mode}}&={{id}}" method="POST"><input type="hidden" name="xss_token_purchasedetail" value="{{~xss_token_purchasedetail}}"/><section class="mb-4">
                <label for="id_purchase" class="block text-gray-700 text-sm font-bold mb-2">id_purchase</label>
                <input type="text" id="id_purchase" name="id_purchase" placeholder="id_purchase de purchasedetail " value="{{id_purchase}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_purchase_error}}<div class="text-red-500 text-sm">{{id_purchase_error}}</div>{{endif id_purchase_error}}
            </section><section class="mb-4">
                <label for="id_item_reference" class="block text-gray-700 text-sm font-bold mb-2">id_item_reference</label>
                <input type="text" id="id_item_reference" name="id_item_reference" placeholder="id_item_reference de purchasedetail " value="{{id_item_reference}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_item_reference_error}}<div class="text-red-500 text-sm">{{id_item_reference_error}}</div>{{endif id_item_reference_error}}
            </section><section class="mb-4">
                <label for="quantity" class="block text-gray-700 text-sm font-bold mb-2">quantity</label>
                <input type="text" id="quantity" name="quantity" placeholder="quantity de purchasedetail " value="{{quantity}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if quantity_error}}<div class="text-red-500 text-sm">{{quantity_error}}</div>{{endif quantity_error}}
            </section><section class="mb-4">
                <label for="unitary_price" class="block text-gray-700 text-sm font-bold mb-2">unitary_price</label>
                <input type="text" id="unitary_price" name="unitary_price" placeholder="unitary_price de purchasedetail " value="{{unitary_price}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if unitary_price_error}}<div class="text-red-500 text-sm">{{unitary_price_error}}</div>{{endif unitary_price_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith purchasedetail}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Purchasedetails_Purchasedetail");
            });
        });
    </script>