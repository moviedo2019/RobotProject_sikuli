*** Settings ***
Library    SeleniumLibrary
Library    SikuliLibrary
Library    app

*** Variables ***
${path}    C:/Users/moviedo/eclipse-workspace/Sikuli2/imagenesABuscar
${menuDep}    0
${menuWms}    1
${submenu}    1
${nroasn}    0000163028

*** Test Cases ***
Recepcion_ASN
    [Documentation]    Recepción asn
    Start Sikuli Process
    Open_RF
    Login_RF    ${path}    moviedo    andreani2018
    Menu_Recepcion_ASN    ${path}    ${menuDep}    ${menuWms}    ${submenu}
    Buscar_numero_ASN    ${path}    ${nroasn}
    Stop Remote Server       
    Close_RF
    
    

*** Keywords ***
Open_RF
    [Documentation]    Abre la app RF
    app.Rf Open
    
Close_RF
    [Documentation]    Cierra la app RF
    app.Rf Close
    
Login_RF
    [Arguments]    ${imagepath}    ${user}    ${pass}
    [Documentation]    Realiza Log-in a Farmanet RF
    Add Image Path    ${imagepath}
    Wait Until Screen Contain    pantalla_0    60
    SikuliLibrary.Input Text    pantalla_0    ${user}
    Press Special Key    ENTER
    SikuliLibrary.Input Text    pantalla_0    ${pass}
    Press Special Key    ENTER
    Wait Until Screen Contain    pantalla_1    60
    
    
Menu_Recepcion_ASN
    [Arguments]    ${imagepath}    ${menuDep}    ${menuWms}    ${submenu}
    [Documentation]    Ingresa al menu Recepcion ASN
    Add Image Path    ${imagepath}
    Wait Until Screen Contain    pantalla_1    60
    SikuliLibrary.Input Text    pantalla_1    ${menuDep}
    Wait Until Screen Contain    pantalla_2    60
    SikuliLibrary.Input Text    pantalla_2    ${menuWms}
    Wait Until Screen Contain    pantalla_3    60
    SikuliLibrary.Input Text    pantalla_3    ${submenu}
    
    
Buscar_numero_ASN
    [Arguments]    ${imagepath}    ${nroasn}
    [Documentation]    Buscar la recepcion con el numero de ASN creado en SCE
    Add Image Path    ${imagepath}
    Wait Until Screen Contain    pantalla_4    60
    SikuliLibrary.Input Text    pantalla_4    ${nroasn}
    Press Special Key    ENTER
    Wait Until Screen Contain    pantalla_5    60
    
