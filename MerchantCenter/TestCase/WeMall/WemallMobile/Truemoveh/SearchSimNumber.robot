*** Settings ***
Test Teardown     Close All Browsers
Test Setup        Run Keywords    Open Custom Browser    ${URL_MOBILE}/itruemart/sim/    Mobile    AND    Set Selenium Speed    .2
Force Tags        Wemall-Mobile    Truemoveh    mock
Library           SeleniumLibrary
Resource          ../../../../Resource/WeMall/Configuration/Staging/serverconfig.txt
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Resource/WeMall/MobileElement/Homepage.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Mobile_Home.robot
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt
Resource          ../../../../Keyword/Common/TruemoveH_SearchSimNumber.robot



*** Test Cases ***
TC_MC_10310
    [Documentation]    [Web] Verify the result after searching by identify digit on each position ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10311
    [Documentation]    [Web] Verify the result after searching any digits that are displayed in phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits In Sim Number    352
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10312
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    352
    Click Search Button
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10314
    [Documentation]    Web] Verify the result when identifying the sum of digits in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected

TC_MC_10316
    [Documentation]    [Web] Verify the result when identifying the digit at the position and sum of digits in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10317
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    262
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10318
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10320
    [Documentation]    [Web] Verify the result when identifying the digit that are displayed and aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits In Sim Number    480
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10321
    [Documentation]    [Web] Verify the result when identifying the on the fixed position and digit that are displayed/aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    2
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10323
    [Documentation]    Web] Verify the result when identifying the on the fixed position, the sum of digits and digit that are displayed/aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    7    1
    Search Sim Number By Digits In Sim Number    10
    Search Sim Number By Digits Not In Sim Number    3
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10326
    [Documentation]    [Web] Verify the error message when identifying the same digit on the fixed position field and field that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    4    4
    Search Sim Number By Digits Not In Sim Number    4
    The Warning Message Is Displayed Under Exclude Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10327
    [Documentation]    [Web] Verify the error message when identifying the same digit on fields that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Digits In Sim Number    4
    The Warning Message Is Displayed Under Include Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10328
    [Documentation]    [Web] Verify the error message when identifying the same digit on field that aren't displayed in the phone number and the fixed position fields ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Identify The Last Two Position    4    4
    The Warning Message Is Displayed Under Position Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10331
    [Documentation]    [Web] Verify the result after searching by identify digit on each position ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10332
    [Documentation]    [Web] Verify the result after searching any digits that are displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits In Sim Number    352
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10333
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    352
    Click Search Button
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10335
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Select Horoscope    63 : ความรัก
    Click Search Button
    The Horoscope Displays The Description As Expected

TC_MC_10336
    [Documentation]    [Web] Verify the result when identifying the digit at the position and sum of digits in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Select Horoscope    63 : ความรัก
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10337
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Search Sim Number By Digits In Sim Number    25
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10338
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10339
    [Documentation]    [Web] Verify the result when identifying the digit that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits In Sim Number    480
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10340
    [Documentation]    [Web] Verify the result when identifying the on the fixed position and digit that are displayed/aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Search Sim Number By Digits In Sim Number    80
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10341
    [Documentation]    [[Web] Verify the result when identifying the on the fixed position, the sum of digits and digit that are displayed/aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    1    8
    Search Sim Number By Digits In Sim Number    9
    Search Sim Number By Digits Not In Sim Number    3
    Select Horoscope    63 : ความรัก
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10343
    [Documentation]    [Web] Verify the error message when identifying the same digit on the fixed position field and field that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    4    4
    Search Sim Number By Digits Not In Sim Number    4
    The Warning Message Is Displayed Under Exclude Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10344
    [Documentation]    [Web] Verify the error message when identifying the same digit on fields that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Digits In Sim Number    4
    The Warning Message Is Displayed Under Include Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10345
    [Documentation]    [Web] Verify the error message when identifying the same digit on field that aren't displayed in the phone number and the fixed position fields ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Identify The Last Two Position    4    4
    The Warning Message Is Displayed Under Position Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

