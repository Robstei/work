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
	#pcl_file = "Control.pcl";
	
	# name of this scenario
	scenario = "CR_Scenario_Pornographische_Bilder";
	
	# button definition
	active_buttons = 11;
	button_codes = 1,2,3,4,5,6,7,8,9,10,11;
	
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
		$paradigmName = "Smartphone_Pictures";
				
		#solution preferences (comment/uncomment settings according to your display solution)
		
		#1366x768/1200x800	
		#$stimuliWidth = 950;
		#$stimuliHeight = 534;
		$pictureX = 0;
		$pictureY = 50;
		$dimensionX = 0;
		$dimensionY = -295;	
		$scaleXLeft = -270;
		$scaleXRight = 245;
		$scaleY = -350;						
		$instructionWidth = 1300;
		$instructionHeight = 700;
		
		$scaleLevels = 5;

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
bitmap {filename = "NEUTRAL\\Archery 1.jpg";description = "1"; height = 479; width = 640;}pic;
bitmap {filename = "NEUTRAL\\Archery 2.jpg";description = "2";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Band 1.jpg";description = "3";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Barbeque 1.jpg";description = "4";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Bird 5.jpg";description = "5";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Bored pose 6.jpg";description = "6";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Bungee jumping 1.jpg";description = "7";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Bungee jumping 2.jpg";description = "8";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Camping 2.jpg";description = "9";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Camping 9.jpg";description = "10";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Camping 10.jpg";description = "11";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Celebration 2.jpg";description = "12";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Cliff diver 1.jpg";description = "13";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Cold 6.jpg";description = "14";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Couple 3.jpg";description = "15";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Dancing 3.jpg";description = "16";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Doctor 1.jpg";description = "17";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Doctor 2.jpg";description = "18";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Doctor 3.jpg";description = "19";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Excited face 4.jpg";description = "20";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Excited face 7.jpg";description = "21";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Exercise 1.jpg";description = "22";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Exercise 2.jpg";description = "23";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Exercise 3.jpg";description = "24";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Fire 1.jpg";description = "25";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Fire 8.jpg";description = "26";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Football player 1.jpg";description = "27";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Gazing 1.jpg";description = "28";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Gazing 4.jpg";description = "29";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Gazing 7.jpg";description = "30";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Hang gliding 3.jpg";description = "31";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Happy pose 1.jpg";description = "32";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Horse racing 1.jpg";description = "33";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Motocross 1.jpg";description = "34";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Neutral face 5.jpg";description = "35";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Performance 2.jpg";description = "36";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Picnic 3.jpg";description = "37";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Police 3.jpg";description = "38";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rafting 1.jpg";description = "39";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rafting 2.jpg";description = "40";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rafting 6.jpg";description = "41";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rock climbing 1.jpg";description = "42";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rock climbing 2.jpg";description = "43";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rock climbing 3.jpg";description = "44";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rock climbing 4.jpg";description = "45";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Rugby 1.jpg";description = "46";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Running away 1.jpg";description = "47";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Sailing 1.jpg";description = "48";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\School 4.jpg";description = "49";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Skijump 2.jpg";description = "50";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Skydiving 5.jpg";description = "51";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 1.jpg";description = "52";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 2.jpg";description = "53";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 3.jpg";description = "54";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 4.jpg";description = "55";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 5.jpg";description = "56";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Soldiers 6.jpg";description = "57";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Surgery 2.jpg";description = "58";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Surprise 1.jpg";description = "59";height = 479; width = 640;};
bitmap {filename = "NEUTRAL\\Toast 1.jpg";description = "60";height = 479; width = 640;};
}stimuli;	

			bitmap { filename = $dot_blank ; } dotblank;
			bitmap { filename = $dot_filled ; } dotfilled;
			
		#name in logfile
		text { 
			caption = $paradigmName; 
		}paradigmName;
	
# Trial Definitions	

	#--  INSTRUCTION 1  --#
		trial {
			trial_duration = forever;
			trial_type = specific_response;    	
			terminator_button = 11; 
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
			terminator_button = 11; 
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
			terminator_button = 11; 
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
			terminator_button = 11; 
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
			terminator_button = 1,2,3,4,5,6,7,8,9,10;
			
			picture
				{ 	
									#rating dots
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot1;				
					x = 0; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot2;				
					x = 0; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot3;				
					x = 0; y = $scaleY;
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot4;				
					x = 0; y = $scaleY;				
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot5;				
					x = 0; y = $scaleY;	
					bitmap		
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot6;				
					x = 0; y = $scaleY;	
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot7;				
					x = 0; y = $scaleY;	
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot8;				
					x = 0; y = $scaleY;	
					bitmap		
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot9;				
					x = 0; y = $scaleY;	
					bitmap
					{
						filename = $dot_blank; width = $dotSize; height = $dotSize;
					}dot10;				
					x = 0; y = $scaleY;	
					
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
				
				
					#stimuli
					bitmap
					{
						filename = $stimulusDefault; #height = $stimuliWidth; width = $stimuliHeight;
					}ratingStimulus;
					x = $pictureX; y = $pictureY;
					#instruction text
					text 
					{
						caption = $defaultRatingText1;
						font_size = 22;
					}ratingPageText;
					x = $dimensionX; y = $dimensionY;	


					#placeholder for input
					text { caption = " "; } ratingInput;
					x = 0; y = -1500;
				 }ratingPicture;
				 #time=0;
				 code = "ratingPage"; 
			}ratingPage;
		#-- /RATING PAGE --#

	
#-- PCL CODE --#
begin_pcl;

	#--  PREFERENCES  --#		
	
	#animation times
	int animationTime = 500;
	
	#pictures to rate
	int stimuliToRate = 60; # Hier ändern wenn man mehr als 60 Bilder hat
	
	#pictures to rate (1 to 10)
	int scaleLevels = 5;
	
	int dotDistance = 70;
	
	bool randomOrder = true;
	
	#Order: Rating Text - Lowest Rating - Highest Rating
	#Example: "Anregung" - "gar nicht " - "sehr"
	array <string> ratingsAll[2][3] = 
			{ 
				{ "Anregung",       			    		"gar nicht anregend",	 "sehr anregend" }, 
				{ "Emotionalität",					 	"negativ",            	 "positiv" } 
				
			};
	
	#if set true every export has variable names in the first line of the output
	bool exportVariableNames = true;
	
	#dot filenames
	string dot_blank = "rating/dot_blank.png";
	string dot_filled = "rating/dot_filled.png";

	string stimDefault = "default-pic.jpg";
	
	include "Control.pcl";

	runExperiment();
#-- /PREFERENCES  --#

#-- /PCL CODE --#



