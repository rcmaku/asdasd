<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion carretilla {{modedsc}}</h2>
    
{{with carretilla}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Carretillas_Carretillas&mode={{~mode}}&usercod={{id}}" method="POST"><input type="hidden" name="xss_token_carretilla" value="{{~xss_token_carretilla}}"/><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">usercod</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de carretilla " value="{{usercod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="mb-4">
                <label for="productid" class="block text-gray-700 text-sm font-bold mb-2">productid</label>
                <input type="text" id="productid" name="productid" placeholder="productid de carretilla " value="{{productid}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if productid_error}}<div class="text-red-500 text-sm">{{productid_error}}</div>{{endif productid_error}}
            </section><section class="mb-4">
                <label for="crrctd" class="block text-gray-700 text-sm font-bold mb-2">crrctd</label>
                <input type="text" id="crrctd" name="crrctd" placeholder="crrctd de carretilla " value="{{crrctd}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrctd_error}}<div class="text-red-500 text-sm">{{crrctd_error}}</div>{{endif crrctd_error}}
            </section><section class="mb-4">
                <label for="crrprc" class="block text-gray-700 text-sm font-bold mb-2">crrprc</label>
                <input type="text" id="crrprc" name="crrprc" placeholder="crrprc de carretilla " value="{{crrprc}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrprc_error}}<div class="text-red-500 text-sm">{{crrprc_error}}</div>{{endif crrprc_error}}
            </section><section class="mb-4">
                <label for="crrfching" class="block text-gray-700 text-sm font-bold mb-2">crrfching</label>
                <input type="text" id="crrfching" name="crrfching" placeholder="crrfching de carretilla " value="{{crrfching}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if crrfching_error}}<div class="text-red-500 text-sm">{{crrfching_error}}</div>{{endif crrfching_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith carretilla}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Carretillas_Carretilla");
            });
        });
    </script>