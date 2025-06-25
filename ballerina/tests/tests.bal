// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

configurable boolean isLiveServer = ?;
configurable string username = ?;
configurable string mailchimpApiKey = ?;
configurable string baseUrl = ?;

Client mailchimp = check new ({
    auth: {
        username,
        password: mailchimpApiKey
    }
}, isLiveServer ? baseUrl : "http://localhost:9090");

@test:Config
function listAutomations() returns error? {
    InlineResponse2005 response = check mailchimp->/automations();
    test:assertNotEquals(response.totalItems, ());
}

@test:Config
function listAccountExports() returns error? {
    InlineResponse2001 response = check mailchimp->/account\-exports();
    test:assertNotEquals(response.totalItems, ());
}

@test:Config
function getLatestChimpChatter() returns error? {
    InlineResponse200 response = check mailchimp->/activity\-feed/chimp\-chatter();
    test:assertNotEquals(response.totalItems, ());
}

@test:Config
function listAuthorizedApps() returns error? {
    InlineResponse2003 response = check mailchimp->/authorized\-apps();
    test:assertNotEquals(response.totalItems, ());
}

@test:Config
function testGetAutomations() returns error? {
    map<(string|string[])> queries = {
        fields: "id,name",
        exclude_fields: "status"
    };
    var result = check mailchimp->/automations(queries);
    test:assertNotEquals(result, (), msg = "Response should not be empty");
}

