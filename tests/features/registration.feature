Feature: Gitea registration functionality

    Scenario: Verify registration with short password
        Given the user navigates to the registration page
        When the user enters "testuser1" username, "testuser1@example.com" email, "123" password, and "123" confirm password
        And clicks the register button
        Then the user should see "Password length cannot be less than 8 characters." error message

    Scenario: Verify registration with already registered username
        Given the user navigates to the registration page
        When the user enters "testuser" username, "testuser1@example.com" email, "QA123456&" password, and "QA123456&" confirm password
        And clicks the register button
        Then the user should see "The username is already taken." error message

    Scenario: Verify registration with already registered email
        Given the user navigates to the registration page
        When the user enters "testuser1" username, "test@gmail.com" email, "QA123456&" password, and "QA123456&" confirm password
        And clicks the register button
        Then the user should see "The email address is already used." error message

    Scenario: Verify registration with mismatched password and confirm password
        Given the user navigates to the registration page
        When the user enters "testuser1" username, "testuser1@example.com" email, "QA123456&" password, and "QA123456" confirm password
        And clicks the register button
        Then the user should see "The passwords do not match." error message