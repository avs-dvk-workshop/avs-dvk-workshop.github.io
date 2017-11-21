---
title: '5. Run the Setup and Install Script'


layout: nil
---

{:.steps}
### Configure your device and run the Install Script

> **NOTE:** For the purposes of this workshop, the install has been pre-built to save time.  

To start the setup and install script, do the following steps on your Raspberry Pi:

1. Open a terminal window by clicking on the black console icon on the toolbar, located at the top-right corner of your Pi's desktop.
2. You'll need to start the installation script to input your developer credentials.  The terminal should come up in the /home/pi directory.  In the terminal window, type: 
`sudo bash install_avs_sdk.sh`.  You'll be prompted for your **ProductID** (no spaces), **ClientID**, and **Client Secret**.  Copy and paste these from your developer page, making sure you don't miss any characters or add any spaces.
![](assets/InstallScript.png)
3. Check the confirmation printout of your credentials and hit "y" to continue.
4. A browser window will open to request a **Refresh token** for your device - this is what allows your device to access the AVS in the cloud by authenticating with **Login with Amazon** (LWA).  If you shipped a million Alexa-enabled products to your customers, each device could use the same ProductID, ClientID, and Client Secret - but each individual device would require its own unique **Refresh Token**.  Input your credentials and log in - you should automatically generate the refresh token.  You can close the browser window after this step.
![](assets/TokenSuccess.png)

{:.verify}
### Checkpoint 5

1. Navigate to */home/pi/sdk-folder/sdk-build/Integration* and right click on the **AlexaClientSDKConfig.json** file.  Open it with a text editor to view the contents.  You should see your developer credentials listed under the `authdelegate` section.  Ensure that the **"refreshToken"** field is populated - it should be a very long string of characters.
![](assets/JSONcheck.png)
