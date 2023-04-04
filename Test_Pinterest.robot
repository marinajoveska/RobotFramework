*** Settings ***
Library           Selenium2Library

*** Test Cases ***
TC1_login
    Open Browser    https://www.pinterest.com/    Chrome
    Maximize Browser window
    Set Selenium Speed    3
    Click Element    //*[@id="fullpage-wrapper"]/div[1]/div/div/div[1]/div/div[2]/div[3]/button/div
    Wait until page contains    Welcome to Pinterest
    Input text    id=email    wantbewildy@yahoo.com
    Input text    id=password    wantbewildy
    Input text    id=age-input    24
    Click Button    //*[@id="__PWS_ROOT__"]/div/div[1]/div/div[2]/div/div/div/div/div[1]/div[5]/div/div[1]/form/div[8]/button
    Sleep    5
    Click Element    xpath=//body/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/button[1]/div[1]
    Select Radio Button    genderOptions    female
    Sleep    5
    Select From List By Value    name=locale    en-GB
    Select From List By Value    name=country    AL
    Sleep    3
    Click Button    //html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[2]/button
    Wait until page contains    Tell us what you're interested in
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[1]/div/div/div/div/div/div/div[2]/div
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[2]/div/div/div/div/div/div/div[2]/div
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[3]/div/div/div/div/div/div/div[2]/div
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[4]/div/div/div/div/div/div/div[2]/div
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[3]/div/div[5]/div/div/div/div/div/div/div[2]/div
    Click Element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[4]/div[2]/button
    Wait until page contains    Get Pinterest on your phone
    Click element    xpath=//html/body/div[3]/div/div/div/div[2]/div/div/div/div[3]/div/div[2]/button
    Sleep    5
    Close Browser
