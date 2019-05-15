---
title: '7. Talk to Alexa'


layout: nil
---

{:.steps}
### Interact with Your Prototype

Say "Alexa" into the microphone on your Raspberry Pi to trigger the **Wake Word Engine**.  Since you are using a single microphone in a noisy environment, you may want to speak closely into your microphone to ensure your voice is heard clearly.  You should see a blue light on the bottom of your screen, indicating the wake word was recognized.  Then say "tell me a joke." If Alexa responds, congratulations!  You have a working prototype.  

If you cannot hear Alexa's response, ensure your speaker/earbuds are turned on and plugged in to your Raspberry Pi's 3.5mm audio jack.  Check that your audio output on your Pi is set to **Analog** by right-clicking on the speaker icon in the top right corner of the screen.

Try the following interactions -
  

* Say "Alexa", then ask "What's the weather in Las Vegas?"

* Say "Alexa", then say "Play Katy Perry on TuneIn." 

* Say "Alexa", then say "Add Milk, Eggs, Bread and Orange Juice to my shopping list."

* Say "Alexa", then say "Who is Angela Merkel?"

### Try a Multi-Turn interaction

* Say "Alexa", then ask "Set an alarm for 12:30".  You should receive a response asking you to clarify AM or PM.  Respond to the question with "Afternoon".  If you have DEBUG9 active, scroll up until you see **Listening...** - right above that you'll see that the state of the **Audio Input Processor** (AIP) has changed from `IDLE` to `EXPECTING_SPEECH` and then `RECOGNIZING` - without you speaking the wake word!  Typically, the AIP is triggered by the **Wake Word Engine** running on the client - but in this case, it's been activated via a **Directive** delivered down to your client from the cloud.

![AIP_multiturn](../assets/AIP_Multi.png)

Multi-turn interactions can feel like a more natural method of communication, since you can continue to speak with Alexa as part of a continuing conversation without starting every phrase with "Alexa".  

### Other interactions to Try

* Say "Alexa, Wikipedia" - you'll have the option of looking up any subject without having to speak the wake word before the subject.
* Say "Alexa, let's chat" to initiate a conversation with a chat bot!
* Say "Alexa, play Yes Sire" to play a medieval-themed game using your voice.
