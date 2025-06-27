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

import ballerina/io;
import ballerina/uuid;
import ballerinax/mailchimp.marketing as mailchimp;

configurable string username = ?;
configurable string mailchimpApiKey = ?;
configurable string mailchimpListId = ?;

mailchimp:Client mailchimpClient = check new ({
    auth: {
        username,
        password: mailchimpApiKey
    }
});

public function main() returns error? {
    string newSubscriberEmail = "short.example." + uuid:createType4AsString().substring(0, 8) + "@example.com";

    mailchimp:AddListMembers1 newMemberPayload = {
        emailAddress: newSubscriberEmail,
        status: "subscribed"
    };

    mailchimp:ListMembers2 addMemberResult =
    mailchimpClient->/lists/[mailchimpListId]/members.post(newMemberPayload);
    io:println("Successfully added subscriber:");
    io:println("Email: ", addMemberResult.emailAddress);
    io:println("ID: ", addMemberResult.id);
    io:println("Status: ", addMemberResult.status);
}
