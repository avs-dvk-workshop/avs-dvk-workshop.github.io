---
title: '1. Create your Custom Skill'


layout: nil
---


### Creation of the Alexa Skill

In order to link Alexa to your AWS Device, we'll need to write a skill.  Let's start by logging into your developer account at  [Alexa Skill Kit Developer Console]( https://developer.amazon.com/alexa/console/ask).
Clink on the blue button **"Create Skill"** button to get started. You will see the following page:
 ![alt text](https://fs1.fex.net/show/168099638686/702626030/6e83c3b3/02%20-%20Create%20skill.png?1600w,0 "Create new skill")
Enter the Skill name. I selected *"AWS IoT Skill"* but you can choose whatever you'd like. You can leave the skill setting on **"Custom model"**.  After your skill name is input, click on **"Create Skill"**. You will be redirected to the following "build" page.
**show picture with numbered things**

 ![alt text](https://fs1.fex.net/show/168099638686/702626041/db0eda8f/03%20-%20Create%20skill%202.png?1600w,0 "Create skill")
Now, we're ready to build our skill. It looks complex, but we've broken it down into easy to follow steps below.  Let's get started!

Click on the **"Invocation"** link to define the *key words* you'll need to say to Alexa in order to access your skill. You can choose the name shown here, or make up your own - later, if you're having trouble invoking the skill, you can always come back and edit the name to something a little easier for Alexa to understand.
 ![alt text](https://fs1.fex.net/show/168099638686/702626052/1bbd1163/04%20-%20Invocation%20name.png?1600w,0 "Invocation name")


Now that we're able to invoke our skill, we need to define what the skill can *do*.  Click on the **"Intents (4)"** link and you'll see 3 required intents *"AMAZON.StopIntent"*, *"AMAZON.HelpIntent"*, *"AMAZON.CancelIntent"*, and one Built-in intent *"AMAZON.FallbackIntent"*. You can read more about them [here.](https://developer.amazon.com/docs/custom-skills/standard-built-in-intents.html)

So far, we need to know that we should keep the required intents and can delete the Fallback intent by clicking on **"Delete"** in the *AMAZON.FallbackIntent* line.

Now, click on a blue button **"+ Add intent"**. As we're going to control some LEDs connected to the Raspberry Pi GPIOs, let�s call it *"LEDControlIntent"*. Also, we want to know the state of the switch, connected to the same Raspberry Pi, thus let�s create another intent and call it *"SwitchCheckIntent"*, after creating *"LEDControlIntent"* (see page below).
 ![alt text](https://fs1.fex.net/show/168099638686/702626075/cfac757f/06%20-%20Adding%20LEDControlIntent.png?1600w,0 "Adding LEDControlIntent")  
Click on the blue button **"Create custom intent"** to get to the following page.
  ![alt text](https://fs1.fex.net/show/168099638686/702626083/66cc1c9a/07%20-%20Intents%20created.png?1600w,0 "Intents created")  
Scroll down until you see **"Intent Slots"**.
  ![alt text](https://fs1.fex.net/show/168099638686/702626093/85917e91/08%20-%20Intent%20slots.png?1600w,0 "Intent slots")  
Intent slots represent the variable part of the phrase. Let�s say we�re going to control three LEDs � *red*, *green*, and *blue*. Each LED has two states � *ON* and *OFF*. So we need two slots � one for LED color, other for LED state. So let�s now create two slots � *color* and *state*:
 ![alt text](https://fs14.fex.net/show/168099638686/702626099/756f5dbb/09%20-%20Add%20intent%20slots.png?1600w,0 "Add intent slots")  
But this is not all; we need to define slot types. Our slot types will be custom: one will contain three positions � *"red"*, *"green"*, *"blue"*, and the other will contain two positions � *"on"* and *"off"*. To do this, click on the link **"Slot types (0)"** in the left part of the page. You will see the following page.
![alt text](https://fs1.fex.net/show/168099638686/702626106/a0e7148a/10%20-%20Slot%20types.png?1600w,0 "Slot types")  
Click on the blue button **"+ Add Slot Type"**. And type the name of the first Slot Type. I selected *LED_COLOR*.
 ![alt text](https://fs1.fex.net/show/168099638686/702626112/dc5cd54b/11%20-%20Add%20slot%20types.png?1600w,0 "Add slot type")   
Click on the blue button **"Create custom slot type"** and add three *Slot Values* � *"red"*, *"green"*, *"blue"*. You will have the following:
  ![alt text](https://fs1.fex.net/show/168099638686/702626117/a20616cb/12%20-%20Add%20slot%20values.png?1600w,0 "Add slot valies")
Now, add the second slot type *LED_STATE* and its values *"on"* and *"off"* with the same sequence:
   ![alt text](https://fs1.fex.net/show/168099638686/702626126/b447d4ed/13%20-%20Add%20slot%20values%202.png?1600w,0 "Add slot valies")
Now we need to use our slot types. To do this, click on the **"LEDControlIntent"** in the left part of the page and scroll down. From the drop-down list of **"SLOT TYPE"** select *LED_COLOR* for *"color"* and *LED_STATE* for *"state"*:
 ![alt text](https://fs1.fex.net/show/168099638686/702626137/717cb7eb/14%20-%20Add%20SLOT%20TYPE%20to%20color.png?1600w,0 "Add SLOT TYPE for color")
 ![alt text](https://fs1.fex.net/show/168099638686/702626149/9e448644/15%20-%20SLOT%20TYPES%20added.png?1600w,0 "SLOT TYPEs added")
We don�t need a slot for the switch state, as there is no variable part of the phrase.

Now, scroll up to the top of the page. We need to fill the **"Sample Utterances"** field. It is very important part with represents the phrase that Alexa will recognize and do. For instance, to control the LED we can say `"turn on the red LED"`, or `"turn the green LED off"`, or `"switch the blue LED on"`. When asking about the switch state, we can say `"what is the switch state?"`, `"is the switch on?"` etc. We should write in here all the cases in the corresponding intents using previously created slot names putting them into the braces. For the *LEDControlIntent* it will look like this:
![alt text](https://fs1.fex.net/show/168099638686/702626160/aaf6bb5d/16%20-%20Sample%20utterances%20for%20color.png?1600w,0 "Sample utterances for color")  
For the *SwitchCheckIntent* it will look like this:
![alt text](https://fs1.fex.net/show/168099638686/702626171/520d3475/17%20-%20Sample%20utterances%20for%20switch.png?1600w,0 "Sample utterances for switch")
You can invent your own variants - whatever makes sense for your application. After you finish, press the **"Save Model"** button to save the changes.
We�ve almost finished but we need to add the *ARN name* of *AWS Lambda function* to complete the setup of the Alexa Skill. So let�s now switch to the Lambda function creation and then return to this page. Thus don�t close it.
Let's begin by setting up the Pi. The Raspberry Pi 3 board includes -

- 4 USB ports
- HDMI port for video output (you'll be using this to connect to your HDMI monitor)
- 3.5mm audio jack for sound output (you won't use this for this lab - you'll connect to the intel DSP)
- Micro SD card slot
- Ethernet port

{:.steps}
### Assembling Your Pi

1. Check that your micro SD card is inserted into the micro SD card slot on your Pi.  Note the contacts should face UP.
2. Connect the keyboard and mouse to the USB ports.
3. Connect your monitor using the HDMI port.
4. Connect to Ethernet if you have the option - otherwise, you can activate Wifi by clicking on the symbol in the top right corner and picking your SSID.
![wifi](/assets/wifi.png)


{:.steps}
### Assembling Your Intel Speech Enabling Developer Kit

Your Intel kit includes a **Microphone Array** board to capture audio, a **Digital Signal Processor** (DSP) board to implement audio processing algorithms, and an **Interconnect FPC** to interface your DSP board to the Raspberry Pi.  Verify that you have all the required parts before you start the assembly process.

![contents](/assets/Contents.png)

Begin by attaching your Mic Array board to the DSP board.  You should see two sets of headers on the Mic Array board that match up to the top side of the DSP board.  Align them carefully before applying even pressure to fully mate the headers together.  Make sure the two circular PCBs are concentrically aligned to each other.

![Connect Mic PCB to DSP PCB](/assets/FlipConnect.png)

![Connect Detail](/assets/AlignPress.png)

Next, you'll attach the FPC to the DSP board.  Flip your boards so that the DSP board's bottom side is accessible, and plug in the **smaller** of the two connectors from the FPC.  Ensure that you've aligned all the pins correctly before applying even pressure to fully mate the FPC to the DSP board.

![FPC to DSP](/assets/ConnectorPress.png)

Now you'll need to attach the other side of the FPC (With the larger connector) to your **Raspberry Pi**.  Flip the DSP board back over so that the FPC is coming out of the bottom of the assembly.  Line it up with the Raspberry Pi's header as shown.  Align them carefully and press the connector down until it is fully mated with the Raspberry Pi.

![Pi to FPC](/assets/PiConnect.png)

Install your speaker or earbuds into the **DSP board's** 3.5mm audio connector as shown - do **not** use the audio jack on the Raspberry Pi.  Next, you'll need to plug in power to the **USB micro** connector on the DSP board.  You should see a **blue LED** illuminate on the bottom of the DSP board indicating power is on.  Ensure your speaker is turned on - you may need to charge the battery if it isn't turning on.  You can plug in any USB Micro into the speaker's connector to charge the battery on the speaker.

![Audio and Power](/assets/AudioPowerInstallDSP.png)

Check the configuration of your kit against the picture as shown to ensure all connections are ready to go.  When you power up your Pi, you should see the ring of **white LEDs** illuminate on the Intel kit's **Mic Array** board.  Not shown in this picture is the ethernet connection.

![SetupFinished](/assets/SetupFinished.png)


{:.steps}
### Booting Your Pi

1. Plug in the power supply to the micro USB connector on the Pi.
2. Check your keyboard layout to make sure it's correct - navigate to Mouse and Keyboard Settings from the Raspberry icon on the top left corner of the screen.
![Keyboard setup](/assets/KBAM.png)
3. Open a web browser by clicking on the globe icon in the top left toolbar.

{:.verify}
### Checkpoint 1
1. Make sure you're connected to the internet and are able to navigate to [https://developer.amazon.com](https://developer.amazon.com).
2. Make sure the **Blue LED** is illuminated on the underside of your Intel kit and the **White LEDs** are lit on the Microphone Array PCB.
