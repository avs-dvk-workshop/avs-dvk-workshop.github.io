---
title: '7. Run unit test'


layout: nil
---
This assumes the build is in the directory created by the script (sdk-folder).



#### Unit Tests

1. Go to the terminal window, and run the following steps to execute the series of Unit tests on your prototype.

`cd /home/pi/sdk-folder/sdk-build
make all test
`

2. For this workshop, tests have been pre-built to save time.  If you have your earbuds or speakers in, you'll hear Alexa run through a series of audio tests as well as functional tests.

Your test should take around 4 minutes and result in 571 tests complete with 100% success.  As a developer, any time you modify your client's on-device software, you should run **Unit Test** to ensure nothing was unintentionally broken.  Now you're ready to launch your client!

