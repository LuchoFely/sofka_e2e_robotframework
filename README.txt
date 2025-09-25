Software Requerido
Python 3.8+  (Configurado previamente en variables de entorno)
Driver de google chrome para Versión 140.0.7339.185 (Este se encuentra en la ruta del proyecto)
Si se desa una versión anterior descargarse de esta página https://googlechromelabs.github.io/chrome-for-testing/  y ponerlo en la ruta del proyecto


Instalación de Dependencias

# Instalar las librerias que se encuentran en requirements.txt
pip install -r requirements.txt


Ejecución de Pruebas

python -m robot --outputdir results --log purchase_log.html --report purchase_report.html tests/e2e/purchase_flow.robot

Flujo de Prueba Automatizado

Ejecución e2e en google Chrome

Escenario Principal: Flujo Completo de Compra
Navegación a página principal
Agregar producto de categoría Phones
Regresar a página principal
Agregar producto de categoría Laptops
Verificar productos en carrito
Completar formulario de compra
Finalizar compra y verificar confirmación

Resultados y Reportes
results/
├── output.xml
├── log.html
├── report.html
└── screenshot_*.png