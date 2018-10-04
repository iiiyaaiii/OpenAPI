*** Settings ***
Resource    ../../Resource/Common/globalInit.robot


*** Variables ***
${timeout}    10s


*** Keywords ***
Go to Now Wow Page
    Go To    ${URL_PORTAL}/everyday-wow

Go to Next Wow Page
    Go To    ${URL_PORTAL}/everyday-wow?nextwow=1
