*** Settings ***
Library           DatabaseLibrary
Resource          ../Keywords/Connect_tbl.robot

*** Test Cases ***
TC1_update_age_doct_with_spec
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*update_age_doct_with_spec`(37, 'Neurology');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC2_*update_lab_test_regex
    Connect_tbl_laboratory
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*update_lab_test_regex`('Test:');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC3_update_fullname_patients_id
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*update_fullname_patients_id`('Gligor Adamoski', 7);
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC4_update_desease_patients_id
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*update_desease_patients_id`('Thyrotoxicosis [hyperthyroidism]', 9);
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END
