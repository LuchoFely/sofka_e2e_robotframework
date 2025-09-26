*** Settings ***
Library          SeleniumLibrary
Resource    ../keywords/CommonKeywords.resource

*** Variables ***
# Selectores ProductPage
${ADD_TO_CART_BUTTON}    xpath=//a[contains(text(),'Add to cart')]
${PRODUCT_NAME}          xpath=//h2[@class='name']

*** Keywords ***
Agregar Producto al Carrito
    [Documentation]    Agrega el producto actual al carrito
    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    timeout=10s
    Click Element    ${ADD_TO_CART_BUTTON}
    Sleep   1s
    Manejar Alerta Producto Agregado

Obtener Nombre Producto Actual
    [Documentation]    Obtiene el nombre del producto en vista detalle
    Wait Until Element Is Visible    ${PRODUCT_NAME}    timeout=10s
    ${nombre}=    Get Text    ${PRODUCT_NAME}
    RETURN  ${nombre}