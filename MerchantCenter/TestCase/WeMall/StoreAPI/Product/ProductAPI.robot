*** Settings ***
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Api_Product.robot

*** Test Case ***
TC_WLS_05310
    [Documentation]    Get all product list
    ${response}    Get Product List
    Should Be Equal As Strings    ${response.status_code}    200
    # ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50

TC_WLS_05311
    [Documentation]    Get product list of product status show
    ${response}    Get Product filter    /merchant/product?status=true
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${status}    Get Json Value    ${response.content}    /data/record/0/status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${status}    "true"

TC_WLS_05312
    [Documentation]    Get product list of product status hide
    ${response}    Get Product filter    /merchant/product?status=false
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${status}    Get Json Value    ${response.content}    /data/record/0/status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${status}    "false"

TC_WLS_05313
    [Documentation]    Get Product monitor failed
    ${response}    Get Product filter    /merchant/product?product?monitor_status=failed
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "failed"

TC_WLS_05314
    [Documentation]    Get Product monitor waiting
    ${response}    Get Product filter    /merchant/product?product?monitor_status=waiting
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "waiting"

TC_WLS_05315
    [Documentation]    Get Product monitor processing
    ${response}    Get Product filter    /merchant/product?product?monitor_status=processing
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "processing"

TC_WLS_05316
    [Documentation]    Get Product monitor approved
    ${response}    Get Product filter    /merchant/product?product?monitor_status=approved
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "approved"

TC_WLS_05317
    [Documentation]    Get Product monitor reject
    ${response}    Get Product filter    /merchant/product?product?monitor_status=reject
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "reject"

TC_WLS_05318
    [Documentation]    Get Product monitor pending
    ${response}    Get Product filter    /merchant/product?product?monitor_status=pending
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "pending"

TC_WLS_05319
    [Documentation]    Get Product monitor closed
    ${response}    Get Product filter    /merchant/product?product?monitor_status=closed
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${monitor_status}    Get Json Value    ${response.content}    /data/record/0/monitor_status
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    50
    Should Be Equal As Strings    ${monitor_status}    "closed"

TC_WLS_05320
    [Documentation]    Get product list by limit product per page not over 200
    ${response}    Get Product filter    /merchant/product?perpage=20
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${record}    Get Json Value    ${response.content}    /data/record
    Should Be Equal As Strings    ${current_page}    1
    Should Be Equal As Strings    ${limit}    20
    ${count_type}=   Count Values In List    ${record}    "id": 9
    ${count_type}=   Count Values In List    ${record}    type
    ${count_title}=   Count Values In List    ${record}    title
    ${count_body_html}=   Count Values In List    ${record}    body_html
    ${count_inventories}=   Count Values In List    ${record}    inventories
    ${count_monitor_status}=   Count Values In List    ${record}    monitor_status
    # ${count_images}=   Count Values In List    ${record}    images
    ${count_created_at}=   Count Values In List    ${record}    created_at
    ${count_updated_at}=   Count Values In List    ${record}    updated_at
    Should Be Equal As Strings    ${count_type}    20
    Should Be Equal As Strings    ${count_title}    20
    Should Be Equal As Strings    ${count_body_html}    20
    Should Be Equal As Strings    ${count_inventories}    20
    Should Be Equal As Strings    ${count_monitor_status}    20
    # Should Be Equal As Strings    ${count_images}    20
    Should Be Equal As Strings    ${count_created_at}    20
    Should Be Equal As Strings    ${count_updated_at}    20


TC_WLS_05321
    [Documentation]    Get product list by limit product per page over 200
    ${response}    Get Product filter    /merchant/product?perpage=500
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record/0
    Should Be Equal As Strings    ${limit}    200

TC_WLS_05322
    [Documentation]    Get product list by specified page
    ${response}    Get Product filter    /merchant/product?perpage=20&page=2
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record
    Should Be Equal As Strings    ${current_page}   2
    Should Be Equal As Strings    ${limit}    20

TC_WLS_05323
    [Documentation]    Get product list by specified create date after yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?created_at_min=2016-08-01
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record

TC_WLS_05324
    [Documentation]    Get product list by specified create date before yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?created_at_max=2016-08-01
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record


TC_WLS_05325
    [Documentation]    Get product list by specified create date between yyyy-mm-dd - yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?updated_at_min=2016-08-01&updated_at_max=2017-12-15
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record


TC_WLS_05326
    [Documentation]    Get product list by specified update date after yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?updated_at_min=2016-08-01
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record

TC_WLS_05327
    [Documentation]    Get product list by specified update date before yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?updated_at_max=2016-12-01
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit
    ${product_list}    Get Json Value    ${response.content}    /data/record

TC_WLS_05328
    [Documentation]    Get product list by specified update date between yyyy-mm-dd - yyyy-mm-dd
    ${response}    Get Product filter    /merchant/product?updated_at_min=2016-08-01&updated_at_max=2017-12-15
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_body}    To Json    ${response.content}
    ${current_page}    Get Json Value    ${response.content}    /data/pagination/current
    ${limit}    Get Json Value    ${response.content}    /data/pagination/limit

TC_WLS_05329
    [Documentation]    Get product list by using incorrect token
    ${response}    Get Incorrect Header
    Should Be Equal As Strings    ${response.status_code}    401
    ${code}    Get Json Value    ${response.content}    /data/code
    ${messages}    Get Json Value    ${response.content}    /data/messages
    ${description}    Get Json Value    ${response.content}    /data/description
    Should Be Equal As Strings    ${code}    401
    Should Be Equal As Strings    ${messages}    "Unauthorized"
    Should Be Equal As Strings    ${description}    "Authentication credentials were missing or incorrect."

TC_WLS_05330
    [Documentation]    Get product data by specified product ID
    ${response}    Get Product Info    ${PRODUCT_TESCO}
    Should Be Equal As Strings  ${response.status_code}  200
    ${product_id_tesco}    Get Json Value    ${response.content}    /data/record/id
    Should Be Equal As Strings    ${product_id_tesco}    90567662

TC_WLS_05335
    [Documentation]    Compare at price is 0
    ${response}    Update Product    [{"sku":"tescosku-1", "compare_at_price": 0, "price": 100}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05336
    [Documentation]    Compare at price is less than Selling price
    ${response}    Update Product    [{"sku":"tesco-sku001", "compare_at_price": 10.00, "price":50.00}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 1, "success": 0}]
    ${errors}    Get Json Value    ${response.content}    /data/errors
    Should Be Equal As Strings    ${errors}    [{"sku": "tesco-sku001", "remark": "Price value must be less than Compare at price"}]

TC_WLS_05337
    [Documentation]    Compare at price is 2 decimal
    ${response}    Update Product    [{"sku": "tescosku-5-1", "compare_at_price": 100.00, "price": 70.00}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05340
    [Documentation]    Don't send data of Selling price
    ${response}    Update Product    [{"sku":"tescosku-9", "compare_at_price":1000.00}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05344
    [Documentation]    Selling price is 2 decimal
    ${response}    Update Product    [{"sku":"tescosku-15", "compare_at_price":100.00 ,"price": 50.00}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05349
    [Documentation]    Stock is less than hold stock
    ${response}    Update Product    [{"sku":"tescosku-1", "compare_at_price": 0, "price": 100}]    ${open_api_method_price}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    ${errors}    Get Json Value    ${response.content}    /data/errors
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05350
    [Documentation]    Stock is more than hold stock
    ${response}    Update Product    [{"sku":"tescosku-2", "quantity":100}]    ${open_api_method_stock}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05351
    [Documentation]    Stock is equal to hold stock
    ${response}    Update Product    [{"sku":"tescosku-5-2", "quantity":20}]    ${open_api_method_stock}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]

TC_WLS_05353
    [Documentation]    Stock is 0
    ${response}    Update Product    [{"sku":"tescosku-5-3", "quantity":0}]    ${open_api_method_stock}
    Should Be Equal As Strings  ${response.status_code}  200
    ${count}    Get Json Value    ${response.content}    /data/count
    Should Be Equal As Strings    ${count}    [{"fail": 0, "success": 1}]