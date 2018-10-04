*** Settings ***
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Variables ***
${test_percent_promotion}    percent discount code
${test_percent_desc}        ซื้อสินค้าตั้งแต่ 500 บาทขึ้นไป ลดเพิ่ม 10% ลดสูงสุดไม่เกิน 1,000 บาท
${test_percent_date}        ระยะเวลาโปรโมชั่น: 30 ม.ค. (00:00 น.) - 11 พ.ค. 2562 (23:59 น.)
${test_thb_promotion}       thb discount code
${test_thb_desc}            ซื้อสินค้าตั้งแต่ 500 บาทขึ้นไป ลดเพิ่ม 55 บาท
${test_thb_date}            ระยะเวลาโปรโมชั่น: 30 ม.ค. (16:57 น.) - 3 พ.ค. 2562 (17:07 น.)
${test_active}              percent discount code
${test_inactive}            Inactive Seller Promotion
${test_expired}             Expired Seller Promotion

*** Test Cases ***
TC_MC_06924
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - Type - Percent (%) Discount
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Scroll To Seller Promotion    ${test_percent_promotion}
    Mobile_StoreFront.Seller Promotion Description Should Be Appeared    ${test_percent_promotion}    ${test_percent_desc}
    Mobile_StoreFront.Seller Promotion Duration Should Be Appeared    ${test_percent_promotion}    ${test_percent_date}

TC_MC_06925
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - Type - THB Discount
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Scroll To Seller Promotion    ${test_thb_promotion}
    Mobile_StoreFront.Seller Promotion Description Should Be Appeared    ${test_thb_promotion}    ${test_thb_desc}
    Mobile_StoreFront.Seller Promotion Duration Should Be Appeared    ${test_thb_promotion}    ${test_thb_date}

TC_MC_06935
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - Status - Active (แสดง)
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Seller Promotion Should Be Appeared    ${test_active}

TC_MC_06936
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - Status - Inactive (ซ่อน)
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Seller Promotion Should Not Be Appeared    ${test_inactive}

TC_MC_06937
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - Status - Expired (หมดอายุ)
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Seller Promotion Should Not Be Appeared    ${test_expired}

TC_MC_06938
    [Documentation]    [Store][LevelB][Mobile] Seller Promotion - ดูสินค้าทั้งหมด
    [Tags]    Regression    Ligo    Sprint2017MC19
    Mobile_StoreFront.Open Wemall Seller Promotion List Page On Mobile    ${store_url1}
    Mobile_StoreFront.Seller Promotion List Page Should Be Appeared
    Mobile_StoreFront.Seller Promotion Should Be Appeared    ${test_active}
    Mobile_StoreFront.Click View Product In Seller Promotion    ${test_active}
    Mobile_StoreFront.Seller Promotion List Page Should Not Be Appeared
