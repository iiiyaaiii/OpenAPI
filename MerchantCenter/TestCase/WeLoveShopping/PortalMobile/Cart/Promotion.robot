*** Settings ***
Suite Setup    Open Custom Browser    ${URL_PORTAL}    Mobile
Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot
Resource          ../../../../Keyword/Common/Mobile_Cart.robot

*** Variables ***
${product_truepoint_wls}    L91556655
${txt_condition_truepoint_wls}    ใช้ทรูพอยท์ 1,000 คะแนน + 100 บาท
${txt_remark_truepoint_wls}     แลกสินค้าทรูพอยท์สามารถแลกได้เพียงครั้งละ 1 ชิ้นเท่านั้น

*** Test Cases ***
TC_MC_12270
    [Documentation]    [WLS][Mobile] Verify icon TruePoint under product on cart when this product already set TruePoint
    [Tags]    Regression    Medium
    Open Product LevelD Weloveshopping    ${product_truepoint_wls}
    Click Add Truepoint To Cart Weloveshopping Mobile
    Verify Truepoint In Cart Mobile For WeLoveshopping    ${txt_condition_truepoint_wls}    ${txt_remark_truepoint_wls}



