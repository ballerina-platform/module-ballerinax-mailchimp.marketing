# Add Mailchimp Subscriber

This example demonstrates how to use the Ballerina Mailchimp Marketing connector to add a new subscriber to a specific list in your Mailchimp account.

## Use Case

Adding a new subscriber to a Mailchimp list is a common operation for growing your audience. This is especially useful for:

- Integrating with signup forms on your website.
- Onboarding new customers or users into your mailing list.
- Automating subscription management from other systems.

## Prerequisites

- Ballerina Swan Lake Update 12 (or later)
- A Mailchimp account
- A Mailchimp API Key. You can generate an API key from your Mailchimp account settings: `Profile > Extras > API Keys`.
- The ID of the Mailchimp list (`list_id`) you want to add the subscriber to.

## Configuration

Create a `Config.toml` file in the `examples/add_subscriber` directory:

```toml
username = "<your-mailchimp-marketing-username>"
mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
mailchimpListId = "<your-mailchimp-list-id>"
```

## How to Run

1. Clone the examples repository (if not already done):

   ```bash
   git clone https://github.com/ballerina-platform/module-ballerinax-mailchimp.marketing
   cd module-ballerinax-mailchimp.marketing/examples/add_subscriber
   ```

2. Set up your credentials:
   Create a `Config.toml` file in the `examples/add_subscriber` directory with the following content:

   ```toml
   username = "<your-mailchimp-marketing-username>"
   mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
   mailchimpListId = "<your-mailchimp-list-id>"
   ```

3. Run the Ballerina program:

   ```bash
   bal run
   ```

## Expected Output

Upon successful execution, the program will print the details of the newly added subscriber, including their email, Mailchimp ID, and subscription status.
In case of an error, it will print the error message.

**Example output:**

```
Added subscriber - Email: test.subscriber.abcd1234@example.com, ID: 1234567890abcdef1234567890abcdef, Status: subscribed
Retrieved member info - Email: test.subscriber.abcd1234@example.com, Status: subscribed, Merge Fields: {}

Tag 'BallerinaTestTag' added to member.

Deleted member with ID: 1234567890abcdef1234567890abcdef

Ping successful. Health Status: Good

Retrieved 2 lists:
  - List Name: 'Newsletter Audience', ID: 'a1b2c3d4e5'
  - List Name: 'Product Updates', ID: 'f6g7h8i9j0'

List activity (3 items):
  - Activity: 'subscribe' on '2024-06-25T14:32:12+00:00' for email 'user1@example.com'
  - Activity: 'unsubscribe' on '2024-06-24T11:18:49+00:00' for email 'user2@example.com'
  - Activity: 'cleaned' on '2024-06-23T10:05:33+00:00' for email 'user3@example.com'
```
