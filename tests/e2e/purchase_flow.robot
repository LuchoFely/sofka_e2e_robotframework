*** Settings ***
Documentation    Prueba E2E de flujo de compra en Demoblaze
Resource         ../../resources/data/TestData.resource
Resource         ../../resources/pages/HomePage.resource
Resource         ../../resources/pages/ProductPage.resource
Resource         ../../resources/pages/CartPage.resource
Resource         ../../resources/pages/CheckoutPage.resource
Resource         ../../resources/keywords/CommonKeywords.resource
Resource         ../../setup/browser_setup.robot

Suite Setup      Abrir Navegador
Suite Teardown   Cerrar Navegador
Test Setup       Ir a Portal
Test Timeout     3 minutes

*** Test Cases ***
Flujo Completo de Compra en Demoblaze
    [Documentation]    Prueba E2E que incluye agregar productos, visualizar carrito y completar compra
    [Tags]    e2e    compra    carrito    critical
    
    Dado que el usuario está en la página principal
    Cuando agrega un teléfono al carrito
    Y agrega una laptop al carrito
    Y navega al carrito de compras
    E inicia el proceso de checkout
    Y completa el formulario de compra
    Entonces la compra se realiza exitosamente

*** Keywords ***
# Keywords estilo BDD (Given-When-Then)
Dado que el usuario está en la página principal
    Esperar y Verificar Titulo   STORE

Cuando agrega un teléfono al carrito
    Seleccionar Categoria    ${PHONES_CATEGORY}
    ${producto1}=    Obtener Producto por Indice    2
    Set Test Variable    ${PRODUCTO_1}    ${producto1}
    Seleccionar Producto por Indice    2
    Agregar Producto al Carrito
    Navegar a Home

Y agrega una laptop al carrito
    Seleccionar Categoria    ${LAPTOPS_CATEGORY}
    ${producto2}=    Obtener Producto por Indice    2
    Set Test Variable    ${PRODUCTO_2}    ${producto2}
    Seleccionar Producto por Indice    2
    Agregar Producto al Carrito

Y navega al carrito de compras
    Click Element    ${CART_LINK}
    Wait Until Page Contains    Products    timeout=10s
    Verificar Producto en Carrito    ${PRODUCTO_1}
    Verificar Producto en Carrito    ${PRODUCTO_2}
    Verificar Cantidad Productos    2

E inicia el proceso de checkout
    Iniciar Checkout

Y completa el formulario de compra
    Completar Formulario de Compra    &{USUARIO_VALIDO}

Entonces la compra se realiza exitosamente
    Confirmar Compra
    Esperar y Verificar Titulo    STORE

Ir a Portal
    Go To    ${URL}
    Esperar y Verificar Titulo    STORE