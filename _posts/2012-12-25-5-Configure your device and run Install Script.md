---
title: '5. Run the Setup and Install Script'


layout: nil
---

{:.steps}
### Configure your device and run the Install Script

> **NOTE:** For the purposes of this workshop, portions of the SDK have been pre-compiled to save time.  

Your device needs to authenticate your unique information with the cloud in order to activate Alexa.  To start the setup and install script, do the following steps on your Raspberry Pi:

1. Open a terminal window by clicking on the black console icon on the toolbar, located at the top-left corner of your Pi's desktop.
2. You'll need to start the installation script to input your developer credentials.  The terminal should come up in the /home/pi directory.  In the terminal window, type: 
`sudo bash install_avs_sdk.sh`.  You'll be prompted for your **ProductID** (no spaces), **ClientID**, and **Client Secret**.  Copy and paste these from your developer page, making sure you don't miss any characters or add any spaces.  Remember, your ProductID is not the same as your AmazonID!  
![](assets/InstallScript.png)
3. Check the confirmation printout of your credentials and hit "y" to continue.  Lots of messages and warnings will roll by - just continue on.
4. A browser window will open to request a **Refresh token** for your device - **if your login is not working, open a new browser window and type http://localhost:3000 into the new browser, then login!** this token is what allows your device to access the AVS in the cloud by authenticating with **Login with Amazon** (LWA).  If you shipped a million Alexa-enabled products to your customers, each device could use the same ProductID, ClientID, and Client Secret - but each individual device would require its own unique **Refresh Token**.  Normally, the end user would get the refresh token when activating your product through their companion app, but for the purposes of this lab, you'll be the customer as well as the manufacturer.
![](assets/TokenSuccess.png)
5. If your refresh token isn't successfully delivered, you can try opening a 2nd browser window and manually go to http://localhost:3000.  Note that the script must be running when you open the page!  Also be sure to double-check your ProductID was entered correctly (no spaces).

{:.verify}
### Checkpoint 5

1. Click on the folder icon on the top left corner of your screen to open a File Explorer window if you don't already have one open.  Navigate to */home/pi/sdk-folder/sdk-build/Integration* and right click on the **AlexaClientSDKConfig.json** file, then select text editor to view the contents.  You should see your developer credentials listed under the `authdelegate` section.  Ensure that the **"refreshToken"** field is populated - it should be a very long string of characters.
![](assets/JSONcheck.png)
