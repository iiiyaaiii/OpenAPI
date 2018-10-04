*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../component/promotion_list.robot

*** Keywords ***
Go To Promotion List For Specific Campaign ID
    [Arguments]    ${camp_id}
    Go To    ${CAMP_ITM_URL}/campaigns/${camp_id}/promotions

Build Updated Promotion
    Click Build Promotion
    Promotion Build Popup Should Be Appeared
    Click Confirm on Promotion Build Popup

Promotion Should Be Successfully Built With Active Status
    Pending Promotion Should Be Updated