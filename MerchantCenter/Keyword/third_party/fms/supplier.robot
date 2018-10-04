*** Settings ***
Library      String

*** Variables ***
${FMS_BACKEND_SERVICE}    api-gw2.aden-dev.asia
${api_path}       ${EMPTY}



*** Keywords ***

Create FMS Supplier
	[Arguments]  ${bu_code}=BTH001   ${Type}=MF

	${header_dict}=   Create Dictionary   Content-type=application/json    x-api-key=BQhE0RAqtl28g1fju0XpSa5QyLxhCf3C19X1lqfM

	${response}=  call api  POST  ${FMS_BACKEND_SERVICE}  ${api_path}/supplier  {"bu_code":"${bu_code}","company_name":"Supplier Testing","tax_id":"123","branch_id":"00000","username":"-","supplier_code":"","vat_supplier":"N","wht_supplier":"N","preferred_day_for_po":0,"default_supplier_type":"${Type}","default_payment_terms":"1","delivery_days":"0111110","pickup_days":"0111111","sap_vendor_id":"123","bank_name":"KBANK","bank_account_number":"10000","account_holder":"KNABK","default_po_lead_time":0,"mov_normal_retail":0,"moq_normal_retail":0,"mov_consignment":0,"moq_consignment":0,"mov_marketplace":0,"moq_marketplace":0,"crossdock":"Y","option_to_return":"","office_address":{"name":"Business Address","province_id":"1","city_id":"169","district_id":"50","address_line1":"AIA","zip_code":"10400"},"username_login":"developer","supplier_type":"M","contacts":[{"name":"ALPHA F","phone_number1":"0998888890","email":"test@gmail.com"}],"warehouses":[{"name":"Alpha F","province_id":"26","city_id":"2753","district_id":"343","address_line1":"AIA","zip_code":"37210","contacts":[{"name":"ALPHA F","phone_number1":"0998888883","email":"test@gmail.com"}]}]}   ${header_dict}
#    Log To Console    response success=========${response}
	Should be equal  ${response.status}      200 OK
	Assert response node  ${response.body}  /status_message   Success
    log to console    ${response.body}
    ${supplier_code}=   Get Json Value   ${response.body}  /data/supplier_code
    ${supplier_code}=  Replace String   ${supplier_code}  "  ${EMPTY}

    [Return]  ${supplier_code}