*** Settings ***
Library          SeleniumLibrary
Resource    ../keywords/CommonKeywords.resource
*** Variables ***
# Selectores CartPage
${CART_TITLE}            xpath=//h2[contains(text(),'Products')]
${CART_ITEMS}            xpath=//tbody/tr
${PLACE_ORDER_BUTTON}    xpath=//button[contains(text(),'Place Order')]
${ITEM_NAME}             xpath=//td[2]

*** Keywords ***
Verificar Producto en Carrito
    [Arguments]    ${nombre_producto}
    [Documentation]    Verifica que un producto esté en el carrito
    Page Should Contain    ${nombre_producto}

Verificar Cantidad Productos
    [Arguments]    ${cantidad_esperada}
    [Documentation]    Verifica la cantidad de productos en el carrito
    Wait Until Element Is Visible    ${CART_ITEMS}    timeout=10s
    ${cantidad_actual}=    Get Element Count    ${CART_ITEMS}
    Should Be Equal As Numbers    ${cantidad_actual}    ${cantidad_esperada}

Iniciar Checkout
    [Documentation]    Inicia el proceso de checkout
    Wait Until Element Is Visible    ${PLACE_ORDER_BUTTON}    timeout=10s
    Click Button    ${PLACE_ORDER_BUTTON}