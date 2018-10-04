*** Settings ***
Test Teardown    Close All Browsers
Test Setup        Run Keywords    Open Browser    ${URL_PORTAL}/itruemartretail/sim/    ${BROWSER}    AND        Set Selenium Speed    .2
Force Tags        Wemall-Web    Truemoveh    mock
Library           SeleniumLibrary
Resource          ../../../../Resource/WeMall/init.robot
Resource          ../../../../Keyword/Common/Common.txt
Resource          ../../../../Keyword/Common/Member_SignIn.txt
Resource          ../../../../Keyword/Common/Truemoveh.txt
Resource          ../../../../Keyword/Common/TruemoveH_SearchSimNumber.robot
Resource          ../../../../Resource/WeMall/WebElement/Member_SignIn.txt
Resource          ../../../../Resource/WeMall/WebElement/Truemoveh.txt


*** Test Cases ***
TC_MC_10099
    [Documentation]    [Web] Verify the result after searching by identify digit on each position ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10100
    [Documentation]    [Web] Verify the result after searching any digits that are displayed in phone number ("เบอร์สวย" tab)   
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits In Sim Number    352
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10101
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    352
    Click Search Button
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10103
    [Documentation]    Web] Verify the result when identifying the sum of digits in the phone number ("เบอร์สวย" tab)   
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected

TC_MC_10105
    [Documentation]    [Web] Verify the result when identifying the digit at the position and sum of digits in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10106
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    26
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10107
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10109
    [Documentation]    [Web] Verify the result when identifying the digit that are displayed and aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits In Sim Number    480
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10110
    [Documentation]    [Web] Verify the result when identifying the on the fixed position and digit that are displayed/aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    40
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10112
    [Documentation]    Web] Verify the result when identifying the on the fixed position, the sum of digits and digit that are displayed/aren't displayed in the phone number ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    64
    Search Sim Number By Digits Not In Sim Number    3
    Select Horoscope    40 : ความสำเร็จ
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10115
    [Documentation]    [Web] Verify the error message when identifying the same digit on the fixed position field and field that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    4    4
    Search Sim Number By Digits Not In Sim Number    4
    The Warning Message Is Displayed Under Exclude Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10116
    [Documentation]    [Web] Verify the error message when identifying the same digit on fields that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Digits In Sim Number    4
    The Warning Message Is Displayed Under Include Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10117
    [Documentation]    [Web] Verify the error message when identifying the same digit on field that aren't displayed in the phone number and the fixed position fields ("เบอร์สวย" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Identify The Last Two Position    4    4
    The Warning Message Is Displayed Under Position Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10120
    [Documentation]    [Web] Verify the result after searching by identify digit on each position ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    4    4
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10121
    [Documentation]    [Web] Verify the result after searching any digits that are displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits In Sim Number    352
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly

TC_MC_10122
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    352
    Click Search Button
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10124
    [Documentation]    [Web] Verify the result after searching any digits that aren't displayed in phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Select Horoscope    63 : ความรัก
    Click Search Button
    The Horoscope Displays The Description As Expected

TC_MC_10125
    [Documentation]    [Web] Verify the result when identifying the digit at the position and sum of digits in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    8    8
    Select Horoscope    63 : ความรัก
    Click Search Button
    The Horoscope Displays The Description As Expected
    The Last Two Numbers Are Displayed In The Result Correctly

TC_MC_10126
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits Not In Sim Number    352
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10127
    [Documentation]    [Web] Verify the result when identifying the digit on the fixed position and digit that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10128
    [Documentation]    [Web] Verify the result when identifying the digit that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits In Sim Number    480
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10129
    [Documentation]    [Web] Verify the result when identifying the on the fixed position and digit that are displayed/aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    8    8
    Search Sim Number By Digits In Sim Number    480
    Search Sim Number By Digits Not In Sim Number    3
    Click Search Button
    The Last Two Numbers Are Displayed In The Result Correctly
    The Results Are Displayed With The Searched Digits Correctly
    The Results Are Displayed Without The Searched Digits Correctly

TC_MC_10130
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

TC_MC_10132
    [Documentation]    [Web] Verify the error message when identifying the same digit on the fixed position field and field that aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Identify The Last Two Position    4    4
    Search Sim Number By Digits Not In Sim Number    4
    The Warning Message Is Displayed Under Exclude Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10133
    [Documentation]    [Web] Verify the error message when identifying the same digit on fields that are displayed and aren't displayed in the phone number ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Digits In Sim Number    4
    The Warning Message Is Displayed Under Include Number Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10134
    [Documentation]    [Web] Verify the error message when identifying the same digit on field that aren't displayed in the phone number and the fixed position fields ("เบอร์มงคล" tab)
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Select Lucky Number Tab
    Search Sim Number By Digits Not In Sim Number    4
    Search Sim Number By Identify The Last Two Position    4    4
    The Warning Message Is Displayed Under Position Field    เลขที่คุณระบุ ไม่ตรงตามเงื่อนไข กรุณาระบุใหม่อีกครั้ง

TC_MC_10136
    [Documentation]    [Web] Verify the "ระบุข้อมูลเพื่อตรวจสอบสิทธิ์การซื้อเบอร์" popup after selecting the phone number and price plan 
    Go To Select Lucky Sim Number Page
    Select Lucky Sim Type    บุคคลธรรมดา
    Search Sim Number By Identify The Last Two Position    5    5
    Click Search Button
    Select The First Number
    Select The First Promotion
    Click Register Button
    Check The Validation Field

