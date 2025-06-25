# List Mailchimp Audiences

This example demonstrates how to use the Ballerina Mailchimp Marketing connector to fetch and display a list of all audience lists (also known as audiences) from your Mailchimp account.

## Use Case

Listing audience lists is often the first step in any Mailchimp integration, as most operations (like adding members, creating campaigns, etc.) require an audience ID. This example is useful for:

- Getting an overview of all your existing audiences.
- Identifying the correct `list_id` for other API operations.
- Automating reporting on audience sizes and growth.

## Prerequisites

- Ballerina Swan Lake Update 12 (or later)
- A Mailchimp account
- A Mailchimp API Key. You can generate an API key from your Mailchimp account settings: `Profile > Extras > API Keys`.

## Configuration

Create a `Config.toml` file in the `examples/list_audiences` directory:

```toml
username = "<your-mailchimp-marketing-username>"
mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
````

## How to Run

1. Clone the examples repository (if not already done):

   ```bash
   git clone https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing
   cd module-ballerinax-mailchimp.marketing/examples/list_audiences
   ```

2. Set up `Config.toml`:
   Place the `Config.toml` file with your Mailchimp credentials in the root of your Ballerina project (or use environment variables).

3. Run the Ballerina program:

   ```bash
   bal run
   ```

## Expected Output

Upon successful execution, the program will print a list of your Mailchimp audience lists, including their ID, name, number of members, and creation date.
If no lists are found, it will indicate that. In case of an error, it will print the error message.

**Example output:**

```
Successfully fetched audience lists. Total lists: X
List ID: abcdef1234
Name: My Main Audience
Members: 1500
Created: 2023-01-15T09:00:00+00:00
```
