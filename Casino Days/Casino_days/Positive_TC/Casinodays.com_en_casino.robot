*** Settings ***
Library           Selenium2Library
Resource          ../Keywords/Experience_offers.robot
Resource          ../Keywords/Browser.robot

*** Test Cases ***
TC1_Casino_Menu
    Open Browser    https://casinodays.com/en/casino    ${chrome}
    Maximize Browser Window
    Set Selenium Speed    2
    Cookies
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[1]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[2]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[3]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[4]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[5]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[6]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[7]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[8]

TC2_Live_Casino_Menu
    Open Browser    https://casinodays.com/en/live-casino    ${chrome}
    Maximize Browser Window
    Set Selenium Speed    2
    Cookies
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[1]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[2]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[3]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[4]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[5]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[6]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[7]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[8]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[9]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[11]
    Click Element    //*[@id="root"]/div[3]/div/div/div/div/header/nav/span[12]
