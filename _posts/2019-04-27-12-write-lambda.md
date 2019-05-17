---
title: '12. Update Skill Lambda code to connect to AWS IoT'


layout: nil
---
### Update IAM Role to connect to AWS IoT

By default, most AWS services can only access themselves, primarily for security reasons. In order for your Lambda function to access AWS IoT, we need to add the permission to the existing Lambda function role. (Alternatively, we could have created a role first, but for the sake of this workshop it is a little simpler to go this route).

Now expand the **"Services"** in the top left corner and select **IAM** there:

![alt text](/assets/21 - Expanding Amazon services.png)  
In the page that comes up, select **"Roles"** on the left part of the page:

![alt text](/assets/22 - Selecting Roles.png)    
Now expand the **"Services"** in the top left corner and select **IAM** there:

![alt text](/assets/21 - Expanding Amazon services.png)  
In the page that comes up, select **"Roles"** on the left part of the page:
![alt text](/assets/22 - Selecting Roles.png)  

On the search box halfway down the screen, start typing in the name of your Lambda function (e.g. *"Rasp"*) and your role should appear

![alt text](/assets/22 - Find Existing Role.png)  

Click on the role, and then *Attach Policies*. Search and select checkbox for the policy *"AWSIoTDataAccess"* and *"AWSLambdaBasicExecutionRole"* and then click "Attach Policy". It should look like the below when you are all finished.

![alt text](/assets/23 - finished Roles.png)  

### Lambda function code

Let's return to the Lambda function page for index.js. We need to update our function with the proper endpoint information from our IoT Thing.

```javascript
var config = {};
config.IOT_BROKER_ENDPOINT = "xxxxxxxxxxx.iot.us-east-1.amazonaws.com";
config.IOT_BROKER_REGION = "us-east-1";
config.IOT_THING_NAME = "Raspberry_Pi_LED_Thing(USE YOUR UNIQUE NAME HERE)";
```

The variable `IOT_BROKER_ENDPOINT` contains the recently copied URL of your IoT device, so please insert your own URL there. `IOT_BROKER_REGION` is the region we selected when creating the IoT Thing and Lambda function. It should be **"us-east-1 (N. Virginia)"**. `IOT_THING_NAME` is the name of the IoT thing that you used.

And that's it for now! Let's set up IoT 



