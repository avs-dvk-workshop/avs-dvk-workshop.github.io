---
title: '2. Create a Lambda function'


layout: nil
---

### Creation of the Lambda function

Lambda function is the special service of Amazon which is stored on the server and is invoked when some event occurs. Our goal is to invoke our Lambda function when we call previously created Alexa Skill and make it do some useful thing, like update the state of our Raspberry Pi.

1.	First, register at the Amazon AWS console, it can take some time and requires entering your financial information, so be ready for this.  Once you�ve registered, come back and use [this link](https://console.aws.amazon.com/lambda) again. 

2.	When you open the title page, make sure to select **US East (N.Virginia)** in the drop-down list in the upper right hand corner. Some other regions have restrictions and your Lambda function won�t work correctly:
![alt text](https://fs1.fex.net/show/168099638686/702626177/1b900e9e/18%20-%20Selecting%20region%20for%20Lambda%20function.png?1600w,0 "Selecting region for the Lambda function")  3.	Now, click on the orange button **"Create Function"** and proceed to the next page:
![alt text](https://fs1.fex.net/show/168099638686/702626183/d683ec32/19%20-%20Creating%20new%20lambda%20function.png?1600w,0 "Creating new Lambda function")  
Select **"Author from scratch"** option, as we will create our own function. Type the name of the function, I selected *"RaspberryPi_LED_Control"* but you can choose your own. Leave the Runtime as **"Node.js 6.10"** � we will write our function in this language. Then scroll down to the Role field and select **"Create a custom role"**. When you do this, you will be redirected to the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626197/23bbdaa9/20%20-%20Creating%20custom%20role.png?1600w,0 "Creating custom role") 
Now expand the **"Services"** in the top left corner and select **IAM** there:
![alt text](https://fs1.fex.net/show/168099638686/702626207/00f48402/21%20-%20Expanding%20Amazon%20services.png?1600w,0 "Selecting IAM at Amazon services")  
In the page that comes up, select **"Roles"** on the left part of the page:
![alt text](https://fs1.fex.net/show/168099638686/702626227/832efe1c/22%20-%20Selecting%20Roles.png?1600w,0 "Selecting roles") 
And click **"Create role"**. You will see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626252/54a4fd46/23%20-%20Creating%20new%20role.png?1600w,0 "Creating new role")  
In the **"Select type of the trusted entity"** leave it as the default selection of *"AWS service"*. In the field **"Choose the service that will use this role"** select *"Lambda"*. Then click on the blue button **"Next: Permissions"**. Search and select the policies *"AWSIoTDataAccess"* and *"AWSLambdaBasicExecutionRole"* to attach them to the role. This will allow us to read and write to the AWS IoT shadow and write logs via CloudWatch. After that click on the blue button **"Next: Review"**.

In the opened page enter the role name. I selected *"lambda_iot_role"*, you can select your own name. Leave everything else without changes and click on the blue button **"Create role"**.
![alt text](https://fs1.fex.net/show/168099638686/702626276/7ecb3ad1/25%20-%20Finalizing%20role%20creation.png?1600w,0 "Finalizing role creation")   

Now return to the Lambda function creation page, and you may need to refresh the page for it to update. Once it�s refreshed, you can select *"Choose an existing role"* in the field **"Role"**. If you had to refresh your page, you�ll need to type in the name again. And then select our recently created role *"lambda_iot_role"* in the field **"Existing role"**:
![alt text](https://fs1.fex.net/show/168099638686/702626291/5be72524/26%20-%20Selecting%20created%20role%20and%20finalizing%20creation%20of%20lambda%20function.png?1600w,0 "Selecting created role and finalizing creation of lambda function")   
Finally, click on the orange button **"Create function"**.

4.	Now let�s setup our function. 
![alt text](https://fs1.fex.net/show/168099638686/702626316/5295a331/27%20-%20Lambda%20function%20setup.png?1600w,0 "lambda function setup")    
First, we need to add a trigger which will invoke the function. As it will be called by an Alexa Skill, let�s select *"Alexa Skill Kit"* in the **"Add trigger"** list in the left part of the page:
![alt text](https://fs1.fex.net/show/168099638686/702626333/727f7316/28%20-%20Lambda%20function%20add%20trigger.png?1600w,0 "lambda function adding trigger")   
It requires some configuration (as is mentioned in the blue rectangle). Scroll down and see the following fields:
![alt text](https://fs1.fex.net/show/168099638686/702626352/6d19487e/29%20-%20Lambda%20function%20enabling%20trigger.png?1600w,0 "lambda function configuring trigger") 
Leave **"Skill ID verification"** as *"Enabled"* but we need the *skill ID*. Also, we will need to pass the *Lambda function ARN* to the recently created Skill. Scroll up to the top of the page and find the function ARN in the top right:
![alt text](https://fs1.fex.net/show/168099638686/702626426/599fa931/30%20-%20Lambda%20function%20ARN.png?1600w,0 "lambda function ARN")  
Copy it and return to the Alexa Skill page. Find **"Endpoint"** in the menu on the left part of the page and select it. You will see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626434/ec91738b/31%20-%20Alexa%20Skill%20endpoint.png?1600w,0 "Alexa skill endpoint")   
Select *"AWS Lambda ARN"* and paste the Lambda function ARN into the field **"Default region"**. Also copy the **"Your Skill ID"** value as you�ll need it in the Lambda page. 
![alt text](https://fs1.fex.net/show/168099638686/702626446/ece63f2a/32%20-%20Copying%20skill%20ID.png?1600w,0 "Copying skill ID")    
Return to the Lambda function page and paste *Skill ID* in the appropriate field:
![alt text](https://fs1.fex.net/show/168099638686/702626458/0eb579bf/33%20-%20Inserting%20skill%20ID%20to%20the%20lambda%20function.png?1600w,0 "Insreting skill ID to the Lambda function")   
Then click **Add**. Then scroll to the top of the page and click orange button **"Save"** in the top right of the page. 

5.	Let�s now finish configuration of our Skill. Return to the Alexa Skill page, scroll to the top of the page and click **"Save Endpoints"**. If there are no mistakes, the corresponding message will appear:
![alt text](https://fs1.fex.net/show/168099638686/702626581/4ebe4af9/34%20-%20Alexa%20skill%20saving%20endpoints.png?1600w,0 "Alexa Skill saving endpoints")   
Now select **"Invocation"** in the menu at the left side of the page and use the **"Save model"** and **"Build model"** buttons in that order. The last action can take some time, so don�t worry about it. If there are no mistakes, you will see the following message finally: 
![alt text](https://fs1.fex.net/show/168099638686/702626598/b3f41121/35%20-%20Alexa%20skill%20building%20model.png?1600w,0 "Alexa Skill Build Succesful") 

And with that, we�ve finished creation of the Alexa Skill! We will test it after we complete the Lambda function. Let�s first create the IoT device before writing the code for the Lambda function as we will need some data from it.




