---
title: '3. Create a Device & Security Profile'


layout: nil
---
### Creation of the IoT device
First, I would recommend creating the IoT device on the Raspberry Pi you are going to use. This is recommended due to the necessity of saving some files from the AWS site. These files appear just during registration, so don�t miss them. 
With that, let�s go. 

1.	First, open the [IoT console](https://console.aws.amazon.com/iot) in your browser 

2.	Select the same region **US East (N. Virginia)** as we selected for the Lambda function:
![alt text](https://fs1.fex.net/show/168099638686/702626615/ba30c23d/36%20-%20IoT%20device%20selecting%20region.png?1600w,0 "IoT device selecting region") 

3.	In the left part of the page select **"Manage"** point. You will see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626629/aab0271e/37%20-%20IoT%20device%20manage%20point.png?1600w,0 "IoT device Manage point") 
Click on the blue button **"Register a Thing"**. In the next page select **"Create a single thing"** in the top or in the bottom:
![alt text](https://fs1.fex.net/show/168099638686/702626636/9bed87d8/38%20-%20Registering%20a%20new%20Thing.png?1600w,0 "Registering a new Thing")  
In the following window you need to enter the name of your thing. I selected *"Raspberry_Pi_LED_Thing"*, but you can choose any name you want.
![alt text](https://fs1.fex.net/show/168099638686/702626644/0aa99f98/39%20-%20Calling%20new%20Thing.png?1600w,0 "Naming new Thing")   
Then scroll down and click on the blue button **"Next"** leaving everything else unchanged. You will see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626653/17474f56/40%20-%20Continue%20creating%20Thing.png?1600w,0 "Continue creating new Thing")    
Click the top blue button **"Create certificate"**. You will see the following window:
![alt text](https://fs1.fex.net/show/168099638686/702626663/dcdba984/41%20-%20Creating%20new%20certificate.png?1600w,0 "Creating new certificate")     
Now, be very careful. You need to download and save these three files somewhere on your Raspberry Pi. Create a folder *"certificates"* (as an example) and save files there. In the same folder create the new file and call it *"root-ca.crt"*. Click on the link at the **"A root CA for AWS IoT Download"**. You will get a choice of different certificates - this is up to you, but for the purposes of this tutorial, select the first one, **"RSA 2048 bit key"**.  You will then see the certificate content:
![alt text](https://fs1.fex.net/show/168099638686/702626677/96b42027/42%20-%20Root%20certificate%20content.png?1600w,0 "Root certificate content")  
Copy it and paste into *root-ca.crt* file you�ve created. Then return to the previous page. These files will be used to identify and securely connect to your IoT thing, in our case Raspberry Pi.
Click on the blue button **"Activate"**. And then **"Attach a policy"**. In the next page it will warn you that there are no policies in your account. So, click on the button **"Register Thing"**, we will create and attach a policy later.
![alt text](https://fs1.fex.net/show/168099638686/702626683/d208be9c/43%20-%20Registering%20Thing.png?1600w,0 "Registering Thing")   
You will see the created thing:
![alt text](https://fs1.fex.net/show/168099638686/702626692/c3ab6e54/44%20-%20Newly%20created%20Thing.png?1600w,0 "Newly created Thing")  

4.	Now it�s time to create a policy and gather all things together. Select the point **"Secure"** in the left menu and then **"Policies"** in the submenu. You will see the following:
![alt text](https://fs1.fex.net/show/168099638686/702626700/401b10d1/45%20-%20Selecting%20policy%20submenu.png?1600w,0 "Selecting Policy submenu")   
Click the blue button **"Create a policy"** to see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626706/e9dce1df/46%20-%20Creating%20a%20policy.png?1600w,0 "Creating a policy")  
We need to select the name for our policy - I selected *iot_policy*. In the field **"Action"** write `iot:*`, and in the box **Resource ARN** write `*`. Select *"Allow"* in the field **"Effect"**. This should look like the following:
![alt text](https://fs1.fex.net/show/168099638686/702626727/21f3b47b/47%20-%20Adding%20statements%20to%20the%20policy.png?1600w,0 "Adding statements to the policy")  
Scroll down and click the blue button **"Create"**. You will see a successfully created policy:
![alt text](https://fs1.fex.net/show/168099638686/702626732/8e56e1b5/48%20-%20Finalizing%20creation%20of%20the%20policy.png?1600w,0 "Successfully created policy")   
Now select the point **"Certificates"** in the left menu. You will see your recently created certificate there. I have several, so my page looks like this, but you will probably only have one. If you have multiple, use the certificate you created for this IoT device.
![alt text](https://fs1.fex.net/show/168099638686/702626749/e725d5ff/49%20-%20Certificates%20page.png?1600w,0 "Certificates page")    
Click on your certificate to see the following page:
![alt text](https://fs1.fex.net/show/168099638686/702626762/8963ce51/50%20-%20Selecting%20required%20certificate.png?1600w,0 "Selecting required certificate")    
**_You will have your own numbers_**, this is expected and would be bad if they�re not different. Now select the **"Actions"** in the top right and in the drop down list select **"Attach policy"**:
![alt text](https://fs1.fex.net/show/168099638686/702626776/cddb2780/51%20-%20Attaching%20policy%20to%20the%20certificate.png?1600w,0 "Attaching the policy to the certificate") 
Select your **"iot_policy"** and click on the button **"Attach"**:
![alt text](https://fs1.fex.net/show/168099638686/702626782/4c4755d2/52%20-%20Attaching%20policy%20to%20the%20certificate%202.png?1600w,0 "Attaching the policy to the certificate") 
Now make sure that policy and thing are attached to the certificate. Select first **"Policies"** and then **"Things"** in the left menu to see your Policy and Thing.
If everything is OK, click on the **"<-"** button in the top left and return to the previous menu.

And we�re done with this portion!  That is all we need to do to make the Thing. 
Now we need to copy the thing�s URL so we can address it using our Lambda function. To find it, return to the menu point **Manage** and submenu **Thing** in the left part of the page.
![alt text](https://fs1.fex.net/show/168099638686/702626794/c0100cfa/53%20-%20Things%20page.png?1600w,0 "Things page") 
Click on your Thing and select the **"Interact"** point in the left menu.
![alt text](https://fs1.fex.net/show/168099638686/702626805/a7d1d76f/54%20-%20Copying%20the%20IoT%20thing%20address.png?1600w,0 "IoT thing address")  
Copy the URL address under the HTTPS title; we will use it very soon.
It�s time to write some code for our Lambda function.
