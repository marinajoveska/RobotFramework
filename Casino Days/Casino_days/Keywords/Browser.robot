*** Settings ***
Library           Selenium2Library

*** Variables ***
${chrome}         chrome
${url}            https://casinodays.com/in
${opera}          opera
${firefox}        ff

*** Keywords ***
Chrome
    Open Browser    ${url}    ${chrome}

Opera
    Open Browser    ${url}    ${opera}

Firefox
    Open Browser    ${url}    ${firefox}
