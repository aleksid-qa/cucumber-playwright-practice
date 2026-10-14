Feature: Gitea login functionality

    Scenario: Verify login as valid user
        Given the user navigates to the login page
        When the user enters "testuser" username and "QA123456&" password
        And clicks the login button
        Then the user should be redirected to the dashboard page

    Scenario: Verify login as invalid user
        Given the user navigates to the login page
        When the user enters "invalid" username and "invalid" password
        And clicks the login button
        Then the user should see "Username or password is incorrect." error message

    Scenario: Verify login with empty username and valid password
        Given the user navigates to the login page
        When the user enters "" username and "QA123456&" password
        And clicks the login button
        Then the "Please fill out this field." "user_name" field error should be displayed

    Scenario: Verify login with valid username and empty password
        Given the user navigates to the login page
        When the user enters "testuser" username and "" password
        And clicks the login button
        Then the "Please fill out this field." "password" field error should be displayed