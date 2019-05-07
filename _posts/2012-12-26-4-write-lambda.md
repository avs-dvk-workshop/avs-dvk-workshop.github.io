---
title: '4. Write Lambda function code'


layout: nil
---
### Lambda function code
Let�s return to the Lambda function page. Here we click on the name of our function in the middle of the page:
![alt text](https://fs1.fex.net/show/168099638686/702626813/7de46010/55%20-%20Selecting%20lambda%20function.png?1600w,0 "Selecting lambda function")  
Then scroll down until you see the text editor, this is where we put the code - yours should only have a simply "Hello World" snippet in there.
![alt text](https://fs1.fex.net/show/168099638686/702626826/4c706a40/56%20-%20Lambda%20function%20code%20editor.png?1600w,0 "lambda function code editor")   
First, we need to add some configuration information to allow the Lambda function to communicate with the IoT device:
```javascript
var config = {};
config.IOT_BROKER_ENDPOINT = "a3q6g7uqcbysvk.iot.us-east-1.amazonaws.com";
config.IOT_BROKER_REGION = "us-east-1";
config.IOT_THING_NAME = "Raspberry_Pi_LED_Thing";
```
The variable `IOT_BROKER_ENDPOINT` contains the recently copied URL of your IoT device, so please insert your own URL there. `IOT_BROKER_REGION` is the region we selected when creating the IoT Thing and Lambda function. It should be **"us-east-1 (N. Virginia)"**. `IOT_THING_NAME` is the name of the IoT thing that you used.

Now let�s add some helper functions:
```javascript
function buildSpeechletResponse(title, output, repromptText, shouldEndSession) {
    return {
        outputSpeech: {
            type: 'PlainText',
            text: output
        },
        card: {
            type: 'Simple',
            title: "SessionSpeechlet - " + title,
            content: "SessionSpeechlet - " + output
        },
        reprompt: {
            outputSpeech: {
                type: 'PlainText',
                text: repromptText
            }
        },
        shouldEndSession: shouldEndSession
    };
}
function buildResponse(sessionAttributes, speechletResponse) {
    return {
        version: '1.0',
        sessionAttributes: sessionAttributes,
        response: speechletResponse
    };
}
```
Function `BuildSpeechletResponse` builds the correct response on the Alexa Skill request. As you can see, it consists of three necessary parts: 
-	`outputSpeech` � the text that Alexa will say after receiving this response;
-	`card` � for the devices that have a display and are able to show cards;
-	`reprompt` � this is the test that Alexa will tell you in the case you opened the Skill but didn�t ask for any action.
`ShouldEndSession` is the boolean variable that tells Alexa to keep the Skill running or to close the session.
Function `BuildResponse` adds a header to the response and builds the ready-to-be-sent response.
For more information about Alexa requests and responses please read [here]( 
https://developer.amazon.com/docs/custom-skills/request-and-response-json-reference.html).

Now, let�s create some functions that are invoked when the session starts:
```javascript
function onSessionStarted(sessionStartedRequest, session) {
    console.log("onSessionStarted requestId=" + sessionStartedRequest.requestId + ",\n        sessionId=" + session.sessionId);
}
function onLaunch(launchRequest, session, callback) {
    console.log("onLaunch requestId=" + launchRequest.requestId + ", sessionId=" + session.sessionId);
    getWelcomeResponse(callback);
}
function getWelcomeResponse(callback) {
    var sessionAttributes = {};
    var cardTitle = 'Welcome';
    var speechOutput = 'Welcome to the Raspberry Pi LED control app ';
    var repromptText = 'You can say: turn the red led on ';
    var shouldEndSession = false;
    callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
}
```
Function `onSessionStarted` just puts the information about the session into the log. 
Function `onLaunch` is invoked when the Skill is opened. It logs the session info and invokes the function `getWelcomeResponse`, which contains the text that Alexa will say when opening the Skill. 
So, when you say *"Alexa, open my raspberry"*, she will respond *"Welcome to the Raspberry Pi LED control App"*. If you wait a few seconds, you will hear the reprompt text *"'You can say: turn the red led on"*.

The next two functions are invoked when the Skill is about to close, like when you say *"Alexa, Stop"*.
```javascript
function handleSessionEndRequest(callback) {
    var cardTitle = 'Session Ended';
    var speechOutput = 'May the force be with you!';
    var shouldEndSession = true;
    callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
}
function onSessionEnded(sessionEndedRequest, session) {
    console.log("onSessionEnded requestId=" + sessionEndedRequest.requestId + ",\n        sessionId=" + session.sessionId);
    // Add cleanup logic here
}
```
These functions are fairly clear and don�t need additional explanation. 
The next function handles intent requests and is one of the most important.
```javascript
function onIntent(intentRequest, session, callback) {
    console.log("onIntent requestId=" + intentRequest.requestId + ", sessionId=" + session.sessionId);
    var intent = intentRequest.intent;
    var intentName = intentRequest.intent.name;
    if (intentName === 'AMAZON.HelpIntent') {
        getWelcomeResponse(callback);
    } else if (intentName === 'AMAZON.StopIntent') {
        handleSessionEndRequest(callback);
    } else if (intentName === 'LEDControlIntent') {
        var color = intent.slots.color.value;
        var state = intent.slots.state.value;
        handleLEDIntentRequest(callback, color, state);
    } else if (intentName === 'SwitchCheckIntent') {
        handleSwitchIntentRequest(callback);
    }
}
```
If you remember during creation of the Alexa Skill, we saw three required intents - *CancelIntent*, *HelpIntent* and *StopIntent*. We also added our own intents *LEDControlIntent* and *SwitchCheckIntent*. Here, we handle them using the intent name.
The ones we want to focus on are the **LEDControlIntent** and **SwitchCheckIntent**. 
Let�s first consider the **LEDControlIntent**. First we read the values of the color and state and then invoke the function `handleIntentRequest` which code is listed below:
```javascript
function handleLEDIntentRequest(callback, color, state) {
    var cardTitle = 'Control';
    var speechOutput;
    if (state === 'on' || state === 'off') {
        if (color === 'red' || color === 'green' || color === 'blue') {
            speechOutput = "The " + color + " LED is " + state;
            var newState = { 'color': color, 'state': state };
            updateShadow(newState);
        } else {
            speechOutput = 'Sorry, I don\'t know this LED color';
        }
    } else {
        speechOutput = 'Sorry, I don\'t know this state';
    }
    var shouldEndSession = true;
    callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
}
```
First, we check to see if `state` and `color` values have correct values. And if they do, we prepare the Alexa Speech output text, define the new state and invoke the function `updateShadow`. If values are wrong, we prepare a corresponding response speech. And finally call `callback` to return the response to the Alexa Skill. 
Now, a quick note about the *Thing Shadow*. This is a special interface of the AWS IoT that allows interaction between a virtual Thing and real IoT device. It is called a "Shadow" as it reflects the state of the real device. So, even if the device is not available at the moment, the updated state is saved in the Shadow, and can be read or updated when the device becomes available. The Shadow has two fields to access � "desired" and "reported". The "desired" state is what state we want our device to have, and thus the Lambda function will update this field. The "reported" state is the confirmed state of the device, so we will update it from the Raspberry Pi code. 

So, the function `updateShadow` is listed below.
```javascript
function updateShadow(desiredState) {
    var AWS = require('aws-sdk');
    AWS.config.region = config.IOT_BROKER_REGION;
    var paramsUpdate = {
        "thingName": config.IOT_THING_NAME,
        "payload": JSON.stringify({
            "state": {
                "desired": desiredState
            }
        })
    };
    var iotData = new AWS.IotData({ endpoint: config.IOT_BROKER_ENDPOINT });
    iotData.updateThingShadow(paramsUpdate, function (err, data) {
        if (err) {
            console.log("Error updating thing shadow" + err);
        } else {
            console.log("updated thing shadow " + config.IOT_THING_NAME + ' to state ' + paramsUpdate.payload);
        }
    });
}
```
First, we declare the variable `AWS` which we will use to interact with the AWS IoT device Shadow. Then we set the region and prepare the JSON `paramsUpdate` which will be sent to the IoT device Shadow. As you can notice, we update only the *"desired"* state.
Then we create new variable `iotData` which will be tied to the created IoT device by means of the endpoint, the IoT device URL. Finally, we try to update the Thing Shadow and log the result of this operation.

Now let�s consider the function that handles the `SwitchCheckIntent` � `handleSwitchIntentRequest`:
```javascript
function handleSwitchIntentRequest(callback) {
    var AWS = require('aws-sdk');
    AWS.config.region = config.IOT_BROKER_REGION;
    var params = {
        "thingName": config.IOT_THING_NAME
    };
    var iotData = new AWS.IotData({ endpoint: config.IOT_BROKER_ENDPOINT });
    iotData.getThingShadow(params, function (err, data) {
        var speechOutput;
        if (err) {
            console.log("Error updating thing shadow" + err);
            speechOutput = 'Sorry, there is an error';
        } else {
            var payload = JSON.parse(data.payload.toString());
            if (payload.state.reported.switch != null) speechOutput = "The switch is " + payload.state.reported.switch;else speechOutput = 'Sorry, the switch state is undefined';
        }
        var cardTitle = 'Switch';
        var shouldEndSession = true;
        callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
    });
}
```
The first part is very similar to the function `updateShadow`. The difference is that we don�t update the shadow state but read it with the function `getThingShadow`.
If there is no error, it returns the shadow value in the `data` variable. First, we check if there is an error, and prepare the corresponding message.
Then we parse the data payload and check if the value under the `switch` key is not null. If the value is okay, we prepare the message containing the switch state. Otherwise, the message says that the value is undefined. The last case can happen at the first launch when our Raspberry Pi hasn�t reported yet about the switch state. Finally, we invoke the callback function to send the response to the Alexa skill.

We�re almost done. Now we need to update the main function � that handles the Lambda function.
```javascript
exports.handler = function (event, context, callback) {
    try {
        console.log("event.session.application.applicationId=" + event.session.application.applicationId);
        if (event.session.new) {
            onSessionStarted({ requestId: event.request.requestId }, event.session);
        }
        if (event.request.type === 'LaunchRequest') {
            onLaunch(event.request, event.session, function (sessionAttributes, speechletResponse) {
                callback(null, buildResponse(sessionAttributes, speechletResponse));
            });
        } else if (event.request.type === 'IntentRequest') {
            onIntent(event.request, event.session, function (sessionAttributes, speechletResponse) {
                callback(null, buildResponse(sessionAttributes, speechletResponse));
            });
        } else if (event.request.type === 'SessionEndedRequest') {
            onSessionEnded(event.request, event.session);
            callback();
        }
    } catch (err) {
        callback(err);
    }
};
```
As you can see, this function handles all the events occurring within the Lambda function. In  the case of a new session, the function `OnSessionStarted` is invoked.
The most interesting part is handling the `event.request.type`. In this part, the app calls functions according to the sent request types. You can read more about intents types [here](https://developer.amazon.com/docs/custom-skills/request-types-reference.html).

Now, as we have defined and written all the functions, we can click orange *"Save"* button in the top right of the page. If there are no errors it will save the function without any notices and the button will become grey: 
![alt text](https://fs1.fex.net/show/168099638686/702626836/78ec4d40/57%20-%20Successfully%20created%20lambda%20function.png?1600w,0 "lambda function successfully created") 


Let�s put all that code in one block so that if there are any errors, it is easier to do a direct comparison:
```javascript
"use strict";
var config = {};
config.IOT_BROKER_ENDPOINT = "a3q6g7uqcbysvk.iot.us-east-1.amazonaws.com";
config.IOT_BROKER_REGION = "us-east-1";
config.IOT_THING_NAME = "Raspberry_Pi_LED_Thing";
function buildSpeechletResponse(title, output, repromptText, shouldEndSession) {
    return {
        outputSpeech: {
            type: 'PlainText',
            text: output
        },
        card: {
            type: 'Simple',
            title: "SessionSpeechlet - " + title,
            content: "SessionSpeechlet - " + output
        },
        reprompt: {
            outputSpeech: {
                type: 'PlainText',
                text: repromptText
            }
        },
        shouldEndSession: shouldEndSession
    };
}
function buildResponse(sessionAttributes, speechletResponse) {
    return {
        version: '1.0',
        sessionAttributes: sessionAttributes,
        response: speechletResponse
    };
}
function onSessionStarted(sessionStartedRequest, session) {
    console.log("onSessionStarted requestId=" + sessionStartedRequest.requestId + ",\n        sessionId=" + session.sessionId);
}
function onLaunch(launchRequest, session, callback) {
    console.log("onLaunch requestId=" + launchRequest.requestId + ", sessionId=" + session.sessionId);
    getWelcomeResponse(callback);
}
function getWelcomeResponse(callback) {
    var sessionAttributes = {};
    var cardTitle = 'Welcome';
    var speechOutput = 'Welcome to the Raspberry Pi LED control app ';
    var repromptText = 'You can say: turn the red led on ';
    var shouldEndSession = false;
    callback(sessionAttributes, buildSpeechletResponse(cardTitle, speechOutput, repromptText, shouldEndSession));
}
function handleSessionEndRequest(callback) {
    var cardTitle = 'Session Ended';
    var speechOutput = 'May the force be with you!';
    var shouldEndSession = true;
    callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
}
function onSessionEnded(sessionEndedRequest, session) {
    console.log("onSessionEnded requestId=" + sessionEndedRequest.requestId + ",\n        sessionId=" + session.sessionId);
    // Add cleanup logic here
}
function onIntent(intentRequest, session, callback) {
    console.log("onIntent requestId=" + intentRequest.requestId + ", sessionId=" + session.sessionId);
    var intent = intentRequest.intent;
    var intentName = intentRequest.intent.name;
    if (intentName === 'AMAZON.HelpIntent') {
        getWelcomeResponse(callback);
    } else if (intentName === 'AMAZON.StopIntent') {
        handleSessionEndRequest(callback);
    } else if (intentName === 'LEDControlIntent') {
        var color = intent.slots.color.value;
        var state = intent.slots.state.value;
        handleLEDIntentRequest(callback, color, state);
    } else if (intentName === 'SwitchCheckIntent') {
        handleSwitchIntentRequest(callback);
    }
}
function handleLEDIntentRequest(callback, color, state) {
    var cardTitle = 'Control';
    var speechOutput;
    if (state === 'on' || state === 'off') {
        if (color === 'red' || color === 'green' || color === 'blue') {
            speechOutput = "The " + color + " LED is " + state;
            var newState = { 'color': color, 'state': state };
            updateShadow(newState);
        } else {
            speechOutput = 'Sorry, I don\'t know this LED color';
        }
    } else {
        speechOutput = 'Sorry, I don\'t know this state';
    }
    var shouldEndSession = true;
    callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
}
function updateShadow(desiredState) {
    var AWS = require('aws-sdk');
    AWS.config.region = config.IOT_BROKER_REGION;
    var paramsUpdate = {
        "thingName": config.IOT_THING_NAME,
        "payload": JSON.stringify({
            "state": {
                "desired": desiredState
            }
        })
    };
    var iotData = new AWS.IotData({ endpoint: config.IOT_BROKER_ENDPOINT });
    iotData.updateThingShadow(paramsUpdate, function (err, data) {
        if (err) {
            console.log("Error updating thing shadow" + err);
        } else {
            console.log("updated thing shadow " + config.IOT_THING_NAME + ' to state ' + paramsUpdate.payload);
        }
    });
}
function handleSwitchIntentRequest(callback) {
    var AWS = require('aws-sdk');
    AWS.config.region = config.IOT_BROKER_REGION;
    var params = {
        "thingName": config.IOT_THING_NAME
    };
    var iotData = new AWS.IotData({ endpoint: config.IOT_BROKER_ENDPOINT });
    iotData.getThingShadow(params, function (err, data) {
        var speechOutput;
        if (err) {
            console.log("Error updating thing shadow" + err);
            speechOutput = 'Sorry, there is an error';
        } else {
            var payload = JSON.parse(data.payload.toString());
            if (payload.state.reported.switch != null) speechOutput = "The switch is " + payload.state.reported.switch;else speechOutput = 'Sorry, the switch state is undefined';
        }
        var cardTitle = 'Switch';
        var shouldEndSession = true;
        callback({}, buildSpeechletResponse(cardTitle, speechOutput, null, shouldEndSession));
    });
}
exports.handler = function (event, context, callback) {
    try {
        console.log("event.session.application.applicationId=" + event.session.application.applicationId);
        if (event.session.new) {
            onSessionStarted({ requestId: event.request.requestId }, event.session);
        }
        if (event.request.type === 'LaunchRequest') {
            onLaunch(event.request, event.session, function (sessionAttributes, speechletResponse) {
                callback(null, buildResponse(sessionAttributes, speechletResponse));
            });
        } else if (event.request.type === 'IntentRequest') {
            onIntent(event.request, event.session, function (sessionAttributes, speechletResponse) {
                callback(null, buildResponse(sessionAttributes, speechletResponse));
            });
        } else if (event.request.type === 'SessionEndedRequest') {
            onSessionEnded(event.request, event.session);
            callback();
        }
    } catch (err) {
        callback(err);
    }
};
```

Now we have created the Alexa Skill, Lambda function, and IoT Thing. Let�s perform a test of the whole system without connecting our Raspberry yet.



