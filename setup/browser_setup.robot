*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${TIMEOUT}    15s

*** Keywords ***
Abrir Navegador
    [Documentation]    Configuración inicial del navegador
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Set Selenium Timeout          20s

Cerrar Navegador
    [Documentation]    Limpieza después de las pruebas
    Close All Browsers

Configurar Timeouts
    [Arguments]    ${timeout}=15s
    Set Selenium Timeout    ${timeout}