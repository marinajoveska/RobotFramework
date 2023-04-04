*** Settings ***
Library           Selenium2Library

*** Test Cases ***
TC1_W3Schools
    Open Browser    https://www.w3schools.com/    chrome
    Sleep    2
    Maximize Browser Window
    Input Text    id=search2    Selenium Tutorial
    Click Button    id=learntocode_searchbtn

TC2_Click
    Open Browser    https://www.w3schools.com/    chrome
    Sleep    2
    Maximize Browser Window
    Click Element    //*[@id="navbtn_tutorials"]
    Sleep    2
    Click Element    //*[@id="nav_tutorials"]/div/div/div[2]/a[1]
    Sleep    2
    Click Element    //*[@id="leftmenuinnerinner"]/a[3]

TC3_Click_all_manu_buttons
    Open Browser    https://www.w3schools.com/    Chrome
    Maximize Browser Window
    Sleep    2
    Click Element    id=navbtn_tutorials
    Sleep    2
    Click Element    //*[@id="nav_tutorials"]/div/div/div[2]/a[1]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[3]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[4]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[5]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[6]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[7]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[8]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[9]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[13]
    Sleep    2
    Click Element    //*[@id="topnav"]/div/div[1]/a[14]
    Sleep    2
    Close Browser
