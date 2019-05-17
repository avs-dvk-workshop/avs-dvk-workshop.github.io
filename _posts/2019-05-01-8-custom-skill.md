---
title: '8. Create your Custom Skill'


layout: nil
---


### Creation of the Alexa Skill

In order to accept commands and controls from Alexa, we'll need to write a skill. Alexa skills let you add your own content and functionality to Alexa. Skills are a great way to engage with customers through a voice interface (VUI) and you can learn all about them on your own time at (https://developer.amazon.com/alexa-skills-kit).

For today, let's start by logging into your developer account at  [Alexa Skill Kit Developer Console]( https://developer.amazon.com/alexa/console/ask).

 ![alt text](/assets/01 - Amazon developer console.png)

Clink on the blue button **"Create Skill"** button to get started. You will see the following page:

 ![alt text](/assets/02 - Create skill.png)
 
Enter the Skill name. I chose *"AWS IoT Skill"* but you can choose whatever you'd like. You can leave the skill setting on **"Custom model"** and under the **"Choose a method to host your skill's back end resources"**, keep the default selection of **"Provision Your Own"**. Click on **"Create Skill"**. Keep the **"Start from scratch"** selected. You will be redirected to the following "build" page.

 ![alt text](/assets/03 - Create skill 2.png)

Now, we're ready to build our skill. It looks complex, but we've broken it down into easy to follow steps below.  Let's get started!

Click on the **"Invocation"** link to define the *key words* you'll need to say to Alexa in order to access your skill. Let's choose the name "my raspberry" for the skill name. Later, if you're having trouble invoking the skill or want to change the name, you can always come back and edit the name to something else.
 ![alt text](/assets/04 - Invocation name.png)


Now that we're able to invoke our skill, we need to define what the skill can *do*. We are going to import our "interaction model", which defines how we understand what a customer would say to our skill. On the left side, click on the "JSON Editor" button. Delete the JSON from the editor, then copy the JSON from the following URL and paste it in: [https://raw.githubusercontent.com/avs-dvk-workshop/avs-dvk-workshop.github.io/master/assets/skill/interactionModel.json]( https://raw.githubusercontent.com/avs-dvk-workshop/avs-dvk-workshop.github.io/master/assets/skill/interactionModel.json). Hit "Save" and then "Build Model"

![alt text](/assets/05 - Upload Interaction Model.gif)  

So what did we do? On the left side of the intents you will see that we now have 7 total intents. Intents are an action that the customer would take using your skill. You can learn more at the following link: (https://developer.amazon.com/docs/custom-skills/create-the-interaction-model-for-your-skill.html#about-intents-slots-and-dialogs). For our workshop, we have created two Intents:

* **LEDControlIntent** which will turn our LEDs on or off
* **SwitchCheckIntent** which will check the status of our switch button.

Since we are going to be using 3 different LEDs (green, red, blue) and we have two different statuses for the LEDs, we need **slots** to set as variables when passing values to our back end logic. Scroll down on the left side and note that we have two different slot types:

* **LED_COLOR** which has values of blue, green, and red
* **LED_STATE** which has values of on and off

So we have the commands and some values, but how do we then hook that into an actual voice model? That's where the **sample utterances** come into play.

Click on the *LEDControlIntent*, you should see something like the following:

![alt text](/assets/16 - Sample utterances for color.png)

Note how we have different combinations of what a user might say to trigger a change in color to the LED. Are there any other phrases a user might say to control the light? Try adding a few additional utterances.

Similar with the *SwitchCheckIntent* it will look similar to this this:

![alt text](/assets/17 - Sample utterances for switch.png)

You can invent your own variants - whatever makes sense for your skill. After you finish, press the **"Save Model"** button to save the changes and **"Build Model"** for those to take effect on the skill.

We've almost finished but we need to add the *ARN name* of *AWS Lambda function* to complete the setup of the Alexa Skill. So let's now switch to the Lambda function creation and then return to this page. Thus don't close it.


