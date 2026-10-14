const { Given, When, Then } = require("@cucumber/cucumber");

const { expect } = require("@playwright/test");

Given("the user navigates to the login page", async function () {
    await this.page.goto("http://localhost:3000/user/login");
});

When('the user enters {string} username and {string} password', async function (username, password) {
    await this.page.locator('#user_name').fill(username);
    await this.page.locator('#password').fill(password);
});

When('clicks the login button', async function () {
    await this.page.click('.ui.primary.button');
});

Then('the user should be redirected to the dashboard page', async function () {
    await expect(this.page).toHaveURL('http://localhost:3000');
});

Then('the user should see {string} error message', async function (expectedMessage) {
    const errorMessage = this.page.locator('.flash-error');
    await expect(errorMessage).toBeVisible();
    await expect(errorMessage).toHaveText(expectedMessage);
});

Then('the {string} {string} field error should be displayed', async function (fieldErrorMessage, fieldName) {
    const field = this.page.locator(`#${fieldName}`);
    await expect(field).toHaveJSProperty('validity.valueMissing', true);
    const message = await field.evaluate(el => el.validationMessage);
    expect(message).toMatch(fieldErrorMessage);
});