*** Settings ***
Suite Setup    Open Custom Browser    ${URL_PORTAL}    Mobile
Suite Teardown    Close All Browsers
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Mobile_LevelD.robot
Resource          ../../../../Keyword/Common/Mobile_Cart.robot

*** Variables ***
${product_truepoint}    L91556662
${true_condition}    ใช้ทรูพอยท์ 1,000 คะแนน + 1,000 บาท
${true_remark}    แลกสินค้าด้วยทรูพอยท์สามารถแลกได้เพียงครั้งละ 1 ชิ้นเท่านั้น

*** Test Cases ***
TC_MC_12168
    [Documentation]    [Mobile] Verify icon TruePoint under product on cart when this product already set TruePoint
    [Tags]    Regression    High
    Delete All Product In Cart Mobile
    Open Product Level D Page    ${product_truepoint}
    Click Add Truepoint To Cart
    Verify Truepoint In Cart Mobile    ${true_condition}    ${true_remark}
