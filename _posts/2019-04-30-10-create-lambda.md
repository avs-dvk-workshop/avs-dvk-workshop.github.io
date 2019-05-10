---
title: '10. Create a Lambda function'


layout: nil
---

### Creation of the Lambda function

Lambda function is the special service of Amazon which is stored on the server and is invoked when some event occurs. Our goal is to invoke our Lambda function when we call previously created Alexa Skill and make it do some useful thing, like update the state of our Raspberry Pi.

1.	First, register at the Amazon AWS console, it can take some time and requires entering your financial information, so be ready for this.  Once you've registered, come back and use [this link](https://console.aws.amazon.com/lambda) again. 

2.	When you open the title page, make sure to select **US East (N.Virginia)** in the drop-down list in the upper right hand corner. Some other regions have restrictions and your Lambda function won't work correctly:
![alt text](/assets/18 - Selecting region for Lambda function.png)  3.	Now, click on the orange button **"Create Function"** and proceed to the next page:
![alt text](/assets/19 - Creating new lambda function.png) 
Select **"Author from scratch"** option, as we will create our own function. Type the name of the function, I selected *"RaspberryPi_LED_Control"* but you can choose your own. Leave the Runtime as **"Node.js 6.10"** � we will write our function in this language. Then scroll down to the Role field and select **"Create a custom role"**. When you do this, you will be redirected to the following page:
![alt text](/assets/20 - Creating custom role.png)  
Now expand the **"Services"** in the top left corner and select **IAM** there:
![alt text](/assets/21 - Expanding Amazon services.png)  
In the page that comes up, select **"Roles"** on the left part of the page:
![alt text](/assets/22 - Selecting Roles.png)  
And click **"Create role"**. You will see the following page:
![alt text](/assets/23 - Creating new role.png) 
In the **"Select type of the trusted entity"** leave it as the default selection of *"AWS service"*. In the field **"Choose the service that will use this role"** select *"Lambda"*. Then click on the blue button **"Next: Permissions"**. Search and select the policies *"AWSIoTDataAccess"* and *"AWSLambdaBasicExecutionRole"* to attach them to the role. This will allow us to read and write to the AWS IoT shadow and write logs via CloudWatch. After that click on the blue button **"Next: Review"**.

In the opened page enter the role name. I selected *"lambda_iot_role"*, you can select your own name. Leave everything else without changes and click on the blue button **"Create role"**.
![alt text](/assets/24 - Adding permission policies to role.png)   

Now return to the Lambda function creation page, and you may need to refresh the page for it to update. Once it�s refreshed, you can select *"Choose an existing role"* in the field **"Role"**. If you had to refresh your page, you�ll need to type in the name again. And then select our recently created role *"lambda_iot_role"* in the field **"Existing role"**:
![alt text](/assets/25 - Finalizing role creation.png)    
Finally, click on the orange button **"Create function"**.

4.	Now let�s setup our function. 
![alt text](/assets/26 - Selecting created role and finalizing creation of lambda function.png)    
First, we need to add a trigger which will invoke the function. As it will be called by an Alexa Skill, let�s select *"Alexa Skill Kit"* in the **"Add trigger"** list in the left part of the page:
![alt text](/assets/27 - Lambda function setup.png)    
It requires some configuration (as is mentioned in the blue rectangle). Scroll down and see the following fields:
![alt text](/assets/28 - Lambda function add trigger.png)  
Leave **"Skill ID verification"** as *"Enabled"* but we need the *skill ID*. Also, we will need to pass the *Lambda function ARN* to the recently created Skill. Scroll up to the top of the page and find the function ARN in the top right:
![alt text](/assets/29 - Lambda function enabling trigger.png)   
Copy it and return to the Alexa Skill page. Find **"Endpoint"** in the menu on the left part of the page and select it. You will see the following page:
![alt text](/assets/30 - Lambda function ARN.png) 
Select *"AWS Lambda ARN"* and paste the Lambda function ARN into the field **"Default region"**. Also copy the **"Your Skill ID"** value as you�ll need it in the Lambda page. 
![alt text](/assets/31 - Alexa Skill endpoint.png) 
Return to the Lambda function page and paste *Skill ID* in the appropriate field:
![alt text](/assets/32 - Copying skill ID.png)    
Then click **Add**. Then scroll to the top of the page and click orange button **"Save"** in the top right of the page. 

5.	Let�s now finish configuration of our Skill. Return to the Alexa Skill page, scroll to the top of the page and click **"Save Endpoints"**. If there are no mistakes, the corresponding message will appear:
![alt text](/assets/33 - Inserting skill ID to the lambda function.png)   
Now select **"Invocation"** in the menu at the left side of the page and use the **"Save model"** and **"Build model"** buttons in that order. The last action can take some time, so don�t worry about it. If there are no mistakes, you will see the following message finally: 
![alt text](/assets/34 - Alexa skill saving endpoints.png) 

![alt text](/assets/35 - Alexa skill building model.png) 

And with that, we�ve finished creation of the Alexa Skill! We will test it after we complete the Lambda function. Let�s first create the IoT device before writing the code for the Lambda function as we will need some data from it.




