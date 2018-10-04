*** Settings ***
Library          SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Library          ${CURDIR}../../../../Keyword/PythonLibrary/_customkeyword.py
Library           OperatingSystem
Resource          ${CURDIR}../../../../Resource/WeMall/init.robot
Resource          ${CURDIR}../../../../Keyword/Common/Common.txt
Resource          ${CURDIR}../../../../Keyword/StoreAdmin/StoreGalleryKeyword.robot
Resource          ${CURDIR}../../../../Keyword/ResizeWeb/ResizeKeyword.robot
Suite Setup          Run Keywords    Open Custom Browser    ${URL_PORTAL}    ${BROWSER}    AND    Upload Image
# Suite Setup          Upload Image
Suite Teardown          Run Keywords    Remove Image    AND    Close All Browsers
*** Variables ***
${galleryname}    Resize
${img_name}    resize-img.jpg
# ${site}    WeMall

*** Test Cases ***
TC_MC_12818
    [Documentation]    [Wemall] Resize product image for use in levelC search
    [Tags]    Regression    High    Resize-Web
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_228,h_228,c_thumb    w_228,h_228,c_crop    ${resize_img_hash}    ${resize_img_hash}.jpg
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

TC_MC_12819
    [Documentation]    [Wemall] Resize product image for use in levelD
    [Tags]    Regression    High    Resize-Web    SmokeTest
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_450,h_450,c_thumb    ${resize_img_hash}    ${img_name}
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

TC_MC_12820
    [Documentation]    [Wemall] Resize product image for use in levelD zoom mode
    [Tags]    Regression    Low    Resize-Web
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_1400,h_1400,c_thumb    ${resize_img_hash}    ${img_name}
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

TC_MC_12821
    [Documentation]    [Wemall] Resize product image for use in StoreFront
    [Tags]    Regression    Medium    Resize-Web    SmokeTest
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_228,c_thumb    ${resize_img_hash}    ${resize_img_hash}.jpg
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

TC_MC_12822
    [Documentation]    [Wemall] Resize product image for use in levelC search mobile
    [Tags]    Regression    High    Resize-Web    SmokeTest
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_400,h_400,c_crop    w_400,h_400,c_thumb    ${resize_img_hash}    ${resize_img_hash}.jpg
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

TC_MC_12823
    [Documentation]    [Wemall] Resize product image for use in levelD mobile
    [Tags]    Regression    High    Resize-Web
    ${resize_param}    Catenate    SEPARATOR=/    /${resize_store_id}    w_348,h_348,c_crop    ${resize_img_hash}    ${img_name}
    ${img_extension}    Verify Resize    ${REQ_RESIZE}    ${resize_param}
    Log To Console    ${\n}TestData : ${resize_param} | Image Extension : ${img_extension}
    Should Be True    '${img_extension}' != 'None'

*** Keywords ***
Upload Image
    Go to Login    ${store_email2}    ${store_password2}
    Go to Store Gallery Menu    ${store_name2}
    Upload Load Image To Specific Gallery    ${galleryname}    ${img_name}    ${BU}
    ${img_url}    Get Upload Image URL    ${img_name}
    ${store_id}    ${img_hash}    Exact URL For Resize    ${img_url}
    Set Suite Variable    ${resize_store_id}    ${store_id}
    Set Suite Variable    ${resize_img_hash}    ${img_hash}

Remove Image
    Click Edit Album
    Selected Image Then Delete From Album By Image Hash    ${resize_img_hash}

#Portal > Search /w_228,h_228,c_thumb/w_228,h_228,c_crop/909c257fc4eb604275e2ecf824fc750f/909c257fc4eb604275e2ecf824fc750f.jpg
#Portal > leveld /w_450,h_450,c_thumb/909c257fc4eb604275e2ecf824fc750f/logo_mi6_seller_1.jpg
#Portal > leveld zoom /w_1400,h_1400,c_thumb/909c257fc4eb604275e2ecf824fc750f/logo_mi6_seller_1.jpg
#Store Front > /w_228,c_thumb/53dce2b98dd94d5b52a9c639afa5b2d3/53dce2b98dd94d5b52a9c639afa5b2d3.jpg
#Mobile Search > /w_400,h_400,c_crop/w_400,h_400,c_thumb/19ebf0ff5714a5cd017bac0222d864ac/19ebf0ff5714a5cd017bac0222d864ac.jpg
#Mobile leveld > /w_348,h_348,c_crop/19ebf0ff5714a5cd017bac0222d864ac/robot_product1_1.jpg
