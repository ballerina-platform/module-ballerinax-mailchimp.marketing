# List Mailchimp Campaigns

This example demonstrates how to use the Ballerina Mailchimp Marketing connector to fetch and display a list of campaigns from your Mailchimp account.

## Use Case

Retrieving a list of campaigns is a fundamental operation for managing your marketing efforts. This can be useful for:

- Displaying an overview of all created campaigns.
- Automating reporting or analysis of campaign performance.
- Identifying campaigns that need attention (e.g., drafts, paused campaigns).

## Prerequisites

- Ballerina Swan Lake Update 12 (or later)
- A Mailchimp account
- A Mailchimp API Key. You can generate an API key from your Mailchimp account settings: `Profile > Extras > API Keys`.

## Configuration

Create a `Config.toml` file in the `examples/list_campaings` directory:

```toml
username = "<your-mailchimp-marketing-username>"
mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
```

## How to Run

1. Clone the examples repository (if not already done):

   ```bash
   git clone https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing
   cd module-ballerinax-mailchimp.marketing/examples/list_campaigns
   ```

2. Set up your credentials:
   Create a `Config.toml` file in the `examples/list_campaigns` directory with the following content:

   ```toml
   username = "<your-mailchimp-marketing-username>"
   mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
   ```

3. Run the Ballerina program:

   ```bash
   bal run
   ```

## Expected Output

Upon successful execution, the program will print a list of your Mailchimp campaigns, including their ID, title, type, status, and creation time. If no campaigns are found, it will indicate that. In case of an error, it will print the error message.

**Example output:**

```
Successfully fetched campaigns. Total campaigns: X
Campaign ID: abcdef1234
Title: My First Newsletter
Type: regular
Status: sent
Create Time: 2024-06-24T10:00:00+00:00
```
