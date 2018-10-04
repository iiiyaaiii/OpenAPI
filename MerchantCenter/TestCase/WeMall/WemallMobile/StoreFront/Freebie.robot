*** Settings ***
[Documentation]    Verify the Freebie tag on WeMall Mobile
Suite Teardown    Close All Browsers
Test Teardown     Run Keywords    Capture Page Screenshot    AND    Close Browser
Force Tags        Wemall-Mobile
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Keyword/Common/Mobile_StoreFront.robot

*** Variable ***
${freebie_product_name1}    KAMUG
${storename}    kamu
${seller_promotion_id}    6396
${category_id}    153674

*** Test Cases ***
TC_MC_11181
    [Documentation]     [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Home page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Validate freebie promotion correctly displayed

TC_MC_11185
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Lvl C product list page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Open store Fornt LevelC Prduct All Page    ${storename}
    Validate freebie promotion correctly displayed

TC_MC_11189
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Highlight product page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Open store Fornt LevelC Collection Page    ${storename}
    Validate freebie promotion correctly displayed

TC_MC_11193
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Lvl C category page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Open store Fornt LevelC Category Page    ${storename}    ${category_id}
    Validate freebie promotion correctly displayed

TC_MC_11197
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Lvl C promotion page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Open store Fornt LevelC Seller Promotion Page    ${storename}    ${seller_promotion_id}
    Validate freebie promotion correctly displayed

TC_MC_11201
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Search result page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Store Front Page On Mobile    ${storename}
    Enter Search Keyword    ${freebie_product_name1}
    Click Search Button
    Validate freebie promotion correctly displayed

TC_MC_11205
    [Documentation]    [Mobile] Verify the product's image with the freebie tag on Wemall Storefront Lvl B promotion page when promotion status is available
    [Tags]    Regression    Ligo
    Open Wemall Seller Promotion List Page On Mobile    ${storename}
    Validate freebie promotion correctly displayed

