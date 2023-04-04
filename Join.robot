*** Settings ***
Library           DatabaseLibrary
Resource          ../Keywords/Connect_tbl.robot

*** Test Cases ***
TC1_*join_minors_patients
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_minors_patients`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC2_*join_parients_specialization_department
    Connect_tbl_patients
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_parients_specialization_department`('Family medicine');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC3_*join_patients_doctors
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_patients_doctors`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC4_join_patients_doctors_laboratory
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*join_patients_doctors`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC5_join_tested_patients_before_date
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_tested_patients_before_date`(2023-01-23);
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC6_join_tested_patients_after_date
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_tested_patients_after_date`(2023-12-23);
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC7_join_tested_patient_between_2dates
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*join_tested_patient_between_2dates`('2022-01-01','2022-12-01');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC8_*join_verify_full_name_0
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    Row Count Is 0    CALL `_*join_verify_full_name_0`();
