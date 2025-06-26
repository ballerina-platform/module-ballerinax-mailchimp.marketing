## Overview

[Mailchimp Marketing Email](https://mailchimp.com) is a powerful and user-friendly platform provided by Intuit Mailchimp, designed for creating, managing, and optimizing targeted email campaigns. It enables businesses to engage customers with personalized marketing emails, automated workflows, and insightful analytics to drive growth and build lasting relationships.

The `ballerinax/mailchimp.marketing` package provides APIs to connect and interact with the [Mailchimp Marketing API](https://mailchimp.com/developer/marketing/api/), enabling seamless integration with applications to manage marketing email sending, templates, messages, and more.

## Setup guide

To use the Mailchimp Marketing Email connector, you need to have a Mailchimp account and access to a API key. Follow the steps below to set up your account and generate the required API key.

### Step 1: Create a Mailchimp Account

1. Go to the [Mailchimp Sign Up Page](https://login.mailchimp.com/signup/) and create a Mailchimp account.

2. Once signed in, click on your profile icon in the bottom-left corner to access the account menu.

    ![Mailchimp dashboard](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.marketing/refs/heads/main/docs/setup/resources/mailchimp_dashboard.png)
    ![Mailchimp Profile Menu](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.marketing/refs/heads/main/docs/setup/resources/mailchimp_menu.png)

### Step 2: Generate a API Key

1. In the menu, go to **Extras** section and click on **API keys**.

    ![Mailchimp Extra Section](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.marketing/refs/heads/main/docs/setup/resources/mailchimp_menu_extra.png)

2. Choose **Create A Key** (not the Mandril API key). You will be redirected to the API Key Generate Dashboard.

    ![Mailchimp API Selection](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.marketing/refs/heads/main/docs/setup/resources/api_key.png)

3. In the API Key dashboard, add a API key name and click **Generate  Key** to generate your key.

    ![Mailchimp API Key Generat](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-mailchimp.marketing/refs/heads/main/docs/setup/resources/api_key_dashboard.png)

4. Copy the generated API key. You will need this to authenticate your connector.
   

## Quickstart

To use the `Mailchimp Marketing` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

Import the `mailchimp.marketing` module.

```ballerina
import ballerinax/mailchimp.marketing;
```
### Step 2: Configure the API Key

Create a `Config.toml` file and add your API key obtained from the setup process:

```bash
mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
```

### Step 3: Run the Ballerina application

```bash
bal run
```

## Examples

The `MailChimp Marketing Emails` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing/tree/main/examples), covering the following use cases:


1. [Add Mailchimp Subscriber](https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing/tree/main/examples/add_subscriber) – Add a new subscriber to a specific Mailchimp audience list.
2. [List Mailchimp Audiences](https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing/tree/main/examples/list_audiences) – Fetch and display a list of all your Mailchimp audience lists.
