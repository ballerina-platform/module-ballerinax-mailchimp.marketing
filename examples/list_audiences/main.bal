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
import ballerinax/mailchimp.marketing as mailchimp;

configurable string username = "test-user";
configurable string mailchimpApiKey = "test-key";

mailchimp:Client mailchimpClient = check new({
    auth: {
        username,
        password: mailchimpApiKey
    }
});

public function main() returns error? {
    mailchimp:SubscriberLists listsResult = check mailchimpClient->/lists.get();

    if listsResult.lists is mailchimp:SubscriberList3[] && listsResult.lists.length() > 0 {
        io:println("Successfully fetched audience lists. Total lists: ", listsResult.totalItems);

        foreach mailchimp:SubscriberList3 list in listsResult.lists {
            io:println("List ID: ", list["id"]);
            io:println("Name: ", list["name"]);
            mailchimp:Statistics? statsField = list.stats;
            int memberCount = statsField?.memberCount ?: 0;
            io:println("Members: ", memberCount);
            io:println("Created: ", list["date_created"] ?: "N/A");
        }
    } else {
        io:println("No audience lists found.");
    }
}
