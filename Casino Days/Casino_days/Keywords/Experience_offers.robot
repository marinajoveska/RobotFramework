*** Settings ***
Library           Selenium2Library

*** Variables ***
${accept_cookie_btn}    xpath://*[@id="root"]/div[5]/div[2]/button

*** Keywords ***
Yes, please!
    Click Element    xpath://html/body/div[3]/div[3]/div/div[2]/div[2]/button[1]

Close
    Click Button When Visible    xpath=//button[@title="close"]

Cookies
    Wait Until Page Contains Element    ${accept_cookie_btn}
