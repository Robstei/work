/*
* GoNoGo 1.0
*
* Version:		Presentation 16.5
*
* Author: 		Jan Snagowski 11/2014
* Institute: 	University of Duisburg-Essen
* Department: 	General Psychology: Cognition
*
*/


#--  HEADER --#

	#-- BASIC PREFERENCES --#
	
	#name of this file
	scenario = "GoNoGo_Modifiziert";
	
	#Choose scenario_type dependent to usage
	scenario_type = trials; 
		
	#name of corresponding PCL-File	
	pcl_file = "GoNoGo_mod_Main.pcl";	
	/*NOTE: 	It is possible to put all pcl-statements in the same file as the scenario imformations.
	* Yet it is recommended to seperate scenario and control espacially in rather big projects
	* due to organizational purposes.*/			


	#text and color preferences
	default_font_size = 25;
	#all fonts installed on system supported
	default_font = "Times new Roman"; 
	#black
	#default_background_color =0,0,0;
	#white
	#default_text_color = 255,255,255;
	
	default_background_color =242,242,242;
	default_text_color = 0,0,0;
	
	
	/*The value of this parameter is used as the trial type for trials that do not define the trial_type parameter. 
	* The possible values are fixed, first_response, correct_response, nth_response, and all_correct_responses.
	* The trial_type in general specifies what responses, if any, will cause the trial to end.*/
	default_trial_type = fixed; 
	
	# Response Matching
	/* To use all features of mathching set the parameter "response_matching" to "simple_matching".
	* Otherwise you can only use the legacy_matching features. For further information have a look at the help file. */
	response_matching = simple_matching;
	
	no_logfile = false;
	
	# Button preferences
	# - all used buttons in this project have to be enabled here and in setting/response */
	active_buttons = 2;    
	button_codes = 1,2; 
	
	#NOTE: You can add several more optional Header-Parameters. For more information search the documentation3

	#-- /BASIC PREFERENCES --#

	#header always ends with "begin" statement
	begin;
	
#-- /HEADER --#


#--  BODY --#

	#The body holds all single trials, pictures, arrays etc. which will be controlled via the PCL file
	
	
	#--  VARIABLES --#
	
		#to individualize the project you can change all important non-parameter variables here
		#no other code changes needed.
		
		#duration and delay of presented stimuli
		$stimulusDuration = 1500;
		$feedbackDuration = 500;
				
		#duration of the fixation cross
		$fixationCrossDuration = 1000;
		
		$trialDuration = 1000;
		
		$inheight = 800;
		$inwidth = 1280;		
				
	#--  LOAD DATA  --#		
		array{  
			bitmap {filename = "instructions/modifiziert/instruction1.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/play1.jpg";description = "play1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/play2.jpg";description = "play2";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/play3.jpg";description = "play3";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/play4.jpg";description = "play4";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice1.jpg";description = "practice1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice2.jpg";description = "practice2";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice3.jpg";description = "practice3";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice4.jpg";description = "practice4";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice5.jpg";description = "practice5";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/practice6.jpg";description = "practice6";height=$inheight;width=$inwidth;};
		}instructions;
		
		array{  
			bitmap {filename = "instructions/modifiziert/block_A_1.jpg";description = "block_A_1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/block_A_2.jpg";description = "block_A_2";height=$inheight;width=$inwidth;};
		}blockA;
		
		array{  
			bitmap {filename = "instructions/modifiziert/block_B_1.jpg";description = "block_B_1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/modifiziert/block_B_2.jpg";description = "block_B_2";height=$inheight;width=$inwidth;};
		}blockB;
		
		
		sound { wavefile { filename = "sounds/modifiziert/SNS1.wav"; };attenuation = 0.05;}sound1;
		sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 0.05;}sound2;
		sound { wavefile { filename = "sounds/modifiziert/SNS2.wav"; };attenuation = 0.05;}sound3;
		sound { wavefile { filename = "sounds/modifiziert/N2.wav"; };attenuation = 0.05;}sound4;
		
		
	#-- /LOAD DATA  --#	
	
	
	#--  TRIALS --#
	
		### INSTRUCTIONS ###
		
			trial {    
				trial_duration = 2500;
				picture {  
					# placeholder - set by PCL
					bitmap {filename = "instructions/modifiziert/play1.jpg";height=$inheight;width=$inwidth;};
					x = 0; y = 0;};
					sound sound1;
					time = 500;
			}inPlay1;
			
			trial {    
				trial_duration = 2500;
				picture {  
					# placeholder - set by PCL
					bitmap {filename = "instructions/modifiziert/play2.jpg";height=$inheight;width=$inwidth;};
					x = 0; y = 0;};
					sound sound2;
					time = 500;
			}inPlay2;
			
			trial {    
				trial_duration = 2500;
				picture {  
					# placeholder - set by PCL
					bitmap {filename = "instructions/modifiziert/play3.jpg";height=$inheight;width=$inwidth;};
					x = 0; y = 0;};
					sound sound3;
					time = 500;
			}inPlay3;
			
			trial {    
				trial_duration = 2500;
				picture {  
					# placeholder - set by PCL
					bitmap {filename = "instructions/modifiziert/play4.jpg";height=$inheight;width=$inwidth;};
					x = 0; y = 0;};
					sound sound4;
					time = 500;
			}inPlay4;		
			
			trial {    
				trial_duration = 7000;
				picture {  
					# placeholder - set by PCL
					box { height = 1; width = 1; color = 0,0,0; };
						x = 0; y = 0;}p_1_2;
					sound sound1;
					time = 500;
					sound sound2;
					time = 3000;
			}play1And2;		
			
			trial {    
				trial_duration = 7000;
				picture {  
					# placeholder - set by PCL
					box { height = 1; width = 1; color = 0,0,0; };
						x = 0; y = 0;}p_3_4;
					sound sound3;
					time = 500;
					sound sound4;
					time = 3000;
			}play3And4;		
		
		### INSTRUCTIONS ###
	
		#--  PARTICIPANT PAGE  --#
			trial {
			stimulus_event {
				picture {
					#background_color = 255,255,255;
					 text {
						caption = "Bitte tun sie irgendwas!"; 
						} inputPageText;
						x = 0;
						y = 0;     
					  
					  text {
						caption = " "; 
						font_color = 0,0,0; 
						background_color = 150,150,150;
						height = 30;
						width = 120;
						} input;
						x = 0;
						y = -30;   
				} exp_eingabe;
				duration = response;
				}participantEvent;
			}inputPage; 
		#-- /PARTICIPANT PAGE  --#
		
		#--  SPACE PAGE  --#
			trial {
				trial_duration = forever;
				trial_type = specific_response;    	
				terminator_button = 2; 
				stimulus_event {
					picture {
						text {caption ="Bitte tun sie irgendwas!";}spacePageText;
					x = 0; y = 0;};
				};
			}spacePage; 
		#-- /SPACE PAGE  --#
				
		#--  SHOW PICTURE  --#		
			trial {    
			#This is the desired length of the trial in milliseconds
			trial_duration = forever;
				trial_type = specific_response;    	
				terminator_button = 2; 
				stimulus_event {
					picture {
						box { height = 1; width = 1; color = 0,0,0; };
						x = 0; y = 0;}targetPicture;
						response_active = true;
						time = 0;};
			}showPicture;		
		#-- /SHOW PICTURE  --#
				
		#--  FIXATION CROSS --#
			trial {
			stimulus_event {
				picture {
						text {
								caption ="+";
								font_size = 60;
							};
						x = 0; y = 0;
						};
				duration = $fixationCrossDuration;
				};
			}fixationCross; 
		#-- /FIXATION CROSS --#				
		
		#--  PLAY SOUND 1 --#			  
			trial {    
			#This is the desired length of the trial in milliseconds
			trial_duration = $trialDuration;
				trial_type = specific_response;    	
				terminator_button = 1; 
				stimulus_event {
					picture {
						bitmap {filename = "listen.png";};
						x = 0; y = 0;}listenPicture1;
						response_active = true;
						time = 0;}event1;
						sound sound1;
			}playSound1;				
		#--  PLAY SOUND 1 --#	

		#--  PLAY SOUND 2 --#			  
			trial {    
			#This is the desired length of the trial in milliseconds
			trial_duration = $trialDuration;
				trial_type = specific_response;    	
				terminator_button = 1; 
				stimulus_event {
					picture {
						bitmap {filename = "listen.png";};
						x = 0; y = 0;}listenPicture2;
						response_active = true;
						time = 0;}event2;
						sound sound2;
			}playSound2;				
		#--  PLAY SOUND 2 --#	

		#--  PLAY SOUND 3 --#			  
			trial {    
			#This is the desired length of the trial in milliseconds
			trial_duration = $trialDuration;
				trial_type = specific_response;    	
				terminator_button = 1; 
				stimulus_event {
					picture {
						bitmap {filename = "listen.png";};
						x = 0; y = 0;}listenPicture3;
						response_active = true;
						time = 0;}event3;
						sound sound3;
			}playSound3;				
		#--  PLAY SOUND 3 --#	

		#--  PLAY SOUND 4 --#			  
			trial {    
			#This is the desired length of the trial in milliseconds
			trial_duration = $trialDuration;
				trial_type = specific_response;    	
				terminator_button = 1; 
				stimulus_event {
					picture {
						bitmap {filename = "listen.png";};
						x = 0; y = 0;}listenPicture4;
						response_active = true;
						time = 0;}event4;
						sound sound4;
			}playSound4;				
		#--  PLAY SOUND 2 --#	
				
		#--  ITI  --#
			trial {
			stimulus_event {
				picture {};
				duration = 1500;
				};
			}iti; 
		#-- /ITI  --#
		
		#--  DEBRIEFING  --#
			#general enter page
			trial {
				trial_duration = forever;
				trial_type = specific_response;    	
				terminator_button = 2; 
				stimulus_event {
					picture {
						bitmap {filename = "debriefing.png";height=$inheight;width=$inwidth;};
					x = 0; y = 0;};
					};
				}debriefing; 
		#-- /DEBRIEFING  --#
		
		#--  CORRECT ANSWER  --#
			trial {
				trial_duration = $feedbackDuration;
				stimulus_event{
					picture {
						bitmap {filename = "correct.png";height = 196; width = 301;};
						x = 0; y = 0;};
					};
				}positiveFeedback; 
		#-- /CORRECT ANSWER  --#
		
		#--  INCORRECT ANSWER  --#
			trial {
				trial_duration = $feedbackDuration;
				stimulus_event{
					picture {
						bitmap {filename = "incorrect.png";height = 301; width = 196;};
						x = 0; y = 0;};
					};
				}negativeFeedback; 
		#-- /INCORRECT ANSWER  --#
	
	#-- /TRIALS --#
	
#--  /BODY --#