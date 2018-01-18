---
title: '1. Setup Your Pi and Intel Speech Enabling Developer Kit'


layout: nil
---

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
