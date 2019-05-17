---
title: '12. Update Skill Lambda code to connect to AWS IoT'


layout: nil
---
### Lambda function code
Let's return to the Lambda function page for index.js. We need to update our function with the proper 
```javascript
var config = {};
config.IOT_BROKER_ENDPOINT = "xxxxxxxxxxx.iot.us-east-1.amazonaws.com";
config.IOT_BROKER_REGION = "us-east-1";
config.IOT_THING_NAME = "Raspberry_Pi_LED_Thing(USE YOUR UNIQUE NAME HERE)";
```
The variable `IOT_BROKER_ENDPOINT` contains the recently copied URL of your IoT device, so please insert your own URL there. `IOT_BROKER_REGION` is the region we selected when creating the IoT Thing and Lambda function. It should be **"us-east-1 (N. Virginia)"**. `IOT_THING_NAME` is the name of the IoT thing that you used.

And that's it for now! Let's set up IoT 



