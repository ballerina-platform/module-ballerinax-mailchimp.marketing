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

configurable string username = ?;
configurable string mailchimpApiKey = ?;
const string baseUrl = "https://us9.api.mailchimp.com/3.0";

public function main() returns error? {
    mailchimp:Client mailchimpClient = check new ({
        auth: {
            username,
            password: mailchimpApiKey
        }
    }, baseUrl);

    mailchimp:InlineResponse2007|error campaignsResult = mailchimpClient->/campaigns.get();

    if campaignsResult is mailchimp:InlineResponse2007 {
        mailchimp:Campaign4[]? campaignsOpt = campaignsResult.campaigns;
        if campaignsOpt is mailchimp:Campaign4[] && campaignsOpt.length() > 0 {
            io:println("Successfully fetched campaigns. Total campaigns: ", campaignsResult.totalItems);

            foreach mailchimp:Campaign4 campaign in campaignsOpt {
                io:println("Campaign ID: ", campaign.id);
                io:println("Title: ", campaign.settings?.title ?: "N/A");
                io:println("Type: ", campaign["type"]);
                io:println("Status: ", campaign.status);
                io:println("Create Time: ", campaign.createTime ?: "N/A");
            }
        } else {
            io:println("No campaigns found.");
        }
    } else {
        io:println("Error fetching campaigns: ", campaignsResult.message());
    }
}
