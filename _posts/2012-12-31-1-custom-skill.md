---
title: '1. Create your Custom Skill'


layout: nil
---


### Creation of the Alexa Skill

In order to link Alexa to your AWS Device, we'll need to write a skill.  Let's start by logging into your developer account at  [Alexa Skill Kit Developer Console]( https://developer.amazon.com/alexa/console/ask).

 ![alt text](/assets/01 - Amazon developer console.png)

Clink on the blue button **"Create Skill"** button to get started. You will see the following page:

 ![alt text](/assets/02 - Create skill.png)
 
Enter the Skill name. I selected *"AWS IoT Skill"* but you can choose whatever you'd like. You can leave the skill setting on **"Custom model"**.  After your skill name is input, click on **"Create Skill"**. You will be redirected to the following "build" page.


 ![alt text](/assets/03 - Create skill 2.png)
Now, we're ready to build our skill. It looks complex, but we've broken it down into easy to follow steps below.  Let's get started!

Click on the **"Invocation"** link to define the *key words* you'll need to say to Alexa in order to access your skill. You can choose the name shown here, or make up your own - later, if you're having trouble invoking the skill, you can always come back and edit the name to something a little easier for Alexa to understand.
 ![alt text](/assets/04 - Invocation name.png)


Now that we're able to invoke our skill, we need to define what the skill can *do*.  Click on the **"Intents (4)"** link and you'll see 3 required intents *"AMAZON.StopIntent"*, *"AMAZON.HelpIntent"*, *"AMAZON.CancelIntent"*, and one Built-in intent *"AMAZON.FallbackIntent"*. You can read more about them [here.](https://developer.amazon.com/docs/custom-skills/standard-built-in-intents.html)

So far, we need to know that we should keep the required intents and can delete the Fallback intent by clicking on **"Delete"** in the *AMAZON.FallbackIntent* line.

Now, click on a blue button **"+ Add intent"**. As we're going to control some LEDs connected to the Raspberry Pi GPIOs, let�s call it *"LEDControlIntent"*. Also, we want to know the state of the switch, connected to the same Raspberry Pi, thus let�s create another intent and call it *"SwitchCheckIntent"*, after creating *"LEDControlIntent"* (see page below).

 ![alt text](/assets/05 - Addinig intents.png)  
 
Click on the blue button **"Create custom intent"** to get to the following page.

  ![alt text](/assets/06 - Adding LEDControlIntent.png) 
  
Scroll down until you see **"Intent Slots"**.

  ![alt text](/assets/07 - Intents created.png)  
  
Intent slots represent the variable part of the phrase. Let�s say we�re going to control three LEDs � *red*, *green*, and *blue*. Each LED has two states � *ON* and *OFF*. So we need two slots � one for LED color, other for LED state. So let�s now create two slots � *color* and *state*:
 ![alt text](/assets/08 - Intent slots.png)
 
But this is not all; we need to define slot types. Our slot types will be custom: one will contain three positions � *"red"*, *"green"*, *"blue"*, and the other will contain two positions � *"on"* and *"off"*. To do this, click on the link **"Slot types (0)"** in the left part of the page. You will see the following page.
![alt text](/assets/09 - Add intent slots.png)  
Click on the blue button **"+ Add Slot Type"**. And type the name of the first Slot Type. I selected *LED_COLOR*.
 ![alt text](/assets/10 - Slot types.png)   
Click on the blue button **"Create custom slot type"** and add three *Slot Values* � *"red"*, *"green"*, *"blue"*. You will have the following:
  ![alt text](/assets/11 - Add slot types.png)
Now, add the second slot type *LED_STATE* and its values *"on"* and *"off"* with the same sequence:
   ![alt text](/assets/12 - Add slot values.png)
Now we need to use our slot types. To do this, click on the **"LEDControlIntent"** in the left part of the page and scroll down. From the drop-down list of **"SLOT TYPE"** select *LED_COLOR* for *"color"* and *LED_STATE* for *"state"*:
 ![alt text](/assets/13 - Add slot values 2.png)
 ![alt text](/assets/14 - Add SLOT TYPE to color.png)
We don�t need a slot for the switch state, as there is no variable part of the phrase.
![alt text](/assets/15 - SLOT TYPES added.png)  
Now, scroll up to the top of the page. We need to fill the **"Sample Utterances"** field. It is very important part with represents the phrase that Alexa will recognize and do. For instance, to control the LED we can say "turn on the red LED", or "turn the green LED off", or "switch the blue LED on". When asking about the switch state, we can say "what is the switch state?", "is the switch on?" etc. We should write in here all the cases in the corresponding intents using previously created slot names putting them into the braces. For the *LEDControlIntent* it will look like this:

![alt text](/assets/16 - Sample utterances for color.png)
For the *SwitchCheckIntent* it will look like this:
![alt text](/assets/17 - Sample utterances for switch.png)
You can invent your own variants - whatever makes sense for your application. After you finish, press the **"Save Model"** button to save the changes.
We�ve almost finished but we need to add the *ARN name* of *AWS Lambda function* to complete the setup of the Alexa Skill. So let�s now switch to the Lambda function creation and then return to this page. Thus don�t close it.


