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
    Table Must Exist    marki
    Check If Exists In Database    SELECT * FROM marki
    @{queryResults}    Query    SELECT * FROM marki

TC2_count_group_by_fabriki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    SELECT * FROM marki
    @{queryResults}    Query    SELECT country, COUNT(marki_id)FROM marki GROUP BY country ORDER BY COUNT(marki_id) DESC LIMIT 3;

TC3_delete_model
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    ${output}=    Execute SQL String    DELETE FROM modeli WHERE modeli_id=5;
    Should Be Equal As Strings    ${output}    None

TC4_insert_marki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    ${output}=    Execute SQL String    INSERT INTO marki VALUES(28, 'BMW', 'US', '0');
    Should Be Equal As Strings    ${output}    None

TC5_insert_modeli
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    ${output}=    Execute SQL String    INSERT INTO modeli VALUES (22, 'M5', 65000, '#ff00AA', 28);
    Should Be Equal As Strings    ${output}    None

TC6__select_all_country_by_br_fabriki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    SELECT * FROM marki
    @{queryResults}    Query    SELECT country, COUNT(*) AS Br_fabriki FROM marki;

TC7_select_color_crna
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    Check If Exists In Database    SELECT * FROM modeli
    @{queryResults}    Query    SELECT * FROM modeli WHERE color LIKE '#000000';

TC8_select_country_EU
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    SELECT * FROM marki WHERE eu=1;
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC9_select_list_country_by_br_fabriki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    SELECT country, COUNT(marki_id) FROM marki GROUP BY country ORDER BY COUNT(marki_id) DESC;
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC10_select_marki
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    SELECT * FROM marki;
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC11_select_marki_by_1country
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    SELECT * FROM marki WHERE country LIKE 'IT';

TC12_select_marki_by_2country
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    SELECT * FROM marki WHERE country LIKE 'IT' OR 'US';
    [Teardown]    Disconnect From Database

TC13_select_MAX_price
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    @{queryResults}    Query    SELECT * FROM modeli WHERE price =(SELECT MAX(price)FROM modeli);
    [Teardown]    Disconnect From Database

TC14_select_MIN_price
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    @{queryResults}    Query    SELECT * FROM modeli WHERE price =(SELECT MIN(price)FROM modeli);
    [Teardown]    Disconnect From Database

TC15_select_modeli_cena3000_5000
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    @{queryResults}    Query    SELECT modeli_name, price AS CenaOd3000Do5000EU FROM modeli WHERE price BETWEEN '3000' AND'5000';
    [Teardown]    Disconnect From Database

TC16_select_modeli_clasaA
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    @{queryResults}    Query    SELECT * FROM modeli WHERE modeli_name LIKE 'A%';
    [Teardown]    Disconnect From Database

TC17_select_modeli_color_crni_poskapi_9000
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    ${output}=    Execute SQL String    SELECT * FROM modeli WHERE color = '#000000' AND price>=9000;
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC18_update_marki
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    ${output}=    Execute SQL String    UPDATE marki SET marki_name='CHEVROLET', country='US', eu=0    WHERE marki_id=27;
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC19_update_modeli
    [Documentation]    This test case update one model of car i table modeli.
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    ${output}=    Execute SQL String    UPDATE modeli SET modeli_name='Silverado', price=52000, color='#AA2558' WHERE modeli_id=22;
    Log To Console    ${output}
    Should Be Equal As Strings    ${output}    None
    [Teardown]    Disconnect From Database

TC20_select_for
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    modeli
    @{queryResults}    Query    SELECT * FROM modeli
    FOR    ${row}    IN    @{queryResults}
        Log    ${row}
    END

TC21_stored_procedure_If
    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    @{queryResults}    Query    CALL _select_modeli_cena3000_5000    FROM marki;
    FOR    ${row}    IN    @{queryResults}
        IF    ${row} == 3000
        Log    ${row}
    END
    IF    ${row} == 5000
    Log    ${row}    ${row}
    END
    END

TC22_stored_procedure_Log_many
    [Setup]    Connect To Database    pymysql    ${dbname}    ${dbuser}    ${dbpasswd}    ${dbhost}    ${dbport}
    Table Must Exist    marki
    Check If Exists In Database    SELECT * FROM marki
    @{queryResults}    Query    CALL _select_MIN_price()
    Log Many    @{queryResults}
