<section class="bg-gray-100  rounded-lg shadow-lg p-4 mx-8">
    <h2 class="text-2xl font-bold text-white text-center mb-6"> Descripcion usuario {{modedsc}}</h2>
    
{{with usuario}}

    <form class="my-4 bg-white p-8 rounded shadow-lg mx-auto max-w-md" action="index.php?page=Usuarios_Usuarios&mode={{~mode}}&usercod={{id}}" method="POST"><input type="hidden" name="xss_token_usuario" value="{{~xss_token_usuario}}"/><section class="mb-4">
                <label for="usercod" class="block text-gray-700 text-sm font-bold mb-2">Codigo Usuario</label>
                <input type="text" id="usercod" name="usercod" placeholder="usercod de usuario " value="{{usercod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usercod_error}}<div class="text-red-500 text-sm">{{usercod_error}}</div>{{endif usercod_error}}
            </section><section class="mb-4">
                <label for="useremail" class="block text-gray-700 text-sm font-bold mb-2">Correo</label>
                <input type="text" id="useremail" name="useremail" placeholder="useremail de usuario " value="{{useremail}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if useremail_error}}<div class="text-red-500 text-sm">{{useremail_error}}</div>{{endif useremail_error}}
            </section><section class="mb-4">
                <label for="username" class="block text-gray-700 text-sm font-bold mb-2">Nombre de Usuario</label>
                <input type="text" id="username" name="username" placeholder="username de usuario " value="{{username}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if username_error}}<div class="text-red-500 text-sm">{{username_error}}</div>{{endif username_error}}
            </section><section class="mb-4">
                <label for="userpswd" class="block text-gray-700 text-sm font-bold mb-2">Contraseña</label>
                <input type="text" id="userpswd" name="userpswd" placeholder="userpswd de usuario " value="{{userpswd}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userpswd_error}}<div class="text-red-500 text-sm">{{userpswd_error}}</div>{{endif userpswd_error}}
            </section><section class="mb-4">
                <label for="userfching" class="block text-gray-700 text-sm font-bold mb-2">Fecha Ingreso</label>
                <input type="text" id="userfching" name="userfching" placeholder="userfching de usuario " value="{{userfching}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userfching_error}}<div class="text-red-500 text-sm">{{userfching_error}}</div>{{endif userfching_error}}
            </section><section class="mb-4">
                <label for="userpswdest" class="block text-gray-700 text-sm font-bold mb-2">Estado de Contraseña</label>
                <input type="text" id="userpswdest" name="userpswdest" placeholder="userpswdest de usuario " value="{{userpswdest}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userpswdest_error}}<div class="text-red-500 text-sm">{{userpswdest_error}}</div>{{endif userpswdest_error}}
            </section><section class="mb-4">
                <label for="userpswdexp" class="block text-gray-700 text-sm font-bold mb-2">Contraseña Expiración</label>
                <input type="text" id="userpswdexp" name="userpswdexp" placeholder="userpswdexp de usuario " value="{{userpswdexp}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userpswdexp_error}}<div class="text-red-500 text-sm">{{userpswdexp_error}}</div>{{endif userpswdexp_error}}
            </section><section class="mb-4">
                <label for="userest" class="block text-gray-700 text-sm font-bold mb-2">Estado de Usuario</label>
                <input type="text" id="userest" name="userest" placeholder="userest de usuario " value="{{userest}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userest_error}}<div class="text-red-500 text-sm">{{userest_error}}</div>{{endif userest_error}}
            </section><section class="mb-4">
                <label for="useractcod" class="block text-gray-700 text-sm font-bold mb-2">Codigo de Activación de Usuario</label>
                <input type="text" id="useractcod" name="useractcod" placeholder="useractcod de usuario " value="{{useractcod}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if useractcod_error}}<div class="text-red-500 text-sm">{{useractcod_error}}</div>{{endif useractcod_error}}
            </section><section class="mb-4">
                <label for="userpswdchg" class="block text-gray-700 text-sm font-bold mb-2">Clave Anterior</label>
                <input type="text" id="userpswdchg" name="userpswdchg" placeholder="userpswdchg de usuario " value="{{userpswdchg}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if userpswdchg_error}}<div class="text-red-500 text-sm">{{userpswdchg_error}}</div>{{endif userpswdchg_error}}
            </section><section class="mb-4">
                <label for="usertipo" class="block text-gray-700 text-sm font-bold mb-2">Tipo de Usuario</label>
                <input type="text" id="usertipo" name="usertipo" placeholder="usertipo de usuario " value="{{usertipo}}" {{if ~readonly}} readonly {{endif ~readonly}} class="w-full py-2 px-3 border border-gray-300 rounded focus:outline-none focus:border-blue-400"/>
                {{if usertipo_error}}<div class="text-red-500 text-sm">{{usertipo_error}}</div>{{endif usertipo_error}}
            </section><section class="col-12 right">
        {{if ~showConfirm}}
            <button type="submit" name="btnConfirm">Confirm</button>&nbsp;
        {{endif ~showConfirm}}
        <button id="btnCancel">Cancel</button>
        </section>
        </section></form></section>
{{endwith usuario}}

<script>
        document.addEventListener("DOMContentLoaded", ()=>{
            document.getElementById("btnCancel").addEventListener("click", (e)=>{
                e.preventDefault();
                e.stopPropagation();
                document.location.assign("index.php?page=Usuarios_Usuario");
            });
        });
    </script>