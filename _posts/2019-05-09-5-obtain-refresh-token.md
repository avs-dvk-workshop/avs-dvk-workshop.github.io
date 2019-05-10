---
title: '5. Run the Install Script'


layout: nil
---


### Run the Install Script

You are now ready to run the install script. This will install all dependencies, including the **Wake Word Engine** (WWE) from Sensory.  The WWE compares incoming audio to an onboard model of a wake word (**"Alexa"**) and will initiate the transmission of audio to the cloud when triggered.  Note that this WWE is provided for **prototyping purposes only** and would need to be licensed for a commercial device.  The AVS Device SDK is modular and flexible. When you're ready to build your product, you can choose any WWE you prefer. Remember that for AVS products, the wake word must be **Alexa** so that your customers aren't confused about how to interact with your device.

To run the install script, open a **terminal** by clicking on the console window in the Pi's toolbar in the upper-left corner of the screen (or just use your existing terminal window). You should see a **setup.sh** script in your */home/pi/* directory. This pulls the credentials from your **config.json** file to run the install script. To launch the setup script, copy and paste the following command into your terminal window and hit return:


```
cd /home/pi/
sudo bash setup.sh config.json -m /home/pi/Smart-screen-sdk-test/
```


![run_script](../assets/configTerm.png)


Type **"AGREE"** when it prompts you to accept the licensing terms from our third-party libraries.  Unless, of course, you disagree!

This will kick off the installation process which could normally take over 20 minutes, but for reInvent we've precompiled the image to save you some time.  

Once you've finished compiling, you should see a success screen.  If your device freezes up - don't worry, just restart by unplugging your Pi's power cord.  When you get back to your desktop, re-run the above setup.sh command to finish your install.


Now you just need to launch the sample app and get a refresh token from AVS so your device can authenticate with the cloud via Login With Amazon (LWA).  








