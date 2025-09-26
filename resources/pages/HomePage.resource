*** Settings ***
Library          SeleniumLibrary
Resource    ../keywords/CommonKeywords.resource

*** Variables ***
# Selectores HomePage
# Selectores HomePage CORREGIDOS
${HOME_NAVBAR}            xpath=//a[contains(text(),'Home')]
${CART_LINK}              xpath=//a[contains(text(),'Cart')]
${PHONES_CATEGORY}        xpath=//a[contains(text(),'Phones')]
${LAPTOPS_CATEGORY}       xpath=//a[contains(text(),'Laptops')]
${PRODUCTOS_LISTA}        xpath=//a[@class='hrefch']
${PAGE_TITLE}             id:nava  # Logo de la página (más confiable)
${PAGE_CONTAINS_TEXT}     PRODUCT STORE  # Texto para verificación

*** Keywords ***
Navegar a Home
    [Documentation]    Navega a la página principal
    Click Element    ${HOME_NAVBAR}
    Sleep   1s
    Wait Until Page Contains    ${PAGE_CONTAINS_TEXT}    timeout=15s
    Log    ✓ Página principal cargada

Seleccionar Categoria
    [Arguments]    ${categoria}
    [Documentation]    Selecciona una categoría de productos
    Wait Until Element Is Visible    ${categoria}    timeout=15s
    Click Element    ${categoria}
    Sleep   1s
    Wait Until Element Is Visible    ${PRODUCTOS_LISTA}    timeout=15s

Obtener Producto por Indice
    [Arguments]    ${indice}
    [Documentation]    Obtiene el nombre del producto por índice
    ${locator}=    Set Variable    xpath=(//a[@class='hrefch'])[${indice}]
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${nombre_producto}=    Get Text    ${locator}
    RETURN    ${nombre_producto}

Seleccionar Producto por Indice
    [Arguments]    ${indice}
    [Documentation]    Selecciona un producto por su índice
    ${locator}=    Set Variable    xpath=(//a[@class='hrefch'])[${indice}]
    Click Element    ${locator}
    Sleep   1s