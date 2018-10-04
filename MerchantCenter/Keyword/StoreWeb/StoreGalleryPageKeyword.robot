*** Settings ***
Library     ../PythonLibrary/_customkeyword.py
Resource    ../../Resource/Common/globalInit.robot
Resource    ${CURDIR}../../../Resource/${BU}/Locators/StoreWeb/StoreGalleryPageLocator.robot


*** Variable ***
${timeout}    10s

*** Keywords ***
Go to Store Gallery Menu
    [Arguments]    ${store_name}
    Go to    ${URL_STORE}/${store_name}/admin/gallery

Select Store Gallery By Gallery Name
    [Arguments]    ${gallery_name}
    ${gallery_locator}    Replace String    ${link_gallery_album_name}    v_album_name    ${gallery_name}
    Wait Until Element Is Visible    ${gallery_locator}    ${timeout}
    Click Element    ${gallery_locator}
    Wait Until Element Is Visible    ${lbl_gallery_name_header}    ${timeout}

Upload Image To Store Gallery
    [Arguments]    ${image_name}    ${site}
    ${full_path}    Catenate    SEPARATOR=/    MerchantCenter/Resource/${site}/TestData/StoreWeb/StoreAdmin    ${image_name}
    ${path}    Get Canonical Path    ${full_path}
    Choose File    ${input_upload_img}    ${path}
    ${img_no_extension}    Split String    ${image_name}    .
    ${lbl_img_name_locator}    Replace String    ${lbl_img_name}    v_img_name    ${img_no_extension[0]}
    Wait Until Element Is Visible    ${lbl_img_name_locator}    ${timeout}

Click Edit Album
    Click Element    ${btn_edit_album}

Select Image In Album By Hash
    [Arguments]    ${img_hash}
    ${chk_select_img_locator}    Replace String    ${chk_select_img}    v_img_hash    ${img_hash}
    Wait Until Element Is Visible    ${chk_select_img_locator}    ${timeout}
    Click Element    ${chk_select_img_locator}

Click Button Delete Image
    Wait Until Element Is Visible    ${btn_del_img_in_album}    ${timeout}
    Click Element    ${btn_del_img_in_album}

Confirm Delete Image
    Wait Until Element Is Visible    ${btn_confirm_delete}    ${timeout}
    Click Element    ${btn_confirm_delete}
