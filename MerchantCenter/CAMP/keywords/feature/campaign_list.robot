*** Settings ***
Resource    ${CURDIR}/../../resources/init.robot
Resource    ${CURDIR}/../component/campaign_list.robot

*** Keywords ***
Go To Campaign List Page
    campaign_list.Open Campaign List Page
    campaign_list.Campaign List Page Should Be Appeared

Search Campaign By Campaign ID
    [Arguments]    ${camp_id}
    campaign_list.Enter Campaign ID    ${camp_id}
    campaign_list.Click Search Button
    campaign_list.Searched Campaign ID Should Be Found    ${camp_id}

Search Campaign By Campaign Name
    [Arguments]    ${camp_name}
    campaign_list.Enter Campaign Name    ${camp_name}
    campaign_list.Click Search Button
    campaign_list.Searched Campaign Name Should Be Found    ${camp_name}

Delete Campaign By Campaign ID
    [Arguments]    ${camp_id}
    campaign_list.Enter Campaign ID    ${camp_id}
    campaign_list.Click Search Button
    campaign_list.Searched Campaign ID Should Be Found    ${camp_id}
    campaign_list.Delete Latest Campaign
    campaign_list.Delete Popup Should Be Appeared
    campaign_list.Click Confirm on Delete Popup
    campaign_list.Campaign Should Not Be Appeared    ${camp_id}

Delete Campaign By Campaign Name
    [Arguments]    ${camp_name}
    campaign_list.Enter Campaign Name    ${camp_name}
    campaign_list.Click Search Button
    campaign_list.Searched Campaign Name Should Be Found    ${camp_name}
    campaign_list.Delete Latest Campaign
    campaign_list.Delete Popup Should Be Appeared
    campaign_list.Click Confirm on Delete Popup
    campaign_list.Campaign Should Not Be Appeared    ${camp_name}

Get Specific Campaign ID
    [Arguments]    ${camp_name}
    campaign_list.Search Campaign By Campaign Name    ${camp_name}
    campaign_list.Get Latest Campaign ID

Select Campaign Filter
    [Arguments]    ${camp_filter}
    campaign_list.Select Search Filter    ${camp_filter}
    campaign_list.Click Search Button