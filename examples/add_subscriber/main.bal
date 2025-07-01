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

configurable string username = "test-user";
configurable string mailchimpApiKey = "test-key";
configurable string mailchimpListId = "test-list-id";

mailchimp:Client mailchimpClient = check new ({
    auth: {
        username,
        password: mailchimpApiKey
    }
});

public function main() returns error? {
    string newSubscriberEmail = "test.subscriber." + uuid:createType4AsString().substring(0, 8) + "@example.com";
    mailchimp:AddListMembers1 newMemberPayload = {
        emailAddress: newSubscriberEmail,
        status: "subscribed"
    };

    mailchimp:ListMembers2 addMemberResult = check mailchimpClient->/lists/[mailchimpListId]/members.post(newMemberPayload);
    if addMemberResult.id is () {
        return error("Member ID not found after addition.");
    }
    string memberId = <string>addMemberResult.id;

    io:println("Added subscriber - Email: ", addMemberResult.emailAddress, 
               ", ID: ", memberId, 
               ", Status: ", addMemberResult.status);

    mailchimp:ListMembers2 getMemberResult = check mailchimpClient->/lists/[mailchimpListId]/members/[memberId].get();
    io:println("\nRetrieved member info - Email: ", getMemberResult.emailAddress, 
               ", Status: ", getMemberResult.status, 
               ", Merge Fields: ", getMemberResult.mergeFields.toJsonString());

    mailchimp:MemberTags addTagPayload = {
        tags: [{ name: "BallerinaTestTag", status: "active" }]
    };
    check mailchimpClient->/lists/[mailchimpListId]/members/[memberId]/tags.post(addTagPayload);
    io:println("\nTag 'BallerinaTestTag' added to member.");

    check mailchimpClient->/lists/[mailchimpListId]/members/[memberId].delete();
    io:println("\nDeleted member with ID: ", memberId);

    mailchimp:APIHealthStatus pingResult = check mailchimpClient->/ping.get();
    io:println("\nPing successful. Health Status: ", pingResult.healthStatus);

    mailchimp:SubscriberLists listsResult = check mailchimpClient->/lists.get();
    io:println("\nRetrieved ", listsResult.totalItems, " lists:");
    foreach var list in listsResult.lists {
        io:println("  - List Name: '", list.name, "', ID: '", list.id, "'");
    }

    mailchimp:ListActivity listActivityResult = check mailchimpClient->/lists/[mailchimpListId]/activity.get();
    io:println("\nList activity (", listActivityResult.totalItems, " items):");
    foreach var activity in listActivityResult.activity ?: [] {
        io:println("  - Activity: '", activity["activityType"], "' on '", activity["timestamp"], "' for email '", activity["emailAddress"], "'");
    }

    return;
}