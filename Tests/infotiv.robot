*** Settings ***
Documentation                   This is some basic info about the whole test suite
Resource                        ../Resources/keywords.robot
Library                         SeleniumLibrary
Library                         DateTime
Suite Setup                     Begin Web Test
Suite Teardown                  End Web Test

*** Variables ***
${BROWSER} =                    firefox
${URL} =                        http://rental29.infotiv.net/
${first_name} =                 Gisela
${sur_name} =                   GM
${phone_number} =               0700707070

*** Test Cases ***
User can access infotiv car rental site

    [Documentation]             See if page is accessable and can load correctly
    [Tags]                      Test 1

        Go to Web Page

User cannot create user account

    [Documentation]                 Should not be able to create new account with same email if one already exist.
    [Tags]                          Test 2

       Given Go to Web Page
       When Create user account     Gisela@hotmail.com  Gisela@hotmail.com  labb3auto  labb3auto
       Then Verify Email Taken

User can log in
    [Documentation]                 Log in success
    [Tags]                          Test 3
    [Teardown]                      Log out

    Given Go to Web Page
    When Log in success              Gisela@hotmail.com  labb3auto  Gisela
    Then Verify login page           Gisela


User cannot log in
    [Documentation]                 Log in fail, wrong input.
    [Tags]                          Test 4


    Given Go to Web Page
    When Log in fail                Gisela@hotmail.com  labb3autoo  Gisela
    Then Verify login fail page

User can book car
    [Documentation]                 Book a car
    [Tags]                          Test 5
    [Setup]                         Go to Web Page
    [Teardown]                      Log out

    Given Log in success              Gisela@hotmail.com  labb3auto  Gisela
    When Book a Car                 1234567898765432  Gisela  123
    Then Verify Booked Page Loaded
    Delete booking

User can Delete booking
    [Documentation]                 Delete car booking
    [Tags]                          Test 6
    [Setup]                         Go to Web Page
    [Teardown]                      Log out

    Given Logged in user books car
    When Delete booking
    Then Verify no bookings
