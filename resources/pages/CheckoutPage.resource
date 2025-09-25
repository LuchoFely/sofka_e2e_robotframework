*** Settings ***
Library          SeleniumLibrary

*** Variables ***
# Selectores CheckoutPage
${ORDER_MODAL}           id:orderModal
${NAME_FIELD}            id:name
${COUNTRY_FIELD}         id:country
${CITY_FIELD}            id:city
${CARD_FIELD}            id:card
${MONTH_FIELD}           id:month
${YEAR_FIELD}            id:year
${PURCHASE_BUTTON}       xpath=//button[contains(text(),'Purchase')]
${CONFIRMATION_MODAL}    xpath=//div[@class='sweet-alert showSweetAlert visible']
${OK_BUTTON}             xpath=//button[contains(text(),'OK')]

*** Keywords ***
Completar Formulario de Compra
    [Arguments]    &{datos_usuario}
    [Documentation]    Completa el formulario de compra
    Wait Until Element Is Visible    ${ORDER_MODAL}    timeout=10s
    Sleep    1s  # Pequeña pausa para estabilización
    
    Input Text    ${NAME_FIELD}    ${datos_usuario.nombre}
    Input Text    ${COUNTRY_FIELD}    ${datos_usuario.pais}
    Input Text    ${CITY_FIELD}    ${datos_usuario.ciudad}
    Input Text    ${CARD_FIELD}    ${datos_usuario.tarjeta}
    Input Text    ${MONTH_FIELD}    ${datos_usuario.mes}
    Input Text    ${YEAR_FIELD}    ${datos_usuario.año}

Confirmar Compra
    [Documentation]    Confirma la compra y verifica el mensaje
    Click Button    ${PURCHASE_BUTTON}
    Wait Until Page Contains    Thank you for your purchase!    30s
    Page Should Contain Element    ${OK_BUTTON}
    Click Button    ${OK_BUTTON}