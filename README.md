### clustercalculations
This repository contains Rikkes useful scripts for plotting VAMAS files, and for carrying out calculations related to cluster source depositions
These are MATLAB files and a Jypyter Notebook

### File overview:

### Useful cluster source calculations on-the-go
The "OmicronCalculations.ipynb" Jypiter Notebook is my simple script for quick calculations of nanoparticle sizes, masses, and coverages etc in the lab, for when you want to know how long your deposition is going to take, etc. See more notes about how to approach these calculations in Appendix A of my PhD Thesis.

### Plotting VAMAS files (XPS and ISS data from Omicron)
Note: to get your VAMAS files, you need to open your data files in Vernissage on the lab computer, then export them as VAMAS
Here, you will find the "USEME_PLOT_VAMAS_FILES_POSH.m" MATLAB file, which can convert this special Omicron file format into something which can be plotted in MATLAB. 
You will also find the "USE_ME_AS_REFERENCE_ISS_GRAPH.m" MATLAB where I have plotted reference values for a bunch of elements calculated from https://www.iap.tuwien.ac.at/www/surface/leis (Use Scattering angle = 146.7° and select element of interest from Target - Type).

### Calculating coverages from a deposition current (txt) file
When you have finished a deposition, the "Coverage_from_depcurrent.m" MATLAB script can help you integrate the area below the deposition current to calculate a very exact integration of the fluctuating current over time. You need to manually inspect the times for "current on / current off" and pay attention to the parameters used for the coverage calculation, as you need to also set the size of the nanoparticles in the script. (Ejler has a much more intelligent script for this if you like Python). 


