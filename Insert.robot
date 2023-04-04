*** Settings ***
Resource          ../Keywords/Connect_tbl.robot
Library           DatabaseLibrary

*** Test Cases ***
TC1_insert_patients
    [Setup]
    Connect_tbl_patients
    ${output}=    Execute SQL String    CALL `_*insert_patients`(18,'Meri Mrmkovska',40,'f','Narodna armija 110','Glaukoma','H40',12);
    Should Be Equal As Strings    ${output}    None

TC2_insert_doctors
    Connect_tbl_doctors
    ${output}=    Execute SQL String    CALL `_*insert_doctors`(21,'Mare Kondoska',33,' f ','Family medicine');
    Should Be Equal As Strings    ${output}    None

TC3_insert_laboratory
    Connect_tbl_laboratory
    ${output}=    Execute SQL String    CALL `_*insert_laboratory`(16,'2022-10-01','Percutaneous skin test and the allergen-specific immunoglobulin E (IgE) antibody test',16,1);
    Should Be Equal As Strings    ${output}    None
