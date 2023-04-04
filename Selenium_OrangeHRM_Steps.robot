*** Settings ***
Library           Selenium2Library

*** Variables ***
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    # Testing page
${browser}        Chrome    # Chrome browser
${button}         //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
${att}            ${EMPTY}

*** Test Cases ***
TC0_Login_without_u_p
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Click Button    ${button}
    Page Should Contain    Required    # Required username
    ${att}    get text    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span
    ${att}    get text    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/span
    Log    ${att}
    Should Be Equal    Required    ${att}
    Close Browser

TC1_Login_without_u
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    name=password    admin123
    Click Button    ${button}
    Page Should Contain    Required    # Required username
    ${att}    get text    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/span
    Log    ${att}
    Should Be Equal    Required    ${att}
    Sleep    3
    Close Browser

TC2_Login_without_p
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    name=username    Admin
    Input Text    name=password    xsfhbr
    Click Button    ${button}
    ${att}    get text    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]/p
    Log    ${att}
    Should Be Equal    Invalid credentials    ${att}
    Set Browser Implicit Wait    5
    Close Browser

TC3_Login_with_u_p
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Sleep    3
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/p
    Set Browser Implicit Wait    10
    Wait Until Page Contains    Dashboard
    Sleep    3
    ${att}    get text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Dashboard    ${att}
    Click Link    link:Logout
    Close Browser
    Log    Login completed

TC4_Click_menu
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    2
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Click Link    link:Admin
    Click Link    link:PIM
    Click Link    link:Leave
    Click Link    link:Time
    Click Link    Recruitment
    Click Link    link:My Info
    Click Link    link:Performance
    Click Link    link:Directory
    Click Link    link:Maintenance
    Click Button    //*[@id="app"]/div[1]/div[1]/form/div[4]/button[1]
    Click Link    link:Buzz
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/p
    Click Link    link:Logout
    Set Browser Implicit Wait    10
    Close Browser

TC5_Admin_menu
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a
    Sleep    2
    Wait Until Page Contains    Admin
    ${att}    get text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a
    Should Be Equal    Admin    ${att}

TC6_Logout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Wait Until Page Contains    Login
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Wait until page contains    Dashboard
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Dashboard    ${att}
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    Element Should Be Visible    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    Click Link    /web/index.php/auth/logout\
    ${att}    Get Title
    Should Be Equal    OrangeHRM    ${att}
    Sleep    2
    Close Browser

TC7_Forgot_Pass_cancel
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Wait Until Page Contains    Login
    Click Element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[4]/p[1]
    Wait Until Page Contains    Reset Password
    Input Text    name=username    Admin
    Click Element    xpath=//body/div[@id='app']/div[1]/div[1]/div[1]/form[1]/div[2]/button[1]
    Wait Until Page Contains    Login
    ${att}    Get Title
    Should Be Equal    OrangeHRM    ${att}
    Log To Console    ${att}
    Close Browser

TC8_Forgot_Pass
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Wait Until Page Contains    Login
    Click Element    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[4]/p
    Wait Until Page Contains    Reset Password
    Input Text    name=username    Admin
    Click Button    //*[@id="app"]/div[1]/div[1]/div/form/div[2]/button[1]
    ${att}    Get Text    //html/body/div/div[1]/div[1]/div/h6
    Should Be Equal    Reset Password link sent successfully    ${att}
    Log To Console    ${att}
    Sleep    1
    Close Browser

TC9_Search_menu
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Admin
    Click Link    link:Admin
    Wait Until Page Contains    Admin
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6[1]
    Should Be Equal    Admin    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    PIM
    Click Link    link:PIM
    Wait Until Page Contains    PIM
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    PIM    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Leave
    Click Link    link:Leave
    Wait Until Page Contains    Leave
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Leave    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Time
    Click Link    link:Time
    Wait Until Page Contains    Time
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6[1]
    Should Be Equal    Time    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Recruitment
    Click Link    link:Recruitment
    Wait Until Page Contains    Recruitment
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Recruitment    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    My Info
    Click Link    link:My Info
    Wait Until Page Contains    PIM
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    PIM    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Performance
    Click Link    link:Performance
    Wait Until Page Contains    Performance
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6[1]
    Should Be Equal    Performance    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Directory
    Click Link    link:Directory
    Wait Until Page Contains    Directory
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Directory    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Maintenance
    Click Link    link:Maintenance
    Wait Until Page Contains    Administrator Access
    Input Text    name=password    admin123
    Click Element    //*[@id="app"]/div[1]/div[1]/form/div[4]/button[2]
    Wait Until Page Contains    Maintenance
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6[1]
    Should Be Equal    Maintenance    ${att}
    Log to Console    ${att}
    Input Text    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/div/div/input    Buzz
    Click Link    link:Buzz
    Wait Until Page Contains    Buzz
    ${att}    Get Text    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[1]/span/h6
    Should Be Equal    Buzz    ${att}
    Log to Console    ${att}
    Sleep    2
    Close Browser

TC10_No_Admin_found
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Click Link    link:Admin
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    Marina
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Wait Until Page Contains    No Records Found
    ${att}    Get Text    //body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[2]/div[2]/div[1]/span[1]
    Should Be Equal    No Records Found    ${att}
    Log To Console    ${att}

TC11_Admin_found
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    Click Link    link:Admin
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    Admin
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    Wait Until Page Contains    Record Found
    ${att}    Get Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span
    Should Be Equal    Record Found    ${att}
    Log To Console    ${att}

TC12_System_users
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    ${att}    get text    xpath=//header/div[1]/div[1]/span[1]/h6[1]
    Should Be Equal    Admin    ${att}
    input text    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]    David.Morris
    click element    xpath=//body/div[@id='app']/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[2]/button[2]
    Wait Until Page Contains    (1) Record Found
    ${att}    get text    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span
    Should Be Equal    (1) Record Found    ${att}
    ${data}    get text    xpath=//html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[2]/div
    Should Be Equal    David.Morris    ${data}
    Log To Console    ${data}
    Close Browser

TC13_Create_New_admin
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Set Selenium Speed    1
    Input Text    name=username    Admin
    Input Text    name=password    admin123
    Click Button    ${button}
    wait until page contains    Dashboard
    click element    xpath=//html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    wait until page contains    Admin
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[2]/i    1
    Select From List By Value    class=oxd-select-text-input    Admin
    Select From List By Value    class=oxd-select-text-input    Enabled
    Insert Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input    Maggie \ Manning
    Insert Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    MaggieManning
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input    MaggieManning
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input    MaggieManning
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
    Wait until Page Contains    Success
    ${att}    Get Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[2]/div/span
    Should Be Equal    Records Found    ${att}
    Log To Console    ${att}
