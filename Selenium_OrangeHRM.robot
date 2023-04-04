*** Settings ***
Library           Selenium2Library

*** Test Cases ***
TC1_Login
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/i
    Set Browser Implicit Wait    5
    Click Element    link=Logout
    Close Browser
    Log    Test completed

TC2_Admin_CheckSystemUser
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/i
    Set Browser Implicit Wait    5
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    Alice.Duval
    Click Element    tabindex=0    ESS
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[4]/div/div[2]/div/div/div[2]/i    Enabled
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Log    Test completed
    Click Element    link=Logout
    Close Browser
