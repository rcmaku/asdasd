<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion funciones {{modedsc}}</h2>
    
{{with funciones}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Funcioness_Funcioness&mode={{~mode}}&fncod={{id}}" method="POST"><input type="hidden" name="xss_token_funciones" value="{{~xss_token_funciones}}"/><section class="mb-4">
                <label for="fncod" class="block text-gray-700 text-sm font-bold mb-2">fncod</label>
                <input type="text" id="fncod" name="fncod" placeholder="fncod de funciones " value="{{fncod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if fncod_error}}<div class="text-red-500 text-sm">{{fncod_error}}</div>{{endif fncod_error}}
            </section><section class="mb-4">
                <label for="fndsc" class="block text-gray-700 text-sm font-bold mb-2">fndsc</label>
                <input type="text" id="fndsc" name="fndsc" placeholder="fndsc de funciones " value="{{fndsc}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if fndsc_error}}<div class="text-red-500 text-sm">{{fndsc_error}}</div>{{endif fndsc_error}}
            </section><section class="mb-4">
                <label for="fnest" class="block text-gray-700 text-sm font-bold mb-2">fnest</label>
                <input type="text" id="fnest" name="fnest" placeholder="fnest de funciones " value="{{fnest}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if fnest_error}}<div class="text-red-500 text-sm">{{fnest_error}}</div>{{endif fnest_error}}
            </section><section class="mb-4">
                <label for="fntyp" class="block text-gray-700 text-sm font-bold mb-2">fntyp</label>
                <input type="text" id="fntyp" name="fntyp" placeholder="fntyp de funciones " value="{{fntyp}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if fntyp_error}}<div class="text-red-500 text-sm">{{fntyp_error}}</div>{{endif fntyp_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith funciones}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Funcioness_Funciones");
            });
        });
    </script>