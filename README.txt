Software Requerido
Python 3.7+
Robot Framework 6.0+
SeleniumLibrary 6.0+
Chrome Browser
ChromeDriver


Instalación de Dependencias

# Instalar Robot Framework
pip install robotframework

# Instalar SeleniumLibrary
pip install robotframework-seleniumlibrary

# Instalar SeleniumLibrary
pip install SeleniumLibrary


Ejecución de Pruebas

robot --outputdir results --log purchase_log.html --report purchase_report.html tests/e2e/purchase_flow.robot

Flujo de Prueba Automatizado
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