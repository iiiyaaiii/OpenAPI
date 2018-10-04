*** Settings ***
Suite Setup       Account Login    ${seller_user_001}    ${seller_pwd_001}
Suite Teardown    Close All Browsers
Test Setup        Go To    ${URL_STORE}/${user_s001}/admin/theme/setting
Force Tags        Store-Web    mc-wls
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resource/WeLoveShopping/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Store_Theme.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/WebElement/SellerTheme.txt
Resource          ../../../../Keyword/Common/Gallery.txt

*** Test Cases ***
TC_MC_08663
    [Documentation]    Verify theme color. Default theme.
    Run Keyword If    '${select_theme}' == 'red'    Select red theme2
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    red
    Run Keyword If    '${Color_old}' != 'red'    Confirm Action
    Element Should Be Visible    ${ex_red_theme}
    Click Element    ${save_theme}
    Sleep    3s
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    grey
    Run Keyword If    '${Color_old}' != 'grey'    Confirm Action
    Element Should Be Visible    ${ex_grey_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    Verify theme color    grey

TC_MC_08665
    [Documentation]    Verify theme color. Incase choose Pink theme.
    [Tags]    Regression    SmokeTest    High
    ## Prepare Default Theme
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    pink
    Run Keyword If    '${Color_old}' != 'pink'    Confirm Action
    Element Should Be Visible    ${ex_pink_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    Verify theme color    pink

TC_MC_08666
    [Documentation]    Verify theme color. Incase choose Blue theme.
    ## Prepare Default Theme
    [Tags]    Icz
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    blue
    Run Keyword If    '${Color_old}' != 'blue'    Confirm Action
    Element Should Be Visible    ${ex_blue_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    #Verify theme color    blue
    Verify theme color    pink

TC_MC_08668
    [Documentation]    Verify theme color. Incase choose Green theme.
    [Tags]    Regression    Medium
    ## Prepare Default Theme
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    green
    Run Keyword If    '${Color_old}' != 'green'    Confirm Action
    Element Should Be Visible    ${ex_green_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    Verify theme color    green

TC_MC_08669
    [Documentation]    Verify theme color. Incase choose Orange theme.
    ## Prepare Default Theme
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    orange
    Run Keyword If    '${Color_old}' != 'orange'    Confirm Action
    Element Should Be Visible    ${ex_orange_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    Verify theme color    orange

TC_MC_08670
    [Documentation]    Verify theme color. Incase choose Puple theme.
    [Tags]    Low
    ## Prepare Default Theme
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    violet
    Run Keyword If    '${Color_old}' != 'violet'    Confirm Action
    Element Should Be Visible    ${ex_violet_theme}
    Execute Javascript    $('.btn btn-primary btn-small').click();
    Verify theme color    violet

TC_MC_08671
    [Documentation]    Verify Change theme color. Incase choose Puple theme.
    #Prepare Default Theme
    Set Selenium Speed    .1
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    violet
    Run Keyword If    '${Color_old}' != 'violet'    Confirm Action
    Element Should Be Visible    ${ex_violet_theme}
    ${Color_Old}    Get Element Attribute    //select[@id="sel_theme"]//option[@selected=""]@value
    Select From List By Value    ${select_theme}    pink
    Run Keyword If    '${Color_old}' != 'pink'    Confirm Action

TC_MC_08672
    [Documentation]    Verify header shop. Incase upload image correct.
    Upload Image To Gallery    ${upload_header}    header.jpg    ${file_header}
    Element Should Not Be Visible    ${before_browse_header}

TC_MC_08673
    [Documentation]    Verify header shop. Incase upload image incorrect
    Upload Image To Gallery    ${upload_header}    TextUpload.txt    ${file_header}
    Confirm Action
    Element Should Be Visible    ${before_browse_header}

TC_MC_08674
    [Documentation]    Verify header shop. Incase choose image from gallery
    [Tags]    Regression    Medium
    Execute Javascript    ${btn_choose}.eq(0).click()
    Choose Image From Gallery Correct2

TC_MC_08676
    [Documentation]    Verify Banner shop. Incase upload image correct.
    Upload Image To Gallery    ${upload_banner}    banner.jpg    ${file_banner}
    Element Should Not Be Visible    ${before_browse_banner}

TC_MC_08677
    [Documentation]    Verify Banner shop. Incase upload image incorrect.
    Upload Image To Gallery    ${upload_banner}    TextUpload.txt    ${file_banner}
    Confirm Action
    Element Should Be Visible    ${before_browse_banner}

TC_MC_08678
    [Documentation]    Verify Banner shop. Incase choose image from gallery.
    [Tags]    Regression    Medium
    Execute Javascript    ${btn_choose}.eq(1).click()
    Choose Image From Gallery Correct2

TC_MC_08689
    [Documentation]    Banner shop : Select use banner, but doesn't select banner.
    [Tags]    Regression    Low    mock
    Clear All Banner
    Execute Javascript    $('#use_group_banner').click()
    Execute javascript    $("input[name='use_banner_option']")[0].click()
    Execute javascript    $('.btn-primary')[0].click()
    Element Should Contain    //*[@id="frmsetting"]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[4]/div[1]/div[3]    กรุณาเพิ่มแบนเนอร์พิเศษ
    Execute javascript    $("input[name='use_banner_option']")[1].click()
    Execute javascript    $('.btn-primary')[1].click()
    Element Should Contain    //*[@id="frmsetting"]/div/div[1]/div[2]/div/div/div[2]/div[2]/div[5]/div[2]/div/div[4]    กรุณาเพิ่มแบนเนอร์ปกติ

TC_MC_08692
    [Documentation]    Store user Normal Banner
    [Tags]    Regression    Medium    mock
    Clear All Banner
    Wait Until Element Is Not Visible    ${tab_notify_message}
    Click Element    id=use_group_banner
    Execute Javascript    $("input[name='use_banner_option']").eq(1).click()
    Sleep    5s
    Click Element    //*[@class="widget-gallery btn btn-choose"]
    Wait Until Element Is Enabled    xpath=//div/div[2]/div/div[2]/div/div/div/div[1]/ul/li/a/img
    Execute Javascript    $('.widget-main-container').last().find('li img').eq(0).click();
    Sleep    2s
    Execute Javascript    $('.save_photo').last()[0].click();
    Sleep    2s
    Execute Javascript    $(".btn-primary").click()
    Go To    ${URL_STORE}/${user_s001}
    Reload Page
    Element Should Be Visible    //*[@class="main-banner"]
    Page Should Not Contain Element    xpath=//html/body/div[5]/div/div/div[1]
    Go to    ${URL_STORE}/${user_s001}/admin/theme/setting
    Click Element    id=use_group_banner
    Click Element    id=trash_banner
    Click Element    //button[@class="btn btn-primary"]

TC_MC_08693
    [Documentation]    Store user Special Banner
    [Tags]    Regression    Medium    mock
    Clear All Banner
    Execute Javascript    $('#use_group_banner').click()
    Execute Javascript    $("input[name='use_banner_option']").eq(0).click()
    Sleep    0.3s
    # Click Element    //li[@class="wlsgallery"]
    Execute Javascript    $('.re-icon.re-wlsgallery.redactor-btn-image').click()
    Sleep    3
    Execute Javascript    $('.widget-main-container').last().find('li img').eq(4).click();
    Sleep    2s
    Execute Javascript    $('.save_photo').last()[0].click();
    Sleep    2s
    Click Element    ${save_theme}
    Go to    ${URL_STORE}/${user_s001}
    Element Should Be Visible    //div[@class='sp-banner-box']
    Go to    ${URL_STORE}/${user_s001}/admin/theme/setting
    Click Element    id=use_group_banner
    Execute Javascript    $('.re-icon.re-html').click()
    Sleep    0.3s
    Execute Javascript    $('#banner_html').text('')
    Execute Javascript    $('#banner_html').val('')
    Sleep    0.3s
    Execute Javascript    $('.re-icon.re-html').click()
    Sleep    0.3s
    Click Element    //button[@class="btn btn-primary"]

*** Keyword ***
Clear All Banner
    Go to    ${URL_STORE}/${user_s001}/admin/theme/setting
    # Wait Until Element Is Visible    //input[@id='use_group_banner']      60s
    # Execute Javascript    $('#use_group_banner').click()
    ${checkbanner}    Execute Javascript    return $('#use_group_banner_val').val()
    Run Keyword If    '${checkbanner}' == 'true'    Execute Javascript    $('#use_group_banner').click()
    ${use_normal_banner}    Run Keyword AND Return Status    Element Should Be Visible    //a[@id='trash_banner']
    Run Keyword If    '${use_normal_banner}' == 'True'   Execute Javascript    $('#trash_banner').click()
    Sleep    0.5s
    Click Element    //button[@class="btn btn-primary"]
    # # Wait Until Element Is Visible    //input[@id='use_group_banner']      60s
    # Execute Javascript    $('#use_group_banner').click()
    Wait Until Element Is Visible    //ul[@id='redactor-toolbar-0']    60s
    Execute Javascript    $('#redactor-toolbar-0 > li').eq(2).find('a').click()
    Sleep    2s
    Execute Javascript    $('#banner_html').val('')
    Execute Javascript    $('#banner_html').text('')
    Sleep    1s
    Execute Javascript    $('#redactor-toolbar-0 > li').eq(2).find('a').click()
    Sleep    1s
    Click Element    //button[@class="btn btn-primary"]