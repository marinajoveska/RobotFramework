*** Settings ***
Library           Selenium2Library

*** Variables ***
${username}       name=username
${password}       name=password
${login_button}     //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}        Chrome
${Invalid_credentials}    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
${msg}            ${EMPTY}
${Invalid_Credentials_Text}    Invalid credentials

*** Test Cases ***
TC1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Input Text    ${username}    Marina
    Input Text    ${password}    admin123
    Click Button    ${login_button}
    ${msg}    get text    ${Invalid_credentials}
    Log    ${msg}
    Should Be Equal    ${Invalid_Credentials_Text}    ${msg}
