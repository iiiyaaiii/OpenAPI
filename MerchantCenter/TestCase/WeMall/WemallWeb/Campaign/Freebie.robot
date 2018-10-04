*** Settings ***
Suite Setup       Open and Prepare Data
Suite Teardown    Close All Browsers
Force Tags        Wemall-Web    Ligo
Test Setup        Go to    ${URL_PORTAL}
Test Timeout      2 minutes
Library           SeleniumLibrary    run_on_failure=Capture Page Screenshot
Library           String
Library           Collections
Library           ../../../../Keyword/PythonLibrary/_customkeyword.py
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/WMS_CampaignAdminTool.robot
Resource          ../../../../Resource/WeMall/WebElement/Campaign.txt
Resource          ../../../../Resource/WeMall/WebElement/Freebie.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Campaign.txt
Resource          ../../../../Keyword/Common/Freebie.txt
Resource          ../../../../Keyword/Common/LevelD.txt

*** Variable ***
${campaign_id}    6396
${product_id}    L91201422
${freebie_product_name1}    KAMUB
${storename}    kamu
${category1}    แม่และเด็ก

*** Test Cases ***
TC_MC_10250
    [Documentation]    Verify that user can search by product name with freebie promotion.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name
    Validate freebie promotion correctly displayed

TC_MC_10251
    [Documentation]    Verify that user can search by product category.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by category name
    Validate freebie promotion correctly displayed

TC_MC_10259
    [Documentation]   Verify that a product which has freebie promotion (differnce Merchant) is correclty displayed with freebie 's image on level C.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name which Differnce Merchant
    Validate freebie promotion correctly displayed

TC_MC_10252
    [Documentation]    Verify that user can search by product name without freebie promotion.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name with no freebie promotion
    Validate product no freebie promotion correctly displayed

TC_MC_10253
    [Documentation]    Verify that front-end is correctly displayed when the promotion status is expired.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name with expired freebie promotion
    Validate product no freebie promotion correctly displayed

TC_MC_10260
    [Documentation]    Verify that front-end is correctly displayed when the promotion status is disable.
    [Tags]    LevelC    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name with disabled freebie promotion
    Validate product no freebie promotion correctly displayed

TC_MC_10261
    [Documentation]    a product which has freebie promotion is correctly displayed with freebie 's image (freebie_img_desktop_s) on level D.
    [Tags]    LevelD    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name
    Validate freebie promotion correctly displayed
    Navigate to product detail page
    Validate freebie promotion correctly displayed on level D

TC_MC_10262
    [Documentation]    Verify that front-end is correctly displayed when user switch product (inventory_id) which has freebie and without freebie promotion.
    [Tags]    LevelD    Regression    High
    Campaign.Open Wemall Portal page on Desktop
    Search by product name with Buy A Get A on Level D
    Validate freebie promotion correctly displayed
    Navigate to product detail page
    Choose Size on Level D
    Choose Color on Level D
    Validate freebie promotion correctly displayed on level D

TC_MC_10663
    [Documentation]    [Web] Verify the Everyday Wow product's image with the freebie tag on Wemall home page when promotion status is available
    [Tags]    LevelC    Medium
    Open Wemall Portal page on Desktop
    Validate freebie promotion correctly displayed

TC_MC_10668
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Lvl C campaign page when promotion status is available
    [Tags]    LevelC    Regression    Medium
    Open Wemall Portal page on Desktop
    Navigate To Campaign Page    ${storename}    ${campaign_id}
    Validate freebie promotion correctly displayed

TC_MC_10706
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Lvl C Recommend page when promotion status is available
    [Tags]    LevelC    Regression
    Open Wemall Portal page on Desktop
    Go To Leveld Portal wemall    ${product_id}
    Navigate to Level C Recommend Page On Desktop
    Validate freebie promotion correctly displayed

TC_MC_11153
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Home page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Validate freebie promotion correctly displayed

TC_MC_11157
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Lvl C product list page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Navigate To Store Front Level C Product
    Validate freebie promotion correctly displayed

TC_MC_11161
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Highlight product page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Navigate To Store Front Level C Highlight Product
    Validate freebie promotion correctly displayed

TC_MC_11165
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Lvl C category page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Navigate To Store Level C Category Page    ${category1}
    Validate freebie promotion correctly displayed

TC_MC_11169
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Lvl C promotion page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Navigate To Store Front Level C Promotion
    Validate freebie promotion correctly displayed

TC_MC_11173
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Search result page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Search Product On Storefront    ${freebie_product_name1}
    Validate freebie promotion correctly displayed

TC_MC_11177
    [Documentation]    [Web] Verify the product's image with the freebie tag on Wemall Storefront Lvl B promotion page when promotion status is available
    [Tags]    LevelC    Regression
    Go To Store Front Page    ${storename}
    Navigate To Store Front Level B promotion
    Validate freebie promotion correctly displayed

