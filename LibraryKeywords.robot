*** Settings ***
Test Teardown     Close Browser
Library           Selenium2Library

*** Variables ***
${url}            https://robotsparebinindustries.com/#/
${browser}        chrome

*** Test Cases ***
TC1_login
    launchingbrowser
    inputvalues
    logout

*** Keywords ***
launchingbrowser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    1

inputvalues
    Input Text    id=username    maria
    Input Text    id=password    thoushallnotpass
    Click Button    //*[@id="root"]/div/div/div/div[1]/form/button

logout
    Click Element    //*[@id="logout"]
    Sleep    1
