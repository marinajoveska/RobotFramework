*** Settings ***
Library           Selenium2Library

*** Test Cases ***
TC1_Create_new_account
    Open Browser    https://www.facebook.com/    Chrome
    Maximize Browser Window
    Set Selenium Speed    2
    Sleep    2
    Click Element    xpath=//html/body/div[1]/div[1]/div[1]/div/div/div/div[2]/div/div[1]/form/div[5]/a
    Wait until page contains    Sign Up
    Input text    name=firstname    Marina
    Input text    name=lastname    Joveska
    Input text    name=reg_email__    38972555684
    Input text    id=password_step_input    joveski
    Select From List By Value    id=month    6
    Select From List By Value    id=day    9
    Select From List By Value    id=year    1988
    Select Radio Button    sex    2
    Click Element    name=websubmit
    Sleep    2
    Close Browser
