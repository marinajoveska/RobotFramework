*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://dineshvelhal.github.io/testautomation-playground/login.html    #Testing page
${browser}        Chrome    #Web browser
${user}           id=user    #User
${password}       id=password    #Password
${login_btn}      id=login    #Login Button
${error}          Incorrect username or password. Try again!!
${SuccessfulMesage}    Pizza added to the cart!    #Mesage for successful ordering pizza

*** Test Cases ***
TC_login_with_u_p
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Input Text    ${user}    admin
    Input Text    ${password}    admin
    Click Element    ${login_btn}

TC2_Faild_login-Invalid_user
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Input Text    ${user}    ADMIN
    Input Text    ${password}    admin
    Click Element    ${login_btn}
    Page should contain    ${error}

TC3_Faild_login-Invalid_pass
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Input Text    ${user}    admin
    Input Text    ${password}    ADmIn
    Click Element    ${login_btn}
    Page should contain    ${error}

TC4_Faild_login-NoUser_NoPass
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Input Text    ${user}    ${EMPTY}
    Input Text    ${password}    ${EMPTY}
    Click Element    ${login_btn}
    Sleep    3

TC_Pizza_House_order
    login
    Wait until page contains     Dinesh's Pizza House
    Select Radio Button    size    LARGE
    Select From List By Value    id=select_flavor    Supreme
    Select Radio Button    sauce    BUFFALO
    Select Checkbox    id=green_olive
    Input Text    id=quantity    3
    Click Element    id=submit_button
    Sleep    2
    Wait Until Element is visible    id=added_message
    Element text should be    id=added_message    Pizza added to the cart!
    Sleep     2
    ${SuccessfulMesage}    get text    id=added_message
    Log To Console    ${SuccessfulMesage}
    Log     ${SuccessfulMesage}

*** Keywords ***
login
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Input Text    ${user}    admin
    Input Text    ${password}    admin
    Click Element    ${login_btn}
