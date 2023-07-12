*** Settings ***
Library           Selenium2Library
Resource          ../Keywords/Experience_offers.robot
Resource          ../Keywords/Browser.robot

*** Variables ***
${already_exists}    Phone number already exists
${hey_marina!}    Hey Marina, just a couple of more details and you’re ready to start playing.

*** Test Cases ***
TC1_Phone_number_already_exists
    Chrome
    Maximize Browser Window
    Sleep    5
    Set Selenium Speed    1
    Click Element    xpath://html/body/div[3]/div[3]/div/div[2]/div[2]/button[1]
    Sleep    3
    Click Button    xpath://*[@id="root"]/div[5]/div[2]/button
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/button[2]
    Input text    name=firstName    Marina
    Input text    name=lastName    Joveska
    Input text    name=email    marina_jasmakos@yahoo.com
    Input text    name=password    MarinaJasmakoska2023
    Select From List By Value    id=mui-component-select-country    India
    Click Element    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Finish signing up
    Select From List By Value    id=mui-component-select-bDay    09
    Select From List By Value    id=mui-component-select-bMonth    06
    Select From List By Value    id=mui-component-select-bYear    1988
    Select From List By Value    id=mui-component-select-gender    Female
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/div[2]/div/input    Borka Stevanoski 33
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[1]/div/input    Prilep
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[2]/div/input    7500
    Select From List By Value    id=mui-component-select-areaCountryCode    RS
    Input text    name=phone    351000
    ${already_exists}    get text    xpath://html/body/div[8]/div[3]/div/div/div/div/div[2]/div/form/div/div[4]/p
    Log To Console    ${already_exists}
    Log    ${already_exists}

TC2_Registration_with_errors
    Chrome
    Maximize Browser Window
    Sleep    5
    Set Selenium Speed    1
    Click Element    xpath://html/body/div[3]/div[3]/div/div[2]/div[2]/button[1]
    Sleep    3
    Click Button    xpath://*[@id="root"]/div[5]/div[2]/button
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/button[2]
    Input text    name=firstName    Marina
    Input text    name=lastName    Joveska
    Input text    name=email    marina_jas@yahoo.com
    Input text    name=password    MarinaJasmakos2023
    Select From List By Value    id=mui-component-select-country    India
    Wait until page contains    Registration completed with errors, please login and complete your profile.
    ${hey_marina!}    get text    xpath://html/body/div[8]/div[3]/div/div/div/div/div[2]/div[2]/h1
    Log To Console    ${hey_marina!}
    Log    ${hey_marina!}

TC3_Registration_Opera
    Opera
    Maximize Browser Window
    Sleep    5
    Set Selenium Speed    1
    Click Element    xpath://html/body/div[3]/div[3]/div/div[2]/div[2]/button[1]
    Sleep    3
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/button[2]
    Sleep     3
    Input text    name=firstName    Marina
    Input text    name=lastName    Joveska
    Input text    name=email    marina_jasmakos@yahoo.com
    Input text    name=password    MarinaJasmakoska2023
    Select From List By Value    id=mui-component-select-country    India
    Click Element    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Finish signing up
    Select From List By Value    id=mui-component-select-bDay    09
    Select From List By Value    id=mui-component-select-bMonth    06
    Select From List By Value    id=mui-component-select-bYear    1988
    Select From List By Value    id=mui-component-select-gender    Female
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/div[2]/div/input    Borka Stevanoski 33
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[1]/div/input    Mumbai
    Input text    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[2]/div/input    400001
    Select From List By Value    id=mui-component-select-areaCountryCode    India
    Input text    name=phone    351022222
    Click Element    xpath://html/body/div[17]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Welcome to Casino Days
