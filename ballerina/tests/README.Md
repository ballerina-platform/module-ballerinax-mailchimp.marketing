# Running Tests

## Prerequisites

You must have:

- A Mailchimp account.
- An API key from Mailchimp (`mailchimpApiKey`).
- The `username` associated with the account.

---

## Test Environments

### 1. Mock Server Tests
Tests run against a simulated Mailchimp service.

#### Using `Config.toml`
Create or modify the `Config.toml` in the `tests` directory:

```toml
isLiveServer = false
```

#### Alternatively, using Environment Variables:
If you're using **Linux** or **Mac**:

```bash
export isLiveServer=false
```

If you're using **Windows**:

```bash
setx isLiveServer false
```

---

### 2. Live API Tests
Tests run against the actual Mailchimp Marketing API.

#### Using `Config.toml` file
Create a `Config.toml` file in the test directory and add your authentication credentials

```toml
isLiveServer = true
username = "<your-mailchimp-marketing-username>"
mailchimpApiKey = "<your-mailchimp-marketing-access-token>"
baseUrl = "https://us9.api.mailchimp.com/3.0"
```

#### Alternatively, using Environment Variables:
If you're using **Linux** or **Mac**:

```bash
export isLiveServer=true
export username="<your-mailchimp-marketing-username>"
export mailchimpApiKey="<your-mailchimp-marketing-access-token>"
export baseUrl="https://us9.api.mailchimp.com/3.0"
```

If you're using **Windows**:

```bash
setx isLiveServer true
setx username "<your-mailchimp-marketing-username>"
setx mailchimpApiKey "<your-mailchimp-marketing-access-token>"
setx baseUrl "https://us9.api.mailchimp.com/3.0"
```

---

## Running the Tests

#### Mock Server
Tests run against the mock server by default when:

- `isLiveServer` is unset
- OR explicitly set to `false`

Run the following command:

```bash
./gradlew clean test
```

#### Live Server
Tests run against the actual Mailchimp Marketing API when:

- `isLiveServer = true`
- `username`, `mailchimpApiKey`, and `baseUrl` are configured

Run the following command:

```bash
./gradlew clean test
```
