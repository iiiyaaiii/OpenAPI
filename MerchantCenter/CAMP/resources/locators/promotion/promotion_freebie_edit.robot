*** Variables ***
&{edit_freebie}    txt_promotion_name=nameLocal
...    txt_promotion_name_translate=nameEN
...    txt_promotion_short=shortDescriptionLocal
...    txt_promotion_short_translate=shortDescriptionEN
...    content_promotion_desc=descriptionLocal
...    content_promotion_desc_translate=descriptionEN
...    txt_promotion_period=period
...    calendar_promotion_start=daterangepicker_start
...    calendar_promotion_stop=daterangepicker_end
...    btn_promotion_period_apply=//button[@class='applyBtn btn btn-sm btn-success']
...    chk_promotion_status=enabled
...    chk_member=memberSpan
...    chk_non_member=nonMemberSpan
...    ddl_criteria_type=criteriaTypeSelect
...    txt_criteria_value=xpath=//*[@id="criteriaValuesDiv"]/div/input
...    txt_quantity_item=minTotalQuantity
# ...    rdo_quantity_baht=minTotalValueSpan    ##THIS FIELD IS CURRENTLY UNUSED
# ...    txt_quantity_baht=minTotalValue    ##THIS FIELD IS CURRENTLY UNUSED
# ...    rdo_free_type_or=//input[(@name="freeVariantsType") and (@value="or")]    ##THIS FIELD WAS DISABLED BY DEFAULT
# ...    rdo_free_type_and=//input[(@name="freeVariantsType") and (@value="and")]    ##THIS FIELD WAS DISABLED BY DEFAULT
...    txt_free_variant_id=freeVariant1
...    txt_free_variant_quantity=freeVariantQuantity1
...    txt_repeat_number=repeat
...    txt_note=freebieNote
...    txt_note_translate=freebieNoteTranslation
...    upload_c_desktop=lvCDropzoneInput
...    upload_c_desktop_translate=lvCTransDropzoneInput
...    upload_c_mobile=lvCMobileDropzoneInput
...    upload_c_mobile_translate=lvCMobileTransDropzoneInput
...    upload_d_desktop=lvDDropzoneInput
...    upload_d_desktop_translate=lvDTransDropzoneInput
...    upload_d_mobile=lvDMobileDropzoneInput
...    upload_d_mobile_translate=lvDMobileTransDropzoneInput
...    btn_cancel=cancelBtn
...    btn_update=submitBtn