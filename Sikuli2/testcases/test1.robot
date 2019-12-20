*** Settings ***
Library    SeleniumLibrary
Library    SikuliLibrary
Library    app

*** Variables ***
${path}    C:/Users/moviedo/eclipse-workspace/Sikuli2/image

*** Test Cases ***  
Calculadora
    Start Sikuli Process
    app.Calculadora Open
    Add Image Path    ${path}
    Wait Until Screen Contain    siete    10
    Click    siete
    Stop Remote Server
    
Buscador
    Start Sikuli Process
    Add Image Path    ${path}
    Set Wait Scan Rate    3
    Click    lupa.png    
    SikuliLibrary.Input Text    type.png    word
    Stop Remote Server
    
Abrir Notepad
    Start Sikuli and Add path image    ${path}
    Highlight    lupa.png    1    
    Click    lupa.png
    SikuliLibrary.Input Text    type.png    notepad
    Wait Until Screen Contain    notepad.png    10
    ${var}=    SikuliLibrary.Get Text    notepad.png
    Log To Console    ${var}
    Press Special Key    ENTER      
    #Click    notepad.png
    Wait Until Screen Contain    white.png    10
    SikuliLibrary.Input Text    white.png    Hello World!!
    Click    close_notepad.png
    Click    dontsave_notepad.png
    Stop Remote Server
    
*** Keywords ***
Start Sikuli and Add path image
    [Arguments]    ${imagepath}
    [Documentation]    Arranca Sikuli y se define la ruta de las imagenes
    Start Sikuli Process
    Add Image Path    ${imagepath}
    [Return]    ${imagepath}   
            