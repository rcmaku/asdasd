<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion bitacora {{modedsc}}</h2>
    
{{with bitacora}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Bitacoras_Bitacoras&mode={{~mode}}&bitacoracod={{id}}" method="POST"><input type="hidden" name="xss_token_bitacora" value="{{~xss_token_bitacora}}"/><section class="mb-4">
                <label for="bitacoracod" class="block text-gray-700 text-sm font-bold mb-2">bitacoracod</label>
                <input type="text" id="bitacoracod" name="bitacoracod" placeholder="bitacoracod de bitacora " value="{{bitacoracod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitacoracod_error}}<div class="text-red-500 text-sm">{{bitacoracod_error}}</div>{{endif bitacoracod_error}}
            </section><section class="mb-4">
                <label for="bitacorafch" class="block text-gray-700 text-sm font-bold mb-2">bitacorafch</label>
                <input type="text" id="bitacorafch" name="bitacorafch" placeholder="bitacorafch de bitacora " value="{{bitacorafch}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitacorafch_error}}<div class="text-red-500 text-sm">{{bitacorafch_error}}</div>{{endif bitacorafch_error}}
            </section><section class="mb-4">
                <label for="bitprograma" class="block text-gray-700 text-sm font-bold mb-2">bitprograma</label>
                <input type="text" id="bitprograma" name="bitprograma" placeholder="bitprograma de bitacora " value="{{bitprograma}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitprograma_error}}<div class="text-red-500 text-sm">{{bitprograma_error}}</div>{{endif bitprograma_error}}
            </section><section class="mb-4">
                <label for="bitdescripcion" class="block text-gray-700 text-sm font-bold mb-2">bitdescripcion</label>
                <input type="text" id="bitdescripcion" name="bitdescripcion" placeholder="bitdescripcion de bitacora " value="{{bitdescripcion}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitdescripcion_error}}<div class="text-red-500 text-sm">{{bitdescripcion_error}}</div>{{endif bitdescripcion_error}}
            </section><section class="mb-4">
                <label for="bitobservacion" class="block text-gray-700 text-sm font-bold mb-2">bitobservacion</label>
                <input type="text" id="bitobservacion" name="bitobservacion" placeholder="bitobservacion de bitacora " value="{{bitobservacion}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitobservacion_error}}<div class="text-red-500 text-sm">{{bitobservacion_error}}</div>{{endif bitobservacion_error}}
            </section><section class="mb-4">
                <label for="bittipo" class="block text-gray-700 text-sm font-bold mb-2">bittipo</label>
                <input type="text" id="bittipo" name="bittipo" placeholder="bittipo de bitacora " value="{{bittipo}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bittipo_error}}<div class="text-red-500 text-sm">{{bittipo_error}}</div>{{endif bittipo_error}}
            </section><section class="mb-4">
                <label for="bitusuario" class="block text-gray-700 text-sm font-bold mb-2">bitusuario</label>
                <input type="text" id="bitusuario" name="bitusuario" placeholder="bitusuario de bitacora " value="{{bitusuario}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if bitusuario_error}}<div class="text-red-500 text-sm">{{bitusuario_error}}</div>{{endif bitusuario_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith bitacora}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Bitacoras_Bitacora");
            });
        });
    </script>