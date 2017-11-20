---
title: '3. Create a Device & Security Profile'


layout: nil
---

{:.steps}
### Register Your Product and Create a Security Profile

After you've registered for an Amazon developer account, you'll need to create an Alexa device and security profile. This will enable your client to connect to the Alexa Voice Service in the cloud.

1. Login to Amazon Developer Portal - [developer.amazon.com](https://developer.amazon.com/login.html)
2. Click on Alexa tab, and then click on Get Started button under Alexa Voice Service.
   ![](assets/avs-navigation-new.png)
3. If this is your first time using AVS, then you will get a welcome screen. Click on the **GET STARTED** button. If you have already used AVS before, then instead click the **Create Product** button.

{:.tab}
#### Device Type Info

1. **Product Name**: the display name in the developer portal, as well as the name that will be provided to your users when they register the product with Amazon.
2. **Product ID**: provide a simple identifier for your product. **No spaces.**
3. Select **Device** for *Is your product an app or a device?*
4. Select **No** for *Will your device include a companion app?*
5. Choose a product category, any category will work, and add a description.
6. Select **Far-field** for *How will users interact with your product?*
7. Image: Right click on this link to save this test image to your computer (or use your own), then upload it:   [https://developer.amazon.com/public/binaries/content/gallery/developerportalpublic/solutions/alexa/alexa-voice-service/images/reference-implementation-image.png](https://developer.amazon.com/public/binaries/content/gallery/developerportalpublic/solutions/alexa/alexa-voice-service/images/reference-implementation-image.png)
8. Select **No** for *Do you intend to distribute this product commercially?*
9. Select **No** for *Is this a children’s product or is it otherwise directed to children younger than 13 years old?*
10. Click **Next**

{:.tab}
#### Security Profile

1. Click on the **CREATE NEW PROFILE** link.
	 ![](assets/avs-create-new-security-profile.png)

2. Enter the following   
	 - **Security Profile Name**: Alexa Voice Service Sample App Security Profile
	 - **Security Profile Description**: Alexa Voice Service Sample App Security Profile Description
	 - Click **Next**.  

   **Note:** These are suggested values. You provide custom information for **Security Profile Name** and **Security Profile Description**.

	 Client ID and Client Secret will be generated for you.

3. Select **Web** from the Web - Android/Kindle - iOS options under **Security Profile ID** in the **Security Profile** section.
	 - In the **Allowed Return URLs** enter **http://localhost:3000/authresponse** in the text field and then click the **ADD** button.  This will allow AVS to deliver a *refresh token* to your device, enabling it to connect to the AVS in the cloud.
   - In the **Allowed Origins** enter **http://localhost:3000** in the text field and then click the **ADD** button.  This will allow your client to request the refresh token from the cloud.
   - Check the box beside *I agree to the AVS agreement and the AVS Program Requirements*
	 - Click **Finish**.

{:.verify}
### Checkpoint 3
1. Ensure that your device is now listed in the AVS dashboard [https://developer.amazon.com/avs/home.html#/avs/home](https://developer.amazon.com/avs/home.html#/avs/homes)
2. Click the **manage** link next to your device in the AVS dashboard.
3. Click the **Security Profile** in the left navigation under the *Details and management* section.
4. Verify that *http://localhost:3000/authresponse* is listed under **Allowed Return URLs**.
5. Verify that *http://localhost:3000* is listed under **Allowed Origins**.
