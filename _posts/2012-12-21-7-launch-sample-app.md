---
title: '7. Launch the Client'

layout: nil
---

### Launch the Client

The sample application is in the folder */home/pi/sdk-folder/sdk-build/SampleApp/src*.

To launch the sample app, you can use the **startsample.sh** script in the */home/pi/sdk-folder* directory. To see how it is being started, you can use File Manager to navigate to this directory, right-click and select Text Editor to view the contents:

![](assets/Debug9.png)

You can see that it is starting with the highest debug level, **DEBUG9**. This will display status messages in the console as you communicate with Alexa. If you want to reduce output, simply change that to a lower number or remove it altogether. For starters, try it at the highest level so you can see what is going on behind the scenes.

## Terminal Window

Open a new terminal window and run **startsample.sh** by pasting the following command into a terminal window:

`cd /home/pi/sdk-folder
sudo bash startsample.sh
`

You should see a connecting message, followed with a splash screen indicating your App has started successfully.

![](assets/SampleApp.png)

{:.verify}
### Checkpoint 9

1. Say "Alexa". You should see the console status change to **Listening**, then say "tell me a joke."  If Alexa responds with **Thinking**, then **Speaking**, you have a working prototype.  If you don't hear anything, ensure you have your earbuds plugged into the 3.5mm audio jack on your DSP board.  If you're using a speaker, ensure the speaker is turned on.  
2. If your volume on your earbuds is too loud, you can use key commands in the sample app to turn down the volume.  Type **"p"**, hit enter, then hit **1** and **2** at the follow-up screens to turn down the volume.  Or - just use your voice and ask Alexa to turn it down!
![](assets/VolumeDown.png)
3. If your setup appears frozen and doesn't show **Thinking** when you speak, try typing **s** and hit enter to stop that interaction - if that doesn't work you can hit **q** to quit - then try restarting by opening a new terminal window and following the instructions above to relaunch the sample app.
