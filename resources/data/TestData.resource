*** Variables ***
# URLs
${URL}    https://www.demoblaze.com/

# Datos de prueba
&{USUARIO_VALIDO}
...    nombre=Luis Torres
...    pais=Ecuador
...    ciudad=Quito
...    tarjeta=123456789
...    mes=09
...    año=2025

&{PRODUCTOS}
...    telefono=Samsung galaxy s6
...    laptop=Sony vaio i5

# Mensajes esperados
${MENSAJE_COMPRA_EXITOSA}    Thank you for your purchase!
${MENSAJE_PRODUCTO_AGREGADO}    Product added