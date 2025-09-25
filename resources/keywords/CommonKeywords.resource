*** Settings ***
Library          SeleniumLibrary

*** Keywords ***
Manejar Alerta Producto Agregado
    [Documentation]    Maneja las alertas del sistema
    Sleep    2s
    TRY
        Handle Alert    ACCEPT    timeout=3s
        Log    Alerta manejada exitosamente
    EXCEPT
        Log    No se encontró alerta, continuando...
    END

Esperar y Verificar Titulo
    [Arguments]    ${titulo_esperado}
    [Documentation]    Verifica el título de la página
    Wait Until Page Contains    ${titulo_esperado}    timeout=10s
    Title Should Be    ${titulo_esperado}

Tomar Captura de Pantalla
    [Arguments]    ${nombre_archivo}
    [Documentation]    Toma captura de pantalla con timestamp
    ${timestamp}=    Get Time    epoch
    Capture Page Screenshot    ${nombre_archivo}_${timestamp}.png