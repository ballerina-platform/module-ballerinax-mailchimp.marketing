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

import ballerina/http;

service on new http:Listener(9090) {
    resource isolated function get account\-exports() returns InlineResponse2001|error? {
        return {
            "totalItems": 5
        };
    }

    resource isolated function get activity\-feed/chimp\-chatter() returns InlineResponse200|error? {
        return {
            totalItems: 5
        };
    }

    resource isolated function get authorized\-apps() returns InlineResponse2004|error? {
        return {
            "totalItems": 5
        };
    }

    resource isolated function get .(http:Request req) returns APIRoot|error? {
        return {
            "title": "Mailchimp Marketing API",
            "_links": []
        };
    }

    resource isolated function get automations() returns http:Ok {
        json mockResponse = {
            "data": [
                {
                    "id": "mock_auto_123",
                    "name": "Sample Automation A",
                    "status": "sending"
                },
                {
                    "id": "mock_auto_456",
                    "name": "Sample Automation B",
                    "status": "paused"
                }
            ],
            "total_items": 2,
            "_links": [
                {"href": "https://example.com/automations", "rel": "self", "method": "GET"}
            ]
        };
        return {body: mockResponse, headers: {"Content-Type": "application/json"}};
    }

    resource isolated function get automations/[string workflowId]() returns AutomationWorkflow1|error? {
        return {
            id: workflowId,
            "create_time": "2023-01-01T00:00:00+00:00",
            status: "save",
            "emails_sent": 0
        };
    }

    resource isolated function post automations/[string workflowId]/emails/[string workflowEmailId]/queue(http:Caller caller, http:Request req) returns error? {
        json body = check req.getJsonPayload();
        json response = {
            id: "mocked-id",
            email_address: check body.email_address,
            status: "subscribed"
        };
        check caller->respond(response);
    }
}