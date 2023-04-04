*** Settings ***
Library           Selenium2Library

*** Variables ***
${browser}        Chrome
${speed}          ${EMPTY}
${rows}           ${EMPTY}
${columns}        ${EMPTY}
${email_text}     ${EMPTY}
${url}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
@{CREDENTIALS}    Admin    \    admin
&{login}          Admin=username    \    Password=admin

*** Test Cases ***
TC1_Open_Chrome
    Open Browser    https://www.tutorialspoint.com/robot_framework/robot_framework_writing_and_executing_test_cases.htm    chrome
    Maximize Browser Window
    Capture Page Screenshot    page.png
    Close Browser

TC2_Elements_ShouldBe
    Open Browser    https://demo.nopcommerce.com/    ${browser}
    Maximize Browser Window
    Title should be    nopCommerce demo store
    Sleep    2
    Click Link    Link:Log in
    ${email_text}    Set Variable    id=Email
    Element Should be Visible    ${email_text}
    Element Should be Enabled    ${email_text}
    Sleep    2
    Input Text    ${email_text}    marina.jasmak@gmail.com
    Sleep    2
    Clear Element Text    ${email_text}
    Sleep    2
    Close Browser

TC3_Textbox_Testing
    Open Browser    https://www.tutorialspoint.com/    chrome
    Maximize Browser Window
    Input Text    id=search-strings    HTML
    Click Button    id=btnSearch
    Sleep    2
    Close Browser

TC4_Checkboxes
    Open Browser    https://app.endtest.io/guides/docs/how-to-test-checkboxes/    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2second
    Select Checkbox    pet1
    Unselect Checkbox    pet2
    Sleep    2
    Close Browser

TC5_Drag_Drop
    Open Browser    http://practice.cybertekschool.com/drag_and_drop    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Drag And Drop    column-a    column-b
    Sleep    2
    Close Browser

TC6_Drop_down
    Open Browser    https://chercher.tech/practice/practice-dropdowns-selenium-webdriver    Chrome
    Maximize Browser Window
    Select From List By Label    id=first    Iphone
    Select From List By Index    id=animals    2
    Select From List By Value    id=second    donut
    Unselect From List By Value    id=second    burger
    Sleep    2
    Close Browser

TC7_Selenium_speed
    Open Browser    https://demo.prestashop.com/#/en/front    ${browser}
    Maximize Browser Window
    ${speed}    Get Selenium Speed
    Log to Console    ${speed}
    Click Element    //*[@id="_desktop_user_info"]
    Click Element    //*[@id="content"]/div/a
    Select Radio Button    id_gender    2
    Click Element    name=firstname    Marina
    Click Element    name=lastname    Joveska
    Click Element    id=field-email    marina_jasmak@yahoo.com
    Click Element    id=field-password    joveska
    Click Element    id=field-birthday    06/09/1988
    Unselect Checkbox    1
    Select Checkbox    1
    Unselect Checkbox    1
    Select Checkbox    1
    Click Button    type=submit
    ${speed}    Get Selenium Speed
    Log To Console    ${speed}
    Sleep    3seconds
    Close Browser

TC8_Alerts_dissmis
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}
    Maximize Browser Window
    Click Button    //*[@id="HTML9"]/div[1]/button
    Sleep    1
    Alert Should Be Present    Press a button!
    Sleep    2
    Handle Alert    dissmis
    Close Browser

TC9_Alerts_accept
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}
    Maximize Browser Window
    Click Button    //*[@id="HTML9"]/div[1]/button
    Sleep    3
    Handle alert    accept
    Close Browser

TC10_Alerts_Leave
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}
    Maximize Browser Window
    Click Button    //*[@id="HTML9"]/div[1]/button
    Sleep    2
    Handle Alert    leave
    Close Browser

TC11_Frames
    Open Browser    https://www.selenium.dev/selenium/docs/api/java/index.html?overview-summary.html    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Select Frame    packageListFrame
    Click Link    org/openqa/selenium/package-frame.html
    Unselect Frame
    Select Frame    packageFrame
    Click Link    WebDriver.html
    Unselect Frame
    Select Frame    classFrame
    Click link    Help
    Unselect Frame
    Sleep    3
    Close Browser

TC12_Tabbed_Windows
    Open Browser    https://demo.automationtesting.in/Windows.html    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Click Element    //html/body/div[1]/div/div/div/div[1]/ul/li[1]/a
    Click Element    //*[@id="Tabbed"]/a/button
    Sleep    2
    Close All Browsers

TC13_Multiple_Browsers
    Open Browser    https://www.google.com/    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Open Browser    https://www.bing.com/    ${browser}
    Location Should Be    https://www.bing.com/
    Maximize Browser Window
    Switch Browser    2    #index
    Input Text    id=sb_form_q    Marina
    Click Element    id=sa_5003
    Click link    link:Marina Definition & Meaning - Merriam-Webster
    Switch Browser    1
    Sleep    1s
    Close All Browsers

TC14_RightClick
    Open Browser    https://swisnl.github.io/jQuery-contextMenu/demo.html    ${browser}
    Maximize Browser Window
    Open Context Menu    //html/body/div/section/div/div/div/p/span
    Sleep    2
    Close Browser

TC15_DoubleClick
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}
    Maximize Browser Window
    Sleep    2
    Double Click Element    //*[@id="HTML10"]/div[1]/button
    Sleep    2
    Close Browser

TC16_ScrollPage
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}
    Maximize Browser Window
    Set Selenium Speed    2
    Execute Javascript    window.scrollTo(0,1500)
    Scroll Element Into View    //*[@id="HTML14"]/h2
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Sleep    5
    Execute Javascript    window.scrollTo(0, -document.body.scrollHeight)
    Close Browser

TC17_Table
    Open Browser    https://testautomationpractice.blogspot.com    ${browser}
    Maximize Browser Window
    Set Selenium Speed    3
    ${rows}=    Get Element Count    //*[@id="HTML1"]
    ${columns}=    Get Element Count    //*[@id="HTML1"]
    Log To Console    ${rows}
    Log To Console    ${columns}
    Sleep    2
    Close Browser

TC_18_Upload_File
    Open Browser    https://www.techlistic.com/p/selenium-practice-form.html    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    name=firstname    Marina
    Input Text    name=lastname    Joveska
    Select Radio Button    sex    Female
    Select Radio Button    exp    1
    Input Text    id=datepicker    2/7/2023
    Execute Javascript    window.scrollTo(0,500)
    Select Checkbox    Automation Tester
    Select Checkbox    Selenium Webdriver
    Select From List By Label    id=continents    Europe
    Select From List By Label    selenium_commands    Browser Commands
    Choose File    id=photo    D:\\Marina-2022
    sleep    2
    Close browser

TC_19_Variables
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    name=username    @{CREDENTIALS}
    Input Text    type=password    &{login}
    Click element    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    Log To Console    %{username} run this test on %{os}
    Close Browser
