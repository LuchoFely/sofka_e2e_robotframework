*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test de Conexión Simple
    Open Browser    https://www.google.com    chrome
    Page Should Contain    Google
    Close Browser