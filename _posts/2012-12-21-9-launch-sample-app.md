---
title: '8. Launch the Client'

layout: nil
---

{:.steps}
### Launch the Client

The sample application is in the folder `/home/pi/sdk-folder/sdk-build/SampleApp/src`. You should see a shell script to start it called `startsample.sh` in the `/home/pi/sdk-folder` directory. To see how it is being started, you can use your Terminal to navigate to this directory and use `cat` to view the contents:

```sh
cd /home/pi/sdk-folder/
cat startsample.sh
```

You can see that it is starting with the highest debug level, **DEBUG9**.  This will display status messages in the console as you communicate with Alexa.  If you want to reduce output, simply change that to a lower number or remove it altogether. For starters, try it at the highest level so you can see what is going on behind the scenes.

## Terminal Window

1. From a terminal window, run `startsample.sh`.

```sh
cd /home/pi/sdk-folder
bash startsample.sh
```

2. You should see the following, if you don't, please ask for help:

<TODO: insert a sucessful start screen>

{:.verify}
### Checkpoint 9

1. Say "Alexa". You should see the console status change to **Listening**, then say "tell me a joke." If Alexa responds, you have a working prototype.
