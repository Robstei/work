/*
*
* Cue Reactivity
*
* Version:		Presentation 17.0
*
* Author: 		Jan Henry van der Vegte 02.05.2016
* Institute: 	University of Duisburg-Essen
* Department: 	General Psychology: Cognition
*/


#--  HEADER --#

	#-- BASIC PREFERENCES --#
	# PCL-File
	pcl_file = "CR_Control.pcl";

	# name of this scenario
	scenario = "CR_Scenario_IAPS_Bilder";
	
	# button definition
	active_buttons = 6;
	button_codes = 1,2,3,4,5,6;
	
	# response matching
	response_matching = simple_matching;
	
	#fond and color settings
	default_font_size = 20;
	default_font = "Arial bold";
	default_background_color =221,217,195; 
	default_text_color = 0,0,0; 
	
	#don't export standard logfile
	no_logfile = true;
	
	# trial defaults
	default_trial_type = fixed;
	
#-- /HEADER --#

begin;

#--  BODY --#

	
	#--  VARIABLES --#
	
		#InstructionText
		$instruktion = "instruktion.png";
		$stimulusDefault = "default-pic.jpg";
					
		# name of the paradigm (in logfile):
		$paradigmName = "IAPS_Pictures";
		
		#solution preferences (comment/uncomment settings according to your display solution)
		
		#1366x768/1200x800	
		$stimuliWidth = 819;
		$stimuliHeight = 614;
		$pictureX = 0;
		$pictureY = 50;
		$dimensionX = 0;
		$dimensionY = -295;	
		$scaleXLeft = -270;
		$scaleXRight = 245;
		$scaleY = -350;			
		$dot1X = -120;
		$dot2X = -60;
		$dot3X = 0;
		$dot4X = 60;
		$dot5X = 120;				
		$instructionWidth = 1300;
		$instructionHeight = 700;
		
		#1920x1080/1920x1200 (HD | >)			
	#	$stimuliWidth = 630;
	#	$stimuliHeight = 882;
	#	$pictureX = 0;
	#	$pictureY = 50;
	#	$dimensionX = 0;
	#	$dimensionY = -435;	
	#	$scaleXLeft = -270;
	#	$scaleXRight = 245;
	#	$scaleY = -490;			
	#	$dot1X = -120;
	#	$dot2X = -60;
	#	$dot3X = 0;
	#	$dot4X = 60;
	#	$dot5X = 120;
	#	$instructionWidth = 1300;
	#	$instructionHeight = 700;

	#Custom solution (Insert and uncomment values below)			
	#	$stimuliWidth = 0;
	#	$stimuliHeight = 0;
	#	$pictureX = 0;
	#	$pictureY = 0;
	#	$dimensionX = 0;
	#	$dimensionY = 0;	
	#	$scaleXLeft = 0;
	#	$scaleXRight = 0;
	#	$scaleY = -0;			
	#	$dot1X = 0;
	#	$dot2X = 0;
	#	$dot3X = 0;
	#	$dot4X = 0;
	#	$dot5X = 0;
	#	$instructionWidth = 1300;
	#	$instructionHeight = 700;


		#rating dot destination
		$dot_blank = "rating/dot_blank.png";
		$dot_filled = "rating/dot_filled.png";
		$dotSize = 50;

		#default rating text
		$defaultRatingText1 = "1";
		$defaultRatingText2 = "2";
		$defaultRatingText3 = "3";
		
		$defaultRight = "sehr stark";
		$defaultLeft = "gar nicht";
		
		$itiDuration = 500;		
		
		
	#--  LOAD DATA  --#	
		
		array{  
			#neutral pictures
			bitmap {filename = "iaps-vis/iv1.jpg";description = "1";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv2.jpg";description = "2";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv3.jpg";description = "3";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv4.jpg";description = "4";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv5.jpg";description = "5";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv6.jpg";description = "6";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv7.jpg";description = "7";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv8.jpg";description = "8";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv9.jpg";description = "9";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv10.jpg";description = "10";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv11.jpg";description = "11";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv12.jpg";description = "12";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv13.jpg";description = "13";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv14.jpg";description = "14";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv15.jpg";description = "15";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv16.jpg";description = "16";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv17.jpg";description = "17";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv18.jpg";description = "18";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv19.jpg";description = "19";height = $stimuliWidth; width = $stimuliHeight;};
			bitmap {filename = "iaps-vis/iv20.jpg";description = "20";height = $stimuliWidth; width = $stimuliHeight;};
		}stimuli;			

		#name in logfile
		text { 
			caption = $paradigmName; 
		}paradigmName;
	
# Trial Definitions	

	#--  INSTRUCTION 1  --#
		trial {
			trial_duration = forever;
			trial_type = specific_response;    	
			terminator_button = 6; 
			stimulus_event {
				picture {
					bitmap {filename ="instruction1_bilder.png";height = $instructionHeight; width = $instructionWidth;};
				x = 0; y = 0;};
			};
		}instruction1; 
	#-- /INSTRUCTION 1  --#
	
	
	#--  INSTRUCTION 2  --#
		trial {
			trial_duration = forever;
			trial_type = specific_response;    	
			terminator_button = 6; 
			stimulus_event {
				picture {
					bitmap {filename ="instruction2_bilder.png";height = $instructionHeight; width = $instructionWidth;};
				x = 0; y = 0;};
			};
		}instruction2; 
	#-- /INSTRUCTION 2  --#


	#--  INSTRUCTION 3  --#
		trial {
			trial_duration = forever;
			trial_type = specific_response;    	
			terminator_button = 6; 
			stimulus_event {
				picture {
					bitmap {filename ="instruction3_bilder.png";height = $instructionHeight; width = $instructionWidth;};
				x = 0; y = 0;};
			};
		}instruction3; 
	#-- /INSTRUCTION 3  --#


	#--  DEBRIEFING  --#
		trial {
			trial_duration = forever;
			trial_type = specific_response;    	
			terminator_button = 6; 
			stimulus_event {
				picture {
					text {caption ="Die Aufgabe ist nun beendet.\n\nBitte wenden Sie sich an den Versuchsleiter.";};
				x = 0; y = 0;};
			};
		}debriefing; 
	#-- /DEBRIEFING  --#

	#--  ITI  --#
		trial {
			stimulus_event {
				picture{};
				duration = $itiDuration;
			};
		}iti;
	#-- /ITI  --#
			
			
	#--  RATING PAGE --#
		trial
		{	
			trial_duration = forever;              
			trial_type = specific_response; 
			terminator_button = 1,2,3,4,5;
			
			picture
				{ 	
					#stimuli
					bitmap
					{
						filename = $stimulusDefault; width = $stimuliWidth; height = $stimuliHeight;
					}ratingStimulus;
					x = $pictureX; y = $pictureY;
					#instruction text
					text 
					{
						caption = $defaultRatingText1;
						font_size = 22;
					}ratingPageText;
					x = $dimensionX; y = $dimensionY;	
					#left
					text 
					{
						caption = $defaultLeft;
						font_size = 18;
					}leftText;
					x = $scaleXLeft; y = $scaleY;	
					#right
					text 
					{
						caption = $defaultRight;
						font_size = 18;
					}rightText;
					x = $scaleXRight; y = $scaleY;	
					#rating dots
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot1;				
					x = $dot1X; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot2;				
					x = $dot2X; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot3;				
					x = $dot3X; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot4;				
					x = $dot4X; y = $scaleY;				
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot5;				
					x = $dot5X; y = $scaleY;					
					#placeholder for input
					text { caption = " "; } ratingInput;
					x = 0; y = -1500;
				 }ratingPicture;
				 #time=0;
				 code = "ratingPage"; 
			}ratingPage;
		#-- /RATING PAGE --#