*** Settings ***
Documentation     Desafio Gustavo Alberti Vieira
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}           https://playwright.dev/

*** Test Cases ***
Visitar pagina e elemento
    Abrir o Navegador
    Acessar a Página       ${URL}
    Verificar URL Esperada    ${URL}
    Validar Elemento    //*[@id="docusaurus_skipToContent_fallback"]/header/div/div/a
    Fechar o Navegador

*** Keywords ***
Abrir o Navegador
    Open Browser    ${URL}    ${BROWSER}

Acessar a Página
    [Arguments]    ${url}
    Go To           ${url}
    Capture Page Screenshot

Verificar URL Esperada
    [Arguments]    ${url_esperada}
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${url_esperada}
    Log    O teste passou! A URL esperada (${url_esperada}) é igual à URL atual (${current_url}).
    Capture Page Screenshot

Validar Elemento
    [Arguments]    ${xpath_selector}
    Wait Until Element Is Visible    xpath=${xpath_selector}    timeout=10s
    Element Should Be Visible    xpath=${xpath_selector}
    Log    O teste passou! O elemento (${xpath_selector}) foi encontrado na página.
    Capture Page Screenshot

Fechar o Navegador
    Close Browser
    Log    Fechou o navegador.