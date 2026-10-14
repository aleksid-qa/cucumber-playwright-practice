const { Given, When, Then } = require("@cucumber/cucumber");

const { expect } = require("@playwright/test");

Given("the user navigates to the registration page", async function () {
    await this.page.goto("http://localhost:3000/user/sign_up");
});

When('the user enters {string} username, {string} email, {string} password, and {string} confirm password', async function (username, email, password, confirmPassword) {
    await this.page.fill('input[name="user_name"]', username);
    await this.page.fill('input[name="email"]', email);
    await this.page.fill('input[name="password"]', password);
    await this.page.fill('input[name="retype"]', confirmPassword);
}
);

When("clicks the register button", async function () {
    await this.page.click('.ui.primary.button');
});