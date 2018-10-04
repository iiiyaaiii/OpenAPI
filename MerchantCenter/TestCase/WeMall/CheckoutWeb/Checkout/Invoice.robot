*** Settings ***
Test Setup       Open Custom Browser    ${URL_PORTAL}    ${BROWSER}
Test Teardown    Close All Browsers
Library           String
Library           SeleniumLibrary    15    5    run_on_failure=Capture Page Screenshot
Force Tags        Checkout-Web
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/WebElement/Checkout.txt
Resource          ../../../../Resource/WeMall/WebElement/Cart.txt
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeLoveShopping/Configuration/Staging/robotdata.txt
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Checkout.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt

*** Variables ***
${corporate_value}    นิติบุคคล
${individual_value}    บุคคลธรรมดา

*** Test Cases ***
TC_MC_10528
    [Documentation]    Verify invoice field popup on Checkout page
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Check Fields For Tax Invoice

TC_MC_10532
    [Documentation]    Verify individual's address information on Checkout page after adding the billing's address
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Select Tax Invoice For    ${individual_value}
    Add The Billing Address For Individual    First_name    Sur_name    6785577115208
    Verify That The Individual Billing Address Displays Correctly

TC_MC_10533
    [Documentation]    Verify corporate's address information on Checkout page after adding the billing's address (Head Office)
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Select Tax Invoice For    ${corporate_value}
    Add The Billing Address For Corporate Head Office    1111111111111
    Verify That The Corporate Billing Address Displays Correctly    ${corporate}

TC_MC_10534
    [Documentation]    Verify corporate's address information on Checkout page after adding the billing's address (Branch)
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Select Tax Invoice For    ${corporate_value}
    Add The Billing Address For Corporate Branch    00001    1111111111111
    Verify That The Corporate Billing Address Displays Correctly    ${branch}

TC_MC_10538
    [Documentation]    Verify warning message for "นิติบุคคล" when submitting without enter the required fields
    [Tags]    Regression    Medium    mock
    Set Selenium Speed    0.2
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Select Tax Invoice For    ${corporate_value}
    Click To Submit The Request
    Check Warning Message For Corporate

TC_MC_10539
    [Documentation]    Verify warning message for "บุคคลธรรมดา" when submitting without enter the required fields
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Select First Address
    Request Tax Invoice
    Select Tax Invoice For    ${individual_value}
    Click To Submit The Request
    Check Warning Message For Individual

TC_MC_10593
    [Documentation]    Verify address information on Thank you page after adding the billing's address same as corporate's address (Head Office)
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Request Tax Invoice
    Select Tax Invoice For    ${individual_value}
    Add The Billing Address For Individual    Firstname    Surname    6785577115208
    Perform payment by Credit Card
    Check The Address On Thankyou Page Displays Correctly

TC_MC_10595
    [Documentation]    Verify address information on Thank you page after adding the billing's address same as corporate's address (Head Office)
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Request Tax Invoice
    Select Tax Invoice For    ${corporate_value}
    Add The Billing Address For Corporate Head Office    1111111111111
    Perform payment by Credit Card
    Check The Address On Thankyou Page Displays Correctly    ${corporate}

TC_MC_10597
    [Documentation]    Verify address information on Thank you page after adding the billing's address same as corporate's address (Branch)
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Request Tax Invoice
    Select Tax Invoice For    ${corporate_value}
    Add The Billing Address For Corporate Branch    00001    1111111111111
    Perform payment by Credit Card
    Check The Address On Thankyou Page Displays Correctly    ${branch}

TC_MC_10599
    [Documentation]    Verify address information on Thank you page without adding the billing's address
    [Tags]    Regression    Medium    mock
    Check User Login
    Delete All Product In Cart
    Add Product To Cart by product name on Store    ${URL_PORTAL}/${store_name}    Seller Promotion Baht
    Place Order    ${select_address}    ${shipping_post}    ${ccw_channel_radio_button}
    Perform payment by Credit Card
    Check The Address On Thankyou Page Displays Correctly
