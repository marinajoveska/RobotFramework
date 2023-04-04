*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://twitter.com/?lang=en
${browser}        Chrome

*** Test Cases ***
TC1_Create_Account
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Click Element    href=/i/flow/signup
    Wait Until Page Contains    Create your account
    Input Text    name=name    Marina
    Click Link    Link:Use email instead
    Input Text    name=email    marina_jasmak@yahoo.com
    Select From List By Value    id=SELECTOR_1    June
    Select From List By Value    id=SELECTOR_2    9
    Select From List By Value    id=SELECTOR_3    1988
    Wait until page contains    Customize your experience
    Click Element    //*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/div/div
    Click Element    //*[@id="layers"]/div[2]/div/div/div/div/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div[2]/div/div
    Click Button    //*[@id="layers"]/div[3]/div/div/div/div/div/div[2]/div[2]/div[2]/div[1]/div
    Input Text    name=verfication_code
