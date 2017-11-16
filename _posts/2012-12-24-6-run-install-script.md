---
title: '6. Run the Install Script'


layout: nil
---

{:.steps}
### Run the Install Script

You are now ready to run the install script. This will install all dependencies, pull down the AVS SDK code base, and install the driver for the Intel Speech Enabling Developer Kit. 

To run the script, open a **terminal** window by clicking on the console window 
in the Pi's toolbar at the upper left of the screen. There should be one script 
in your `/home/pi/` directory named `install_avs_sdk.sh`. Copy and paste the 
following commands into your terminal window, and hit return to run the following:  

```sh
cd ~
sudo bash ./install_avs_sdk.sh
```

First, you will be prompted for the product ID, Client ID, and Client secret which you should have obtained when creating your **security profile** in a prior section. Next, this script will install the required dependencies on your system. Then, it will download the SDK code base and the Intel Speech Enabling Developer Kit driver. After these downloads complete, the script will proceed to install the driver and build the SDK.

Note if you have made an error while providing the information to the `install_avs_sdk.sh` script, the script will error out and inform you which field needs to be fixed. In this event, return to your **security profile** on your Developer page and double-check your copy and paste values given to the `install_avs_sdk.sh` script.

Once all of the dependency, driver, and SDK installation has completed, the browser on the Raspberry Pi will be opened to `https://localhost:3000`, and you will be prompted to log into the Amazon Developer console to generate the refresh token. Proceed as instructed on the website. After completing this step, the `install_avs_sdk.sh` script will automcatically exit.

> **NOTE:** For the purposes of this workshop, portions of the script have been pre-built to get your client up and running faster.  If you use this script for an install on a clean OS image, expect it to take around 20 minutes to build, also you must run the script with the `--from-scratch` flag, i.e. `sudo bash ./install_avs_sdk.sh --from-scratch`.


{:.verify}
### Checkpoint 6

1. Build completed without error output.
