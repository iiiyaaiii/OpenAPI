*** Settings ***
Suite Setup    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Suite Teardown    Close All Browsers
Resource    ../../../../Resource/WeMall/init.robot
Resource    ../../../../Keyword/Common/LevelD.txt
Resource    ../../../../Keyword/Common/Home.txt
Resource    ../../../../Keyword/Common/Store_Front.txt
Resource    ../../../../Keyword/Common/Member_SignIn.txt
Resource    ../../../../Keyword/Common/TruemoveH_productVerify.txt
Resource    ../../../../Resource/WeMall/WebElement/LevelD.txt
Resource    ../../../../Resource/WeMall/WebElement/Member_SignIn.txt

*** Variable ***
${product_name_sim}    ซิม Truemove-H
${product_name_other}    Other_Product_test
${url_landing}    https://www.wemall-dev.com/itruemart/sim/number
${product_id_sim}    L91200122
${product_id_other}    L91200470
${url_leveld}    https://www.wemall-dev.com/d/${product_id_other}

*** Test Cases ***
TC_MC_09232
    [Documentation]    Verify levelD product sim by search product
    [Tags]    Regression    Medium
    Home.Open Wemall Portal page
    Home.Enter Search Keyword    ${product_name_sim}
    Home.Click Search button
    Home.Click Product For Search    ${product_name_sim}
    LevelD.Verify To Landing Page    ${url_landing}

TC_MC_09233
    [Documentation]    Verify levelD product sim by URL to leveld product
    [Tags]    Regression    Medium
    Home.Open Wemall Portal page
    LevelD.GoTo Lv D Sim    ${product_id_sim}
    LevelD.Verify To Landing Page    ${url_landing}

TC_MC_09234
    [Documentation]    Verify levelD other product by search product
    [Tags]    Regression    Medium
    Home.Open Wemall Portal page
    Home.Enter Search Keyword    ${product_name_other}
    Home.Click Search button
    Home.Click Product For Search    ${product_name_other}
    LevelD.Verify To LevelD    ${url_leveld}

TC_MC_09235
    [Documentation]    Verify levelD other product by URL to leveld product
    [Tags]    Regression    Medium
    Home.Open Wemall Portal page
    LevelD.GoTo Lv D WeMall    ${product_id_other}
    LevelD.Verify To LevelD    ${url_leveld}

TC_MC_09236
    [Documentation]    Verify levelD sim product form storefront
    [Tags]    Regression    Medium
    Store_Front.Open Store Front page    itruemart
    Store_Front.Click Product In StoreFrontPromotion    ${product_name_sim}
    LevelD.Verify To Landing Page    ${url_landing}

TC_MC_09237
    [Documentation]    Verify levelD other product form storefront
    [Tags]    Regression    Medium
    Store_Front.Open Store Front page    robot_stg_store2
    Store_Front.Click Product In StoreFrontPromotion    ${product_name_other}
    LevelD.Verify To LevelD    ${url_leveld}

TC_MC_09238
    [Documentation]    Verify levelD other product form storefront
    [Tags]    Regression    Medium
    [setup]    Edit Status Inactive Sim
    [Teardown]    Edit Status Active Sim
    Home.Open Wemall Portal page
    Home.Enter Search Keyword    ${product_name_sim}
    Home.Click Search button
    Home.Click Product For Search    ${product_name_sim}
    LevelD.Verify To LevelD    https://www.wemall-dev.com/d/${product_id_sim}

TC_MC_09239
    [Documentation]    Verify levelD incase inactive status sim by URL to leveld product
    [Tags]    Regression    Medium
    [setup]    Edit Status Inactive Sim
    [Teardown]    Edit Status Active Sim
    Home.Open Wemall Portal page
    LevelD.GoTo Lv D WeMall    ${product_id_sim}
    LevelD.Verify To LevelD    https://www.wemall-dev.com/d/${product_id_sim}

TC_MC_09240
    [Documentation]    Verify levelD incase inactive status sim from storefront
    [Tags]    Regression    Medium
    [setup]    Edit Status Inactive Sim
    [Teardown]    Edit Status Active Sim
    Store_Front.Open Store Front page    itruemart
    Store_Front.Click Product In StoreFrontPromotion    ${product_name_sim}
    LevelD.Verify To LevelD    https://www.wemall-dev.com/d/${product_id_sim}


*** Keywords ***
Edit Status Inactive Sim
    WMS Switch Project    wm
    TruemoveH_productVerify.Go to TruemoveH Product Verify on wms page
    TruemoveH_productVerify.Select Merchant to search product verify    True Move
    TruemoveH_productVerify.Search product verify by product ID    91200122
    TruemoveH_productVerify.Edit the status successfully    Inactive

Edit Status Active Sim
    WMS Switch Project    wm
    TruemoveH_productVerify.Go to TruemoveH Product Verify on wms page
    TruemoveH_productVerify.Select Merchant to search product verify    True Move
    TruemoveH_productVerify.Search product verify by product ID    91200122
    TruemoveH_productVerify.Edit the status successfully    Active

