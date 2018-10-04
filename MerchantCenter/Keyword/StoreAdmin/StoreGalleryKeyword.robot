*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ${CURDIR}../../StoreWeb/StoreGalleryPageKeyword.robot


*** Variable ***
${timeout}    30s

*** Keywords ***
Upload Load Image To Specific Gallery
    [Arguments]    ${gallery_name}    ${image_name}    ${site}
    Select Store Gallery By Gallery Name    ${gallery_name}
    Upload Image To Store Gallery    ${image_name}    ${site}

Get Upload Image URL
    [Arguments]    ${image_name}
    ${img_no_extension}    Split String    ${image_name}    .
    ${link_img_name_locator}    Replace String    ${link_img_name}    v_img_name    ${img_no_extension[0]}
    ${image_url}    Get Element Attribute    ${link_img_name_locator}    data-image
    [Return]    ${image_url}

Selected Image Then Delete From Album By Image Hash
    [Arguments]    @{hash_list}
    :FOR   ${data}    IN    @{hash_list}
    \    Select Image In Album By Hash    ${data}
    Click Button Delete Image
    Confirm Delete Image
