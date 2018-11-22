#############################################
### README: TANNER VIEWING TIMES PARADIGM ###
#############################################

1.) Program
--------------------
The Tanner Viewing Times Paradigm was programmed in Presentation.
It contains of the evaluation of 64 stimuli on 3 dimensions.
During the paradigm ratings (1-5) and viewing times (ms) are recorded.
Current language is German.

Copyright © Jan Snagowski [2014] All Rights Reserved.
Email: jan.snagowski@uni-due.de

2.) Output Files
--------------------
The paradigm produces 2 outputs. One general output, which contains all datasets and additionally
one file for every participant (subdirectory 'singles').
By default, the paradigm export the variable names to the first line of every output file, to make
an import to SPSS (or other statistic programs) more comfortable.


3.) Output Structure
--------------------
The output contains general information and scores (1-58) as well as raw data (59-506). 
The automatically calculated scores are generated according to the different stimulus 
types, the type of measurement (rating (RA) vs. viewing times (VT)) and 
the type of dimension assessed (sexual arousal (Err), subjective attraction (ATT), emotionality (Emo)). 

Mean Score Example
------------------

- Category: t_1_m (Tanner 1 male stimuli)

- Variables
-> t_1_m_VT	= Mean viewing times of all tanner 1 male stimuli (all dimensions)
-> t_1_m_Err_VT	= Mean viewing times of all tanner 1 male stimuli for sexual arousal
-> t_1_m_Att_VT	= Mean viewing times of all tanner 1 male stimuli for subjective attraction
-> t_1_m_Emo_VT	= Mean viewing times of all tanner 1 male stimuli for emotionality
-> t_1_m_RA 	= Mean rating of all tanner 1 male stimuli (all dimensions)
-> t_1_m_Err_RA	= Mean rating of all tanner 1 male stimuli for sexual arousal
-> t_1_m_Att_RA	= Mean rating of all tanner 1 male stimuli for subjective attraction
-> t_1_m_Emo_RA	= Mean rating of all tanner 1 male stimuli for emotionality


Raw Data Example
------------------

- Stimulus filename: MT1_1.jpg

- Variables
-> MT1_1_Pos	= Position of presentation
-> MT1_1_VT	= Mean viewing times of the stimulus 'MT1_1.jpg' (all dimensions)
-> MT1_1_Err_VT	= Viewing time of the stimulus 'MT1_1.jpg' for sexual arousal
-> MT1_1_Att_VT	= Viewing time of the stimulus 'MT1_1.jpg' for subjective attraction
-> MT1_1_Emo_VT	= Viewing time of the stimulus 'MT1_1.jpg' for emotionality
-> MT1_1_RA 	= Mean rating of the stimulus 'MT1_1.jpg' (all dimensions)
-> MT1_1_Err_RA	= Rating of the stimulus 'MT1_1.jpg' for sexual arousal
-> MT1_1_Att_RA	= Rating of the stimulus 'MT1_1.jpg' for subjective attraction
-> MT1_1_Emo_RA	= Rating of the stimulus 'MT1_1.jpg' for emotionality