    This work is an attempt to analyse how the New Zealand English (NZE) database reacts to DeepFormants (https://github.com/MLSpeech/DeepFormants). Only the formant estimation is carried out. This repository has the hand labelled formant data of NZE English and the formants obtained when fed in DeepFormants network. Both these files are contained in HAND and DEEP csv files respectively.
    The attached python code execution goes in this manner.
1.	nz_formants.py is the main python file for estimating the formants with both .wav and .TextGrid files as input. Call this (main) script in the terminal with the input wav and textgrid files in hand. 
python nz_formants.nz
2.	It further executes the text_grid_vowel_extraction.py which is responsible for extracting the vowels and to set the start time and end time in which the formants need to be estimated.
3.	The code then calls formants.py and extract_features.py (created by DeepFormants) 
    The Mean Absolute Error (MAE) of F1 and F2, MAE of individual speakers, F1/F2 plot of HANDvsDEEP are generated using R-environment using emuR library. The R code is also uploaded.
    
