*** Keywords ***
Begin Web Test
    Open Browser                about:blank  ${BROWSER}
    Set Selenium Speed          0.3

Go to Web Page
    Load page
    Verify startpage loaded

Load page
    Go To                       ${URL}

Verify startpage loaded
    ${link_text} = 		        Get Text  id:title
    Should Be Equal		        ${link_text}  Infotiv Car Rental

Create user account
    [Arguments]                  ${email_text}  ${confirm_email}  ${password}  ${confirm_password}
    Click Button                //*[@id="createUser"]
    Verify page loaded
    Enter first name
    Enter last name
    Enter phone number
    Enter email                 ${email_text}
    Confirm email               ${confirm_email}
    Enter password              ${password}
    Confirm password            ${confirm_password}
    Click Button                //*[@id="create"]

Enter first name
    Input Text                  id:name  ${first_name}

Enter last name
    Input Text                  id:last  ${sur_name}

Enter phone number
    Input Text                  id:phone  ${phone_number}

Enter email
    [Arguments]                 ${email_text}
    Input Text                  id:emailCreate  ${email_text}

Confirm email
    [Arguments]                 ${confirm_email}
    Input Text                  id:confirmEmail  ${confirm_email}

Enter password
    [Arguments]                 ${password}
    Input Text                  id:passwordCreate  ${password}

Confirm password
    [Arguments]                 ${confirm_password}
    Input Text                  id:confirmPassword  ${confirm_password}

Verify page loaded
    ${link_text} =              Get Text  id:questionText
    Should Be Equal             ${link_text}  Create a new user

Verify Email Taken
    ${link_text} =              Get Text  id:signInError
    Should Be Equal             ${link_text}  That E-mail is already taken

Verify login page
    [Arguments]				    ${search_term}
    ${expected_result} =		Set Variable  You are signed in as ${search_term}
    ${actual_term} = 			Get Text  //*[@id="welcomePhrase"]
    ${actual_result} =			Set Variable  ${actual_term}
    Should Be Equal				${expected_result}  ${actual_result}

Enter search term
    [Arguments]                 ${search_term}
    Input Text                  id:twotabsearchtextbox  ${search_term}

Submit search
    Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input

Log in success
    [Arguments]                 ${email}  ${password}  ${search_term}
    Enter Email_login           ${email}
    Enter Password_login        ${password}
    Click Button                id:login

Enter Email login
    [Arguments]                  ${search_term}
    Input Text                   id:email  ${search_term}

Enter Password login
    [Arguments]                  ${search_term}
    Input Text                   id:password  ${search_term}

Log in fail
    [Arguments]                 ${email}  ${password}  ${search_term}
    Enter Email_login           ${email}
    Enter Password_login        ${password}
    Click Button                xpath://*[@id="login"]



Log out
    Click Button                xpath://*[@id="logout"]
    Page Should Contain Button  xpath://*[@id="login"]


Verify login fail page
    ${link_text} =              Get Text  id:signInError
    Should Be Equal             ${link_text}  Wrong e-mail or password

Book a Car
    [Arguments]                 ${card_number}  ${card_name}  ${card_cvc}
    Click Button                id:continue
    Booking page loaded
    Click Button                //*[@id="bookQ7pass5"]
    Confirm page loaded
    Enter card number           ${card_number}
    Enter card name             ${card_name}
    Enter cvc                   ${card_cvc}
    Click Button                id:confirm


Booking page loaded
    ${expected_result} =		Set Variable  What would you like to drive?
    ${actual_term} = 			Get Text  id:questionText
    Should Be Equal				${expected_result}  ${actual_term}

Confirm page loaded
    ${expected_result} =		Set Variable  Confirm booking of Audi Q7
    ${actual_term} = 			Get Text  id:questionText
    Should Be Equal				${expected_result}  ${actual_term}

Enter card number
    [Arguments]                 ${card_number}
    Input Text                  id:cardNum  ${card_number}

Enter card name
    [Arguments]                 ${card_name}
    Input Text                  id:fullName  ${card_name}

Enter cvc
    [Arguments]                 ${card_cvc}
    Input Text                  id:cvc  ${card_cvc}

Verify Booked Page Loaded
    ${CurrentDate} =            Get Current Date   result_format=%Y-%m-%d
    ${expected} =               Set Variable  A Audi Q7 is now ready for pickup ${CurrentDate}
    ${actual} =                 Get Text   id:questionTextSmall
    Should Be Equal             ${expected}  ${actual}

Logged in user books car
    Log in success              Gisela@hotmail.com  labb3auto  Gisela
    Book a Car                 1234567898765432  Gisela  123

Delete booking
    Click Button                id:mypage
    Click Button                id:unBook1
    Handle Alert

Verify no bookings
    Click Button                id:mypage
    ${expected_result} =		Set Variable  You have no bookings
    ${actual_term} = 			Get Text  id:historyText
    Should Be Equal				${expected_result}  ${actual_term}


End Web Test
    Close Browser

