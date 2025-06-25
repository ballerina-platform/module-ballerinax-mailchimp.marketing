_Author_: @Lashen1227 
_Created_: 25 June 2025 
_Updated_: 25 June 2025 
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from MailChimp Marketing Emails. 
The OpenAPI specification is obtained from [Mailchimp official Github](https://github.com/mailchimp/mailchimp-client-lib-codegen/blob/30f5482a24861d1f23ba06d94898d42bebf1f331/spec/marketing.json). 
These changes improve usability and work around known compatibility issues with Ballerina.

---

## 1. Fixed two unresolved field errors

**Location**:  
`components.schemas.YourSchemaHere.properties.customer`  
`paths./customer-journeys/journeys/{journeyId}/steps/{stepId}/actions/trigger`

**Original**:
```json
"customer": { "$ref": "#/components/schemas/Customer" }
````

**Sanitized**:

```json
"journey_customer": { "$ref": "#/components/schemas/Customer" }
```

**Reason**:
Avoids redeclared symbol errors due to Ballerina's type-inclusion mechanism and improves naming clarity.

---

## 2. Fixed one type mismatch

**Location**:
Within the schema that previously used an incompatible type — for example:
`paths./account-exports.get.parameters.count.schema.type`

**Original**:

```json
"type": "integer"
```

**Sanitized**:

```json
"type": "string"
```

**Reason**:
Fixes the type mismatch so that Ballerina client generation passes without validation errors.

---

## 3. Renamed `x-ballerina-name` to `x-ballerina-name-ignore`

**Location**:
Every occurrence of `x-ballerina-name` across all paths and parameters, for example:
`paths./account-exports.get.parameters[1].x-ballerina-name`

**Original**:

```json
"x-ballerina-name": "excludeFields"
```

**Sanitized**:

```json
"x-ballerina-name-ignore": "excludeFields"
```

**Reason**:
Works around GitHub issue [#38535](https://github.com/ballerina-platform/ballerina-lang/issues/38535) when included records cause name collisions.

---

## OpenAPI CLI command

Use the following command to generate the Ballerina client after applying these sanitizations:

```bash
bal openapi -i docs/spec/openapi.json --mode client -o ballerina
```
