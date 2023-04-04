*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://www.saucedemo.com
${browser}        chrome
${username}       //*[@id="user-name"]
${password}       //*[@id="password"]
${button}         //*[@id="login-button"]
${error}          //*[@id="login_button_container"]/div/form/div[3]/h3

*** Test Cases ***
TC1_Successful_Login
    Open Browser    ${url}    ${browser}
    Wait Until page contains    Swag Labs
    Input Text    ${username}    standard_user
    Input Text    ${password}    secret_sauce
    Click Element    ${button}
    Page Should not Contain    ${error}    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC2_Faild_Login-Invalid_credentials
    Open Browser    ${url}    ${browser}
    Wait Until page contains    Swag Labs
    Input Text    ${username}    standard_u
    Input Text    ${password}    secret_sauce
    Click Button    ${button}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

TC3_Faild_Login_Invalid_user
    Open Browser    ${url}    ${browser}
    Wait Until page contains    Swag Labs
    Input Text    ${username}    standard_u
    Input Text    ${password}    secret_sauce
    Click Button    ${button}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Sleep    3
    Close Browser

TC4_Faild_Login_NoUser_NoPass
    Open Browser    ${url}    ${browser}
    Wait Until page contains    Swag Labs
    Input Text    ${username}    ${Empty}
    Input Text    ${password}    ${Empty}
    Click Button    ${button}
    Page Should Contain    Epic sadface: Username is required

TC5_Faild_Login_Invalid_pass
    Open Browser    ${url}    ${browser}
    Wait Until page contains    Swag Labs
    Input Text    ${username}    standard_user
    Click Button    ${button}
    Page Should Contain    Epic sadface: Password is required
