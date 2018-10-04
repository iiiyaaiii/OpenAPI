*** Settings ***
# Suite Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
# Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/WMS_Blockshop.txt
Resource          ../../../../Keyword/Common/WMS_Blockproduct.txt
Resource          ../../../../Keyword/Common/WMS_Promocode.txt
Resource          ../../../../Keyword/Common/Product.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Cart.txt
# Resource          ../../../../Keyword/Common/Account_Refund.txt
Resource          ../../../../Resource/${BU}/WebElement/LevelD.txt
Resource          ../../../../Resource/${BU}/WebElement/Campaign.txt
Resource          ../../../../Keyword/Common/WMSCommonKeyword.robot
Suite Setup       Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    Login To WMS    ${wms_user}    ${wms_pass}
Suite Teardown    Close All Browsers
Force Tags        mc-wls    Queue

*** Test Cases ***
TC_MC_08346
    [Documentation]    Shop have status beware product show on levelD
    [Tags]    Regression    High    mock
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    # WMS Switch Project    wls
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    beware
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    normal
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']

TC_MC_08349
    [Documentation]    Shop have status warning product not show on levelD
    [Tags]    Regression    High    mock
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    # WMS Switch Project    wls
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    1s
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    warning
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'False'    Element Should Be Visible    //div[@class='box-no-result']
    \    Run Keyword If    '${status}' == 'False'    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    \    Run Keyword If    '${status}' == 'False'    Exit For Loop
    \    Run Keyword If    '${status}' == 'True'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='box-no-result']
    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    normal
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']

TC_MC_08352
    [Documentation]    Shop have status blocked product not show on levelD
    [Tags]    Regression    High    mock
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    # WMS Switch Project    wls
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    1s
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    blocked
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'False'    Element Should Be Visible    //div[@class='box-no-result']
    \    Run Keyword If    '${status}' == 'False'    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    \    Run Keyword If    '${status}' == 'False'    Exit For Loop
    \    Run Keyword If    '${status}' == 'True'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='box-no-result']
    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    Go to    ${URL_WMS}
    Change Shop Product Status    shop    ${blockstore_id2}    normal
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']

TC_MC_08355
    [Documentation]    Product have status ปิด by admin product not show on levelD
    [Tags]    Regression    High    mock
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    # WMS Switch Project    wls
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    1s
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    product    ${robot_blockstore2_instock_type_new}    ปิด
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'False'    Element Should Be Visible    //div[@class='box-no-result']
    \    Run Keyword If    '${status}' == 'False'    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    \    Run Keyword If    '${status}' == 'False'    Exit For Loop
    \    Run Keyword If    '${status}' == 'True'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='box-no-result']
    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    Go to    ${URL_WMS}
    Change Shop Product Status    product    ${robot_blockstore2_instock_type_new}    แสดง
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    3
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']

TC_MC_08358
    [Documentation]    Product have status ไม่ผ่านการตรวจสอบ product not show on levelD
    [Tags]    Regression    High    mock
    [Setup]    Run Keywords    Go to WMS    AND    Switch Project On WMS    wls
    # WMS Switch Project    wls
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    1s
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go to    ${URL_WMS}
    Change Shop Product Status    product    ${robot_blockstore2_instock_type_new}    ไม่ผ่านการตรวจสอบ
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'False'    Element Should Be Visible    //div[@class='box-no-result']
    \    Run Keyword If    '${status}' == 'False'    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    \    Run Keyword If    '${status}' == 'False'    Exit For Loop
    \    Run Keyword If    '${status}' == 'True'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='box-no-result']
    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    Go to    ${URL_WMS}
    Change Shop Product Status    product    ${robot_blockstore2_instock_type_new}    ผ่านการตรวจสอบ
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    3
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']

TC_MC_08362
    [Documentation]    Hided product
    [Tags]    Regression    High    mock
    Clear Active Login
    Go To Login    ${blockstore_email2}    ${blockstore_password2}
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Sleep    1s
    ${product_status}    Run Keyword And Return Status    Element Should Be Visible    ${leveld_itemname}
    Run Keyword If    '${product_status}' == 'False'    Pass Execution    Message : Exit Testcase because product is not available.
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Go To    ${URL_STORE}/${blockstore_url2}/admin/product
    Sleep    3s
    Input Text    //input[@id='search']    ${robot_blockstore2_instock_type_new}
    Press Key    //input[@id='search']    \\13
    Sleep    1
    Execute Javascript    $('.icon-q-editpd').click()
    Execute Javascript    $('.status-icon.icon-eye-show-green.tooltip-grey').click()
    Execute Javascript    $('.quick-save').click()
    Sleep    3
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'False'    Element Should Be Visible    //div[@class='box-no-result']
    \    Run Keyword If    '${status}' == 'False'    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    \    Run Keyword If    '${status}' == 'False'    Exit For Loop
    \    Run Keyword If    '${status}' == 'True'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='box-no-result']
    Element Should Contain    //p[@class='no-result-title']    ไม่พบหน้านี้ในระบบ
    Go To    ${URL_STORE}/${blockstore_url2}/admin/product
    Sleep    3s
    Execute Javascript    $('.checkbox-select').click()
    Execute Javascript    $('#btn_visible').click()
    Sleep    0.5s
    Execute Javascript    $('.btn.btn-primary').click()
    Sleep    3
    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    : FOR    ${index}    IN RANGE    0    10
    \    Sleep    5s
    \    ${status}    Run Keyword And Return Status    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='lvd-shop-info ']
    \    Run Keyword If    '${status}' == 'True'    Element Should Be Visible    //div[@class='product-detail']
    \    Run Keyword If    '${status}' == 'True'    Exit For Loop
    \    Run Keyword If    '${status}' == 'False'    Go to    ${URL_LEVEL_D}/${robot_blockstore2_instock_type_new}?refresh=changeme
    Element Should Be Visible    //div[@class='lvd-shop-info ']
    Element Should Be Visible    //div[@class='product-detail']
    Clear Active Login
