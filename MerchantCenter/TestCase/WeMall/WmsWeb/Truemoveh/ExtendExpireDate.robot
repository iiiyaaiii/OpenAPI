*** Settings ***
Suite Setup       WMS Switch Project    wm
Suite Teardown    Close All Browsers
Test Setup        Check Mobile Report Data
Force Tags        WMS-Web    Truemoveh    mock
Library           SeleniumLibrary
Library           String
Library           DateTime
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Truemoveh.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt

*** Test case ***
TC_MC_06076
    [Documentation]    Set expire date page display error message if user leaves "Set expire date" field as blank
    [Tags]    Medium
    Click Element    //input[@name="reset"]
    Execute Javascript    $('#import_date_from').val('2017-12-15').datepicker('update');
    Click Element    //input[@name="submit"]
    Set Expire Date    ${EMPTY}
    Element Should Not Be Visible    //*[@id="table_report_info"]

TC_MC_06077
    [Documentation]    Select Import Date From only and can be set new expire date more than old expire date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Execute Javascript    $('#import_date_from').val('2017-12-15').datepicker('update');
    Click Element    //input[@name="submit"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${Next_year}    Evaluate    ${year} + 1
    ${expire_date}    Catenate    ${Next_year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} < ${expire_date_time_new}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06078
    [Documentation]    Select Import Date To only and can be set new expire date less than old expire date
    [Tags]    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=%Y-%m-%d    exclude_millis=True
    ${current_date_str}    Convert To String    ${current_date}
    ${current_date_str}    Get Substring    ${current_date_str}    \    10
    Execute Javascript    $('#import_date_to').val('${current_date_str}').datepicker('update');
    Click Element    //input[@name="submit"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${last_year}    Evaluate    ${year} - 1
    ${expire_date}    Catenate    ${last_year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} > ${expire_date_time_new}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06079
    [Documentation]    Import Date From-To as same day and can be set new expire date as same as old expire date
    [Tags]    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Execute Javascript    $('#import_date_from').val('2017-12-15').datepicker('update');
    Execute Javascript    $('#import_date_to').val('2017-12-15').datepicker('update');
    Click Element    //input[@name="submit"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} == ${expire_date_time_new}

TC_MC_06080
    [Documentation]    Import Date From-To = length more than 1 day and can be set new expire date more than current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=datetime    exclude_millis=True
    ${next_date}    Add Time To Date    ${current_date}    2 days
    ${next_date}    Convert Date    ${next_date}    result_format=%Y-%m-%d
    ${next_date_str}    Convert To String    ${next_date}
    ${next_date_str}    Get Substring    ${next_date_str}    \    10
    Select From List By Label    //*[@id="lot"]    testexpire
    Execute Javascript    $('#import_date_from').val('2017-12-15').datepicker('update');
    Execute Javascript    $('#import_date_to').val('2017-12-16').datepicker('update');
    Click Element    //input[@name="submit"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    Set Expire Date    ${next_date_str}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_new} != ${expire_date_time_old}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06081
    [Documentation]    Search by mobile number and can be set new expire date less than current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Input Text    //input[@id="mobile"]    0901300001
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=datetime    exclude_millis=True
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${current_date}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${last_day}    Evaluate    ${day} - 3
    ${expire_date}    Catenate    ${year}-${month}-${last_day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Input Text    //input[@id="mobile"]    0901300001
    Click Element   //select[@id="expired"]/option[2]
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06082
    [Documentation]    Search by lot and can be set new expire date as same as current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date1}    Catenate    ${year}-${month}-${day}
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=%Y-%m-%d    exclude_millis=True
    ${current_date_str}    Convert To String    ${current_date}
    ${current_date_str}    Get Substring    ${current_date_str}    \    10
    Set Expire Date    ${current_date_str}
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}    Convert To String    ${expire_date_time_new}
    ${expire_date_time_new}    Get Substring    ${current_date_str}    \    10
    Should Contain    ${expire_date_time_new}    ${current_date_str}
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Click Element    //input[@name="submit"]
    Set Expire Date    ${expire_date1}


TC_MC_06083
    [Documentation]    Search by mobile type and can be set new expire date more than old expire date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@name="mobile_type"]    Gold
    Select From List By Label    //*[@id="lot"]    testexpire
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${Next_year}    Evaluate    ${year} + 1
    ${expire_date}    Catenate    ${Next_year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} < ${expire_date_time_new}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06084
    [Documentation]    Expire Status = Expired and can be set new expire date less than old expire date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpir2
    Click Element    //input[@name="submit"]
    Set Expire Date    2017-08-10
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="expired"]    Expired
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]

    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${last_year}    Evaluate    ${year} - 1
    ${expire_date}    Catenate    ${last_year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} > ${expire_date_time_new}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06085
    [Documentation]    Expire Status = Not Expired and can be set new expire date as same as old expire date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Select From List By Label    //*[@id="expired"]    Not Expired
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} == ${expire_date_time_new}

TC_MC_06086
    [Documentation]    Status = Active and can be set new expire date more than current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=datetime    exclude_millis=True
    ${next_date}    Add Time To Date    ${current_date}    2 days
    ${next_date}    Convert Date    ${next_date}    result_format=%Y-%m-%d
    ${next_date_str}    Convert To String    ${next_date}
    ${next_date_str}    Get Substring    ${next_date_str}    \    10
    Select From List By Label    //*[@id="lot"]    testexpire
    Select From List By Label    //*[@id="status"]    Active
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    Set Expire Date    ${next_date_str}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_new} != ${expire_date_time_old}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06087
    [Documentation]    Status = Inactive and can be set new expire date less than current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="status"]    Inactive
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=datetime    exclude_millis=True
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${current_date}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${last_day}    Evaluate    ${day} - 3
    ${expire_date}    Catenate    ${year}-${month}-${last_day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Select From List By Label    //*[@id="status"]    Inactive
    Select From List By Label    //*[@id="expired"]    Expired
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06088
    [Documentation]    Status = Draft can be set new expire date more than old expire date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Select From List By Label    //*[@id="lot"]    testexpire
    Click Element   //select[@id="status"]/option[4]
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_old}=    Convert Date    ${expire_date_time}    epoch
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${Next_year}    Evaluate    ${year} + 1
    ${expire_date}    Catenate    ${Next_year}-${month}-${day}
    Set Expire Date    ${expire_date}
    Sleep    3s
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}=    Convert Date    ${expire_date_time_new}    epoch
    Should Be True    ${expire_date_time_old} < ${expire_date_time_new}
    ${expire_date}    Catenate    ${year}-${month}-${day}
    Set Expire Date    ${expire_date}

TC_MC_06089
    [Documentation]    Status = Used and can be set new expire date as same as current date
    [Tags]    Regression    Medium
    Click Element    //input[@name="reset"]
    Click Element   //select[@id="status"]/option[5]
    Click Element    //input[@name="submit"]
    Element Should Be Visible    //*[@id="table_report_info"]
    Element Should Be Visible    //*[@id="sample-table-2_paginate"]
    ${expire_date_time}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${datetime}=    Convert Date    ${expire_date_time}    datetime
    ${year}    Convert To String    ${datetime.year}
    ${month}    Convert To String    ${datetime.month}
    ${day}    Convert To String    ${datetime.day}
    ${expire_date1}    Catenate    ${year}-${month}-${day}
    ${current_date}    Get Current Date    UTC    +7 hours    result_format=%Y-%m-%d    exclude_millis=True
    ${current_date_str}    Convert To String    ${current_date}
    ${current_date_str}    Get Substring    ${current_date_str}    \    10
    Set Expire Date    ${current_date_str}
    ${expire_date_time_new}=    Get Text    //*[@id="sample-table-2_wrapper"]/table/tbody/tr[1]/td[5]
    ${expire_date_time_new}    Convert To String    ${expire_date_time_new}
    ${expire_date_time_new}    Get Substring    ${current_date_str}    \    10
    Should Contain    ${expire_date_time_new}    ${current_date_str}
    Click Element    //input[@name="reset"]
    Click Element   //select[@id="status"]/option[5]
    Click Element    //input[@name="submit"]
    Set Expire Date    ${expire_date1}

