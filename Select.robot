*** Settings ***
Library           DatabaseLibrary
Resource          ../Keywords/Connect_tbl.robot

*** Test Cases ***
TC1_select_patient_diagnosis%K5%
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*selectpatient_diagnosis%K5%`();
    Row Count

TC2_select_count_patients_group_by_gender
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*selectpatient_diagnosis%K5%`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC3_select_diagnosis_code
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_diagnosis_code`(K56.2);

TC4_select_doctors>40
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*select_doctors>40`();

TC5_*select_patients_where_doctors_id<>15ASC
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*select_patients_where_doctors_id<>15ASC`();

TC6_select_count_patients_group_by_gender
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_count_patients_group_by_gender`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC7_select_doc_specP%y
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*select_doc_specP%y`();

TC8_select_lab_test
    Connect_tbl_laboratory
    Check If Exists In Database    SELECT * FROM laboratory
    @{queryResults}    Query    CALL `_*select_lab_test`('Test:Colonoscopy');

TC9_select_lab_test%Skin%
    Connect_tbl_laboratory
    Check If Exists In Database    SELECT * FROM laboratory
    @{queryResults}    Query    CALL `_*select_lab_test%Skin%`();

TC10_select_man_patients_age>=40
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_man_patients_age>=40`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC11_select_patientsASC
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_patientsASC`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC12_select_patients_diagnosis
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_patients_diagnosis`('H40');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC13_*select_patients_not_range18to25
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_patients_not_range18to25`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC14_select_patients_no_diagnosis
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_patients_not_range18to25`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC15_select_count_total_doctors
    Connect_tbl_doctors
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*select_count_total_doctors`();

TC16_select_total_patients
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM doctors
    @{queryResults}    Query    CALL `_*select_total_patients`();

TC17_select_total_patients_age>40
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_total_patients_age>40`
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC18_select_women_age>=40
    Connect_tbl_patients
    Check If Exists In Database    SELECT * FROM patients
    @{queryResults}    Query    CALL `_*select_women_age>=40`();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END
