*** Settings ***
Library           Selenium2Library
Resource          ../Keywords/Experience_offers.robot
Resource          ../Keywords/Browser.robot

*** Test Cases ***
TC1_EN
    Open Browser    https://casinodays.com/en    ${chrome}
    Maximize Browser Window
    Set Selenium Speed    1
    Set Browser Implicit Wait    2
    Click Element    //*[@id="root"]/div[5]/div[2]/button
    Wait Until Page Contains    Log in
    Input Text    name=email    marina_jasmak@yahoo.com
    Input Text    name=password    MarinaJasmakoska2023
    Click Element    /html/body/div[7]/div[3]/div/div/div/div/div[1]/form/button

TC2_My_Space_Menu
    Open Browser    https://casinodays.com/en    ${chrome}
    Maximize Browser Window
    Set Selenium Speed    1
    Set Browser Implicit Wait    2
    Click Element    xpath://*[@id="root"]/div[2]/div/div[3]/button[1]
    Sleep    5
    Wait Until Page Contains    Log in
    Input Text    name=email    marina_jasmak@yahoo.com
    Input Text    name=password    MarinaJasmakoska2023
    Click Element    xpath://html/body/div[7]/div[3]/div/div/div/div/div[1]/form/button
    Click Element    xpath://*[@id="root"]/div[2]/div/svg
    Click Element    xpath://html/body/div[8]/div[3]/div/div/div[1]/div/div/div/div[2]/div[1]/div/div[2]/span
    Click Element    xpath://html/body/div[8]/div[3]/div/div/div[1]/div/div/div/div[2]/div[2]/div/div[2]/span
