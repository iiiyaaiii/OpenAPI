*** Settings ***
Resource    ../../Resource/Common/globalInit.robot
Resource    ../WemallWeb/LevelDPageKeyword.robot

*** Keywords ***
Add Product To Cart And Confirm To Cart Page
    Click Add Product To Cart on LevelD Page
    Click To Confirm Add To Cart And Go to Cart Page on LevelD Page

Select Product By Product_Id
    [Documentation]    Use Select Product By Product_Id For Place Order
    [Arguments]    ${product_id}
    ${length}    Get Length    ${product_id}
    :FOR    ${var}    IN RANGE    0    ${length}
    \    Go To    ${URL_LEVEL_D}/${product_id[${var}]}
    \    Click Add Product To Cart on LevelD Page
    \    ${last_product}    Evaluate    ${length} - 1
    \    Run Keyword If    ${var} == ${last_product}    Click To Confirm Add To Cart And Go to Cart Page on LevelD Page
    \    ...    ELSE    Click To Continue Shopping
