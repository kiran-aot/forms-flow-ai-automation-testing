*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Search_value}     Automation_Duplicate_test-copy
${Delete_alert}     Delete Confirmation

*** Keywords ***

Delete a form

    input text                          xpath://input[@placeholder='Search by form title']       ${Search_value}
    Press Keys                          //input[@placeholder='Search by form title']    ENTER
    sleep                               4s
    click element                       xpath://i[@class='fa-solid fa-ellipsis']
    Click Element               xpath=//a[text()='Delete']
    sleep   3
    Wait Until Page Contains            Delete Confirmation
    click button                        xpath://button[text()='Delete']
    sleep                               4s
    page should contain                 Form deleted successfully

Delete a Bundle
   click element                        xpath://span[normalize-space()='Form Bundle']
   input text                           xpath://input[@placeholder='Search...']     ${Search_value}
   Press Keys                           //input[@placeholder='Search...']    ENTER
   sleep                                3s
   click element                        xpath://i[contains(@class, 'fa fa-trash fa-lg delete_button')]
   Wait Until Page Contains             Delete Confirmation
   click button                         xpath://button[normalize-space()='Confirm']
   sleep                                4s
   page should contain                  Bundle deleted successfully