*** Setting ***
Library           SeleniumLibrary
Library           String
Resource          ../../Resource/WeMall/init.robot
Resource          ../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../Resource/WeMall/WebElement/WMS_MonitoringListing.txt
Resource          ../../Keyword/Common/Member_SignIn.txt
Resource          ../../Keyword/Common/Common.txt

*** Keywords ***
Go To Monitoring Page
    Go to    ${URL_WMS}/monitoringlisting/

Filter Waiting For Checking Block Type
    Wait Until Element Is Visible    ${chk_waiting_for_check}
    Click Element    ${chk_waiting_for_check}
    Click Element    ${btn_click_Search}

Check Waiting For Admin Status
    Element Should Be Visible    ${lbl_pending}

Save Success
    Wait Until Page Contains Element    //div[contains(@id,"notify_flash_success")]

Confirm Update
    [Arguments]    ${Confirm}=True
    Run Keyword If    ${Confirm}    Click Element    //div[contains(@class,"webix_popup_button")][1]/div
    Run Keyword If    ${Confirm}==False    Click Element    //div[contains(@class,"webix_popup_button")][2]/div

Submit
    [Arguments]    ${Confirm}=True
    Click Button    //button[contains(@class,"btn-info")]
    Run Keyword If    ${Confirm}    Confirm Update

Add First Condition
    ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    //input[@name="conditions[0][end]"]
    Run Keyword If    '${is_visible}' == 'False'    Select From List By Value    //div[contains(@class, "buffer")][1]//select    to
    Execute Javascript    $("input[name='conditions[0][end]']").val(100)
    Press Key    //input[@name="conditions[0][end]"]    \\09
    # Sleep    0.5s
    Execute Javascript    $("input[name='conditions[0][value]']").val(80)

Add A Condition
    # Click Element    //span[contains(@class,"btn-success")]
    Click Element    //span[@class='btn btn-success btn-sm']

Remove A Condition
    Click Element    //span[contains(@class,"btn-danger")]

Choose Andup condition on
    [Arguments]    ${row}
    Select From List By Value    //div[contains(@class, "buffer")][${row}]//select    andup

Check Product Status
    [Arguments]    ${id}    ${status}
    WMS Login
    Go to    ${URL_WMS}/monitoringlisting/show/${tesco_store_id}/${id}
    Sleep    1s
    # Page Should Contain    ${status}

Remove All Conditions
    ${row}=    Get Matching Xpath Count    //div[contains(@class,"buffer")]
    : FOR    ${INDEX}    IN RANGE    0    ${row}
    \    ${btn_del}=    Run Keyword And Return Status    Element Should Be Visible    //span[contains(@class,"btn-danger")]
    \    Run Keyword If    ${btn_del}==False    Continue For Loop
    \    Run Keyword If    ${btn_del}    Remove A Condition
    Choose Andup condition on    1
    Submit

Change First Condition From Andup To Range
    ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    //input[@name="conditions[0][end]"]
    Run Keyword If    '${is_visible}' == 'False'    Select From List By Value    //div[contains(@class, "buffer")][1]//select    to

Restore Conditions
    Remove All Conditions
    Change First Condition From Andup To Range
    # Input Text    //input[@name="conditions[0][end]"]    100
    Execute Javascript    $("input[name='conditions[0][end]']").val(100)
    Press Key    //input[@name="conditions[0][end]"]    \\09
    # Sleep    0.5s
    Execute Javascript    $("input[name='conditions[0][value]']").val(80)
    # Input Text    //input[@name="conditions[0][value]"]    80
    # ${is_visible}    Run Keyword And Return Status    Element Should Be Visible    //input[@name="conditions[1][end]"]
    # Run Keyword If    '${is_visible}' == 'False'    Add A Condition
    : FOR    ${index}    IN RANGE    1    3
    \    ${beforeIndex}=    Evaluate    ${index}-1
    \    ${beforeIndex}    Convert To String    ${beforeIndex}
    \    ${ConStart}    Get Value    //input[@name="conditions[${beforeIndex}][end]"]
    \    ${ConEnd}=    Evaluate    ${ConStart}*10
    \    ${ConEnd}    Convert To String    ${ConEnd}
    \    ${Value}    Get Value    //input[@name="conditions[${beforeIndex}][value]"]
    \    ${Value}=    Evaluate    ${Value}-30
    \    ${Value}    Convert To String    ${Value}
    # \    Input Text    //input[@name="conditions[${index}][end]"]    ${ConEnd}
    \    Execute Javascript    $("input[name='conditions[${index}][end]']").val(${ConEnd})
    \    Press Key    //input[@name="conditions[${index}][end]"]    \\09
    \    Input Text    //input[@name="conditions[${index}][value]"]    ${Value}
    \    Add A Condition
    Choose Andup condition on    4
    Input Text    //input[@name="conditions[3][value]"]    10
    Submit

Reset Monitoring on product
    [Arguments]    ${id}
    WMS Login
    Go to    ${URL_WMS}/monitoringlisting/show/${tesco_store_id}/${id}
    Select Window    title=Monitoring Listing
    Execute Javascript    $('.dd2-handle')[13].click()
    Sleep    3s

Update Product price
    [Arguments]    ${id}    ${price}
    Go to    ${URL_PORTAL}
    Check and Reset Seller Login    ${tesco_store_name}    ${seller_user_tesco}    ${seller_pwd_tesco}
    Goto    ${URL_STORE}/${tesco_store_name}/admin/product/edit/${id}
    # Input Text    ${input_selling_price}    ${price}
    Sleep    0.2s
    Execute Javascript    $('#price').val(${price})
    Sleep    0.2s
    Execute Javascript    $('.btn-save').eq(0).click()

Reset All
    [Arguments]    ${id}    ${price}
    #    1.Reset Conditions seting
    #    2.Reset Product price
    #    3.Reset Monitor Listing
    WMS Login
    Goto    ${URL_WMS}/monitoringrule
    Restore Conditions
    # Close Window
    Go to    ${URL_PORTAL}
    Update Product price    ${id}    ${price}
    Reset Monitoring on product    ${id}
    Go to    ${URL_PORTAL}
