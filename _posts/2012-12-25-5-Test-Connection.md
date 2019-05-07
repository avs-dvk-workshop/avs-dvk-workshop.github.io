---
title: '5. Test the ASK/Lambda/IoT connection'


layout: nil
---
### Testing the communication and cooperation between services

Let�s switch to the **Alexa Skill** page. Our skill is already saved and built. If not, please perform these operations as described earlier.
Now switch from the **"Build"** page to the **"Test"** page from the menu in the top of the page:
![alt text](https://fs1.fex.net/show/168099638686/702626850/9e39c81c/58%20-%20Test%20page%20of%20Alexa%20skill.png?1600w,0 "Test page of Alexa Skill")   
Enable the toggle **"Test is enabled for this skill"**. Now we can perform the test. You can press the microphone icon and say your request or simply type the request in the field to the left of the microphone. Let�s stick with the second option and type *"tell my raspberry to turn the red led on"*, and then press **"Enter"** on the keyboard.
If you have an error like the one in the image below, you need to increase the timeout:
![alt text](https://fs1.fex.net/show/168099638686/702626862/9c169695/59%20-%20Error%20in%20skill%20response.png?1600w,0 "Error in skill response")    
To do this, return to the **Lambda function** page and scroll down until you see the following:
![alt text](https://fs1.fex.net/show/168099638686/702626870/e6676460/60%20-%20Increasing%20lambda%20function%20timeout.png?1600w,0 "Increasing Lambda function timeout")   
Here increase timeout from 3 seconds to 5 seconds or even more and repeat your attempt.
Finally, if everything is good, you should see something like that:
![alt text](https://fs1.fex.net/show/168099638686/702626882/56289f23/61%20-%20Successful%20testing.png?1600w,0 "Successful testing")    
You can see the JSON Input � this is the request to the Lambda function, and JSON Output � this is response from the Lambda function to the Alexa Skill.
Let�s now see how invocation of this function affects the **Thing Shadow**. Let�s switch to the **IoT Thing** page and select **"Shadow"** in the menu in the left part of the page. You will see something like this:
![alt text](https://fs1.fex.net/show/168099638686/702626893/09cfff0b/62%20-%20IoT%20Thing%20Shadow.png?1600w,0 "IoT Thing Shadow")   
If you can see all of this, that means that everything was set up correctly and all Amazon services work fine. 
You also can ask Alexa about the switch state *"Alexa, ask my raspberry about the switch state"*. But unless you don�t have your Raspberry Pi set up, it will say that the state is undefined, as you can see, there is no `"switch"` key in the Shadow state yet.
Now, we need to setup our Raspberry Pi to make it read the Shadow state and change the LEDs states according to it, and also to update the shadow state when the switch changes its state.

