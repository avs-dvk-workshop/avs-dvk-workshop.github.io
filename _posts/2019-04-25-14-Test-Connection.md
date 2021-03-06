---
title: '14. Test the ASK/Lambda/IoT connection'


layout: nil
---
### Testing the communication and cooperation between services

Let's switch back to the **Alexa Skill** page and go the **"Test"** page from the menu in the top of the page:

![alt text](/assets/58 - Test page of Alexa skill.png)   

This time, instead of just launching the skill, let's give a command to try to control the LED. In the skill simulator input, type *"tell my raspberry to turn the red led on"*, and then press **"Enter"** on the keyboard. 
Finally, if everything is good, you should see something like this:

![alt text](/assets/61 - Successful testing.png)    

You can see the JSON Input ' this is the request to the Lambda function, and JSON Output ' this is response from the Lambda function to the Alexa Skill.
Let's now see how invocation of this function affects the **Thing Shadow**. Let's switch to the **IoT Thing** page and select **"Shadow"** in the menu in the left part of the page. You will see something like this:

![alt text](/assets/62 - IoT Thing Shadow.png)   

If you can see all of this, that means that everything was set up correctly and all Amazon services work fine. 
You also can ask Alexa about the switch state *"Alexa, ask my raspberry about the switch state"*. But unless you don't have your Raspberry Pi set up, it will say that the state is undefined, as you can see, there is no `"switch"` key in the Shadow state yet.
Now, we need to setup the IoT software on the Raspberry Pi that will read the Shadow state and change the LEDs states accordingingly, and also to update the shadow state when the switch changes its state.

