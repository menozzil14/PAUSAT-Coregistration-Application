Vega Wobbler/PACT Co-registration Application

This is a GUI to help co-register PACT and Wobbler images taken on
the Vega system. This assumes that the transducer was moved the
correct distances (33mm and 53.5mm) during image acquisition.

Workflow:
1) select the AA image directory. The program will look for the "FusedVolume.mha"
   file to open
2) select the PA image file. The image should already be reconstructed.
3) Press "co-register" in the home tab. The co-registration also assumes the depth
   offset of 65 for the PA reconstruction. You may have to adjust the depth (shift
   the PA image axially). I still need to automate this.
4) You can loop through the frames of AA, PA, the overlay, etc. The MAP knob is the
   number of frames for your moving maximum amplitude projection. 
5) to calculate sO2, select the other reconstructed PA image file. Input the two wavelengths
   used and calculate the sO2.