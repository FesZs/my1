*** Settings ***
Documentation   My Test-Case
Library         Selenium2Library
Suite Setup     Open browser and test url
Suite Teardown  Close All Browsers
*** Variables ***
${TESTURL}      https://hotline.ua/
${BROWSER}      Chrome
${SESPEED}      0
${COMP1}        iPhone 7
${COMP2}        Xiaomi Note



*** Test Cases ***
test1 - Add to compare element 1
    Search element      ${COMP1}
    Check element       ${COMP1}
    Click first result
    Add to compare

test2 - Add to compare element 2
    Search element      ${COMP2}
    Check element       ${COMP2}
    Click first result
    Add to compare

test3 - Compare elements
    Compare elements


*** Keywords ***
Open browser and test url
    Open Browser    ${TESTURL}    ${BROWSER}
    set selenium speed      ${SESPEED}

Search element
    [Arguments]     ${searchkey}
    input text      id=searchbox    ${searchkey}
    click button    id=doSearch

Check element
    [Arguments]     ${expected_result}
    wait until page contains       ${expected_result}

Click first result
    wait until element is visible       css:p.h4
    click element                       css:p.h4

Add to compare
    wait until element is visible       css:a.item-compare
    click element                       css:a.item-compare
    go back

Compare elements
    click element       css:div.item-compare
    wait until element is visible       css:li
    click element                       css:li

