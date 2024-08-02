<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion purchase {{modedsc}}</h2>
    
{{with purchase}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Purchases_Purchases&mode={{~mode}}&={{id}}" method="POST"><input type="hidden" name="xss_token_purchase" value="{{~xss_token_purchase}}"/><section class="mb-4">
                <label for="id_purchase" class="block text-gray-700 text-sm font-bold mb-2">id_purchase</label>
                <input type="text" id="id_purchase" name="id_purchase" placeholder="id_purchase de purchase " value="{{id_purchase}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if id_purchase_error}}<div class="text-red-500 text-sm">{{id_purchase_error}}</div>{{endif id_purchase_error}}
            </section><section class="mb-4">
                <label for="purchase_date" class="block text-gray-700 text-sm font-bold mb-2">purchase_date</label>
                <input type="text" id="purchase_date" name="purchase_date" placeholder="purchase_date de purchase " value="{{purchase_date}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if purchase_date_error}}<div class="text-red-500 text-sm">{{purchase_date_error}}</div>{{endif purchase_date_error}}
            </section><section class="mb-4">
                <label for="total" class="block text-gray-700 text-sm font-bold mb-2">total</label>
                <input type="text" id="total" name="total" placeholder="total de purchase " value="{{total}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if total_error}}<div class="text-red-500 text-sm">{{total_error}}</div>{{endif total_error}}
            </section><section class="mb-4">
                <label for="details" class="block text-gray-700 text-sm font-bold mb-2">details</label>
                <input type="text" id="details" name="details" placeholder="details de purchase " value="{{details}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if details_error}}<div class="text-red-500 text-sm">{{details_error}}</div>{{endif details_error}}
            </section><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">usercod</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de purchase " value="{{usercod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="mb-4">
                <label for="payments" class="block text-gray-700 text-sm font-bold mb-2">payments</label>
                <input type="text" id="payments" name="payments" placeholder="payments de purchase " value="{{payments}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if payments_error}}<div class="text-red-500 text-sm">{{payments_error}}</div>{{endif payments_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith purchase}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Purchases_Purchase");
            });
        });
    </script>