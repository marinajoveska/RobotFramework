*** Settings ***
Resource          ../Keywords/Experience_offers.robot
Library           Selenium2Library
Resource          ../Keywords/Browser.robot

*** Test Cases ***
TC1_Chrome
    Chrome
    Maximize Browser Window
    Sleep    5
    Set Selenium Speed    1
    Yes, please!
    Cookies
    Click Button    xpath://*[@id="root"]/div[5]/div[2]/button
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/button[2]
    Sleep    5
    Input text    name=firstName    Marina
    Input text    name=lastName    Joveska
    Input text    name=email    marina_jas@yahoo.com
    Input text    name=password    MarinaJasmakos2023
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
    Click Button    xpath://html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Welcome to Casino Days
    Click Element    xpath://*[@id="root"]/div[5]/div[3]/div/div/h3/svg[2]

TC2_Firefox
    Firefox
    Maximize Browser Window
    Sleep    1
    Yes, please!
    Set Selenium Speed    1
    Click Button    //*[@id="root"]/div[5]/div[2]/button
    Click Button    //*[@id="root"]/div[2]/div/div[3]/button[2]
    Input text    name=firstName    Marina
    Input text    name=lastName    Joveska
    Input text    name=email    marina_jas@yahoo.com
    Input text    name=password    MarinaJasmakos2023
    Select From List By Value    id=mui-component-select-country    Serbia
    Click Element    /html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Finish signing up
    Select From List By Value    id=mui-component-select-bDay    09
    Select From List By Value    id=mui-component-select-bMonth    06
    Select From List By Value    id=mui-component-select-bYear    1988
    Select From List By Value    id=mui-component-select-gender    Female
    Input text    /html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/div[2]/div/input    Borka Stevanoski 33
    Input text    /html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[1]/div/input    Prilep
    Input text    /html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/div/fieldset[2]/div[2]/div/input    7500
    Select From List By Value    id=mui-component-select-areaCountryCode    RS
    Input text    name=phone    351000
    Click Button    /html/body/div[10]/div[3]/div/div/div/div/div[2]/div/form/button
    Wait until page contains    Welcome to Casino Days
    Click Element    //*[@id="root"]/div[5]/div[3]/div/div/h3/svg[2]

TC3_Opera
    Opera
    Maximize Browser Window
    Sleep    5
    Set Selenium Speed    1
    Click Element    xpath://html/body/div[3]/div[3]/div/div[2]/div[2]/button[1]
    Sleep    3
    Click Button    xpath://*[@id="root"]/div[2]/div/div[3]/button[2]
    Sleep    3
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
    Click Element    //*[@id="root"]/div[5]/div[3]/div/div/h3/svg[2]
