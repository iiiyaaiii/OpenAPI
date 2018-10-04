*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../../resources/locators/common/login.robot
Resource    ${CURDIR}/../component/login.robot

*** Keywords ***
Access To CAMP With iTruemart Merchant
    Open CAMPS Browser
    Enter Username    ${CAMP_USERNAME}
    Enter Password    ${CAMP_PASSWORD}
    Click Login Button
    CAMP Landing Page Should Be Appeared
    Select Promotion Menu
    Select iTruemart Merchant
    iTruemart Promotion Menu Should Be Appeared