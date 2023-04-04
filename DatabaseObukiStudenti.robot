*** Settings ***
Library           DatabaseLibrary

*** Variables ***
${dbname}         joveska
${dbuser}         root
${dbpasswd}       ${EMPTY}
${dbhost}         localhost
${dbport}         3306
@{queryResults}

*** Test Cases ***
TC1_connect_DB_joveska
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    obuki
    Check If Exists In Database    SELECT * FROM obuki
    @{queryResults}    Query    SELECT * FROM obuki

TC2_stored_p__delete_obuki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    obuki
    ${output}=    Execute SQL String    CALL __delete_obuki(14);
    Should Be Equal As Strings    ${output}    None

TC3_stored_p__delete_studenti
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    @{queryResults}    Query    CALL __delete_studenti(15)    FROM studenti;
    FOR    ${row}    IN    @{queryResults}
        IF    ${row} == studenti_id=15
        Log    ${row}
    END
    IF    ${row} =! studenti_id=15
    Log    ${row}    ${row}
    END
    END

TC4_stored_p__insert_studenti
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    ${output}=    Execute SQL String    CALL __insert_studenti(24,'Mihail', 'Todorovski', 11);
    Should Be Equal As Strings    ${output}    None

TC5_stored_p__update_obuki_mentor
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    obuki
    ${output}=    Execute SQL String    CALL __update_obuki_mentor('PY','Ljubisha Popovski','Python')

TC6_stored_p__insert_obuki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    ${output}=    Execute SQL String    CALL __insert_obuki(12,'BT','Ana Ristevska','Business Training');
    Should Be Equal As Strings    ${output}    None

TC7__select_studenti_first_nameA_ASC
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    Check If Exists In Database    SELECT * FROM studenti
    @{queryResults}    Query    SELECT studenti.*, studenti.first_name FROM studenti RIGHT JOIN obuki ON studenti.obuki_id=obuki.obuki_id WHERE studenti.first_name LIKE 'A%' ORDER BY obuki.title ASC;
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC8_stored_p__update_studenti
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    obuki
    ${output}=    Execute SQL String    CALL __update_studenti('Martin','Boskoski',1);

TC9_stored_p__Rjoin_studenti_obuki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    Check If Exists In Database    SELECT * FROM studenti
    @{queryResults}    Query    CALL __Rjoin_studenti_obuki();
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC10__select_obuki_izbor_mentor
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    studenti
    Check If Exists In Database    SELECT * FROM studenti
    @{queryResults}    Query    CALL __select_obuki_mentor_AR('Ljubisha Popovski');
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END
