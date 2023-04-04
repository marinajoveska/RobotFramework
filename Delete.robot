*** Settings ***
Library           DatabaseLibrary
Resource          ../Keywords/Connect_tbl.robot

*** Test Cases ***
TC1_delete_patients_id
    Connect_tbl_patients
    ${output}=    Execute SQL String    CALL `_*delete_patients_id`(5);
    Should Be Equal As Strings    ${output}    None

TC2_delete_doctors_id
    Connect_tbl_doctors
    ${output}=    Execute SQL String    CALL `_*delete_patients_id`(5);
    Should Be Equal As Strings    ${output}    None

TC3_delete_lab_test_id
    Connect_tbl_laboratory
    ${output}=    Execute SQL String    CALL `_*delete_lab_test_id`(8);
    Should Be Equal As Strings    ${output}    None

TC4_delete_lab_date
    Connect_tbl_laboratory
    ${output}=    Execute SQL String    CALL `_*delete_lab_date`('2023-03-10');
    Should Be Equal As Strings    ${output}    None

TC5_delete_lab_test
    Connect_tbl_laboratory
    ${output}=    Execute SQL String    CALL `_*delete_lab_test`('Test:Autoantibody Tests');
    Should Be Equal As Strings    ${output}    None
