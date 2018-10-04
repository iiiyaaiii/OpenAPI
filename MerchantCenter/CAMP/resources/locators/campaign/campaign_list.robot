*** Variables ***
&{campaign_list}    txt_campaign_id=campaignId
...    txt_campaign_name=campaignName
...    txt_campaign_period=period
...    calendar_campaign_start=daterangepicker_start
...    calendar_campaign_stop=daterangepicker_end
...    btn_calendar_apply=//button[@class='applyBtn btn btn-sm btn-success']
...    chk_enable_and_live=liveFilterSpan
...    chk_enable_and_not_live=enabledFilterSpan
...    chk_disabled=disabledFilterSpan
...    chk_expired=expiredFilterSpan
...    btn_clear=clearBtn
...    btn_search=filterBtn
...    btn_enable=enableBtn
...    btn_disable=disableBtn
...    rdo_pagination=paginationSelect

&{delete_popup}    modal_delete=//div[@class="modal-content"]
...    btn_cancel=modalCancelBtn
...    btn_confirm=modalConfirmBtn