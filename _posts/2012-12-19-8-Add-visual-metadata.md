---
title: '8. Add Visual Meta-data using Display Cards'


layout: nil
---

### Enable Display Cards on your Device Profile

If your Alexa-enabled device has a screen capable of displaying graphics or text, you can add visual metadata (Display Cards) to your responses from Alexa.  You'll need to register your product according to its capability in order to get this data from the AVS.

Navigate back to your developer portal at [developer.amazon.com](https://developer.amazon.com/login.html).  Select "manage" on your device, and navigate to the **capabilities** tab under **Details and management**.  Check the box for **Display Cards** and choose **Display Cards with Media** from the list.  Click **Update** to save your changes.  You should get a pop-up confirming your change was successful.

![DisplayCards](assets/DisplayCards.png)

Now, restart your Sample App and ask **"Alexa, play NPR on TuneIn"**.  Scroll up through the logs and you should see a **RenderPlayerInfoCard** - this is the visual metadata delivered along with your response from Alexa.  Copy the URL into a browser window and you'll see the image that would be displayed if your device has a screen with graphics capability.

![DisplayCards](assets/DisplayCards_NPR.png)

Try asking Alexa what the weather is - you should see a much more complex **RenderPlayerInfoCard** displayed, with lots of different URLs for graphics.  For this workshop, you can copy and paste the URLs to look at each one individually in your web browser - for your product, you can leverage the SDK's new **TemplateRuntime** capability agent to parse this for you!  

