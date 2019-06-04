---
title: '9. Create a Lambda function'


layout: nil
---

### Creation of the Lambda function

Lambda function are computing on demand which is stored on the server and is invoked when some event occurs. Our goal is to invoke our Lambda function when we call previously created Alexa Skill and make it do some useful thing, like give a voice response and eventually update the state of our Raspberry Pi.

1.	First, if you haven't already, register at the Amazon AWS console, it can take some time and requires entering your financial information, so be ready for this.  Once you've registered, come back and use [this link](https://console.aws.amazon.com/lambda) again. 

2.	When you open the title page, make sure to select **US East (N.Virginia)** in the drop-down list in the upper right hand corner. Some other regions have restrictions and your Lambda function won't work correctly:
![alt text](/assets/18 - Selecting region for Lambda function.png)  3.	Now, click on the orange button **"Create Function"** and proceed to the next page:
![alt text](/assets/19 - Creating new lambda function.png) 
Select **"Author from scratch"** option, as we will create our own function. Type the name of the function, I selected *"RaspberryPi_LED_Control"* but you can choose your own. Leave the Runtime as **"Node.js 10.x"** ' we will write our function in this language. Click on the orange button **"Create function"**. (Note that if it the *"Execution role"* dropdown appears, you want to have the *"Create a new role with basic Lambda permissions"* selected)

3.	Now let's setup our function. First, since Lambda functions are run "on-demand", they need a *"trigger"* to invoke the function execution. As it will be called by an Alexa Skill, let's select *"Alexa Skill Kit"* in the **"Add trigger"** list in the left part of the page:
![alt text](/assets/27 - Lambda function setup.png)    
It requires some configuration (as is mentioned in the blue rectangle). Scroll down and see the following fields:
![alt text](/assets/28 - Lambda function add trigger.png)  
Leave **"Skill ID verification"** as *"Enabled"* but we need the *skill ID*. Also, we will need to pass the *Lambda function ARN* to the recently created Skill. Scroll up to the top of the page and find the function ARN in the top right:
![alt text](/assets/29 - Lambda function enabling trigger.png)   
Copy it and return to the Alexa Skill page. Find **"Endpoint"** in the menu on the left part of the page and select it. You will see the following page:
![alt text](/assets/30 - Lambda function ARN.png) 
Select *"AWS Lambda ARN"* and paste the Lambda function ARN into the field **"Default region"**. Also copy the **"Your Skill ID"** value as you'll need it in the Lambda page. 
![alt text](/assets/31 - Alexa Skill endpoint.png) 
Return to the Lambda function page and paste *Skill ID* in the appropriate field:
![alt text](/assets/32 - Copying skill ID.png)    
Then click **Add**. Then scroll to the top of the page and click orange button **"Save"** in the top right of the page. 

4.	Let's now finish configuration of our Skill. Return to the Alexa Skill page, scroll to the top of the page and click **"Save Endpoints"**. If there are no mistakes, the corresponding message will appear:
![alt text](/assets/33 - Inserting skill ID to the lambda function.png)   
Now select **"Invocation"** in the menu at the left side of the page and use the **"Save model"** and **"Build model"** buttons in that order. The last action can take some time, so don't worry about it. If there are no mistakes, you will see the following message finally: 
![alt text](/assets/34 - Alexa skill saving endpoints.png) 
![alt text](/assets/35 - Alexa skill building model.png) 
And with that, we've finished creation of the Alexa Skill! We will test it after we complete the Lambda function. 

5. Go back to your Lambda function, let's add some code to handle the different utterances and intents coming from our skill! 
First, let's download a zip file that contains some starter code, download the following zip: [https://github.com/avs-dvk-workshop/avs-dvk-workshop.github.io/blob/master/assets/skill/VoiceControlWorkshop-Skill.zip?raw=true](https://github.com/avs-dvk-workshop/avs-dvk-workshop.github.io/blob/master/assets/skill/VoiceControlWorkshop-Skill.zip?raw=true)
Under the "Function Code" section of the Lambda screen, you should see a dropdown for **"Code entry type"**, click that dropdown and choose **Upload a zip file**. You'll then click the **"Upload"** button and choose the *VoiceControlWorkshop-Skill.zip* file you just downloaded. Click **"Save"** in the upper-right corner of the screen and you should see your function populated!
![alt text](/assets/35 - Lambda Code Upload.gif).

6. Scroll down on the page until you see the **"Basic Settings"** section on the right side and update the timeout from **"3"** to **"8"** seconds. 
![alt text](/assets/35 - Lambda Timeout Settings.png).

7. Now let's test it! 
At the top of the page you'll see a **"Test"** button. Click that and it will ask you to configure a test event. From the dropdown of the Event template, choose **"Amazon Alexa Start Session"**. Give it a name like **startSession**, scroll down and click **Create**.
![alt text](/assets/35 - createTestEvent.gif).
Click the **"Test"** button and then the arrow next to **Details** in order to see the actual response. It should look something like the below image:
![alt text](/assets/35 - runTestFunction.gif).