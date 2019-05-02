# Scenario Header
# 19.4.2007
# Sabine Klein
# DOT PROBE Task   
# n = 160 Trials
#___________________________________________________________________________________________________________

scenario = "DOTPROBE.sce";   
pcl_file = "DOTPROBE.pcl";         #pcl-file header parameter definition  

# Depending on the corresponding scanner    
scenario_type = fMRI_emulation;   
# scenario_type = fMRI;
pulses_per_scan = 1;                                # number of pulses per volume   
$TR = 2220;
scan_period = $TR ;                                 # TR for emulation must be real TR of EPI Sequence
pulse_width = 50;
pulse_code = 99;

screen_width= 800;
screen_height = 600;
screen_bit_depth = 32;               

default_font_size = 20; 
default_text_color = 255,255,255;
default_background_color = 0,0,0;
default_font = "Arial";  
default_text_align = align_center;

no_logfile = false;
response_logging = log_all;
write_codes = true;   

response_matching = simple_matching;                                                                
active_buttons = 4;   
button_codes = 1,2,3,4;              
default_all_responses = true;     


$fontsizechoice = 42;
                                                                                     
begin;  

################################################################################################################### 
# stimulus definitions 
################################################################################################################### 
 
array {
      bitmap { filename = "fixation.jpg" ; preload = true; }   ;   
} kreuzpics; 

picture { bitmap { filename = "fixation.jpg" ;} ; x = 0; y = 0; } default;   
picture { bitmap { filename = "fixation.jpg" ;} ; x = 0; y = 0; } dummy;                 
picture { bitmap { filename = "fixation.jpg" ;} ; x = -200; y = 0; bitmap { filename = "fixation.jpg" ;} ; x = 200; y = 0;} dummy2;          

# Section for changing Pics #
array {
   LOOP $i 20;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern 
      IF '$k < 10';
         $zeros = 1;
      ENDIF;       
      IF '$zeros == 0';
         bitmap { filename = "food1_$k.jpg";preload = false; } ; # Addiction Related Cues!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "food1_0$k.jpg";preload = false; } ;
      ENDIF; 
   ENDLOOP;
} foodpics1;

array {
   LOOP $i 20;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern 
      IF '$k < 10';
         $zeros = 1;
      ENDIF;       
      IF '$zeros == 0';
         bitmap { filename = "food2_$k.jpg";preload = false; } ; # Addiction Related Cues!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "food2_0$k.jpg";preload = false; } ;
      ENDIF;
   ENDLOOP;
} foodpics2;

array {
   LOOP $i 20;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern   
      IF '$k < 10';
         $zeros = 1;
      ENDIF;       
      IF '$zeros == 0';
         bitmap { filename = "neutral1_$k.jpg";preload = false; } ; # Neutral Stimuli!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "neutral1_0$k.jpg";preload = false; } ;
      ENDIF;  
   ENDLOOP;
} neutralpics1;

array {
   LOOP $i 10;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern  
      IF '$k < 10';
         $zeros = 1;
      ENDIF;
      IF '$zeros == 0';
         bitmap { filename = "testpics1_$k.jpg";preload = false; } ; # Test Pictures!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "testpics1_0$k.jpg";preload = false; } ;
      ENDIF;  
   ENDLOOP;
} testpics1; 

array {
   LOOP $i 10;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern  
      IF '$k < 10';
         $zeros = 1;
      ENDIF;
      IF '$zeros == 0';
         bitmap { filename = "testpics2_$k.jpg";preload = false; } ; # Test Pictures!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "testpics2_0$k.jpg";preload = false; } ;
      ENDIF;  
   ENDLOOP;
} testpics2; 
 
array {
   LOOP $i 20;
      $k = '$i + 1';
      $zeros = 0; # Anzahl fuehrender Nullen fuer Bildnummern 
      IF '$k < 10';
         $zeros = 1;
      ENDIF;       
      IF '$zeros == 0';
         bitmap { filename = "neutral2_$k.jpg";preload = false; } ; # Neutral Pictures!!!!
      ENDIF;
      IF '$zeros == 1';
         bitmap { filename = "neutral2_0$k.jpg";preload = false; } ;
      ENDIF;  
   ENDLOOP;
} neutralpics2;

#####################################################################################################################
# practice trial definitions
#####################################################################################################################
trial {  
      trial_duration=forever;  
      trial_type = specific_response;    
      terminator_button = 4;                                      # subject can press button       
      stimulus_event {
                      picture {   
                               text {
                                    caption =
"Im folgenden werden Ihnen Paare von Fotos gezeigt.
Bitte betrachten Sie diese Fotos aufmerksam,
auch wenn diese nur kurz zu sehen sind.

Nach jeder Präsentation eines Foto-Paares
erscheint ein Punkt auf dem Bildschirm.

Wenn der Punkt in der linken Bildschirmhälfte
erscheint, drücken Sie bitte so schnell
wie möglich die linke Reaktionstaste (strg links).

Wenn der Punkt in der rechten Bildschirmhälfte
erscheint, drücken Sie bitte so schnell
wie möglich die rechte Reaktionstaste (strg rechts).

Drücken Sie zum Starten bitte jetzt die Leertaste.";
                
                                    font = "Arial";
                                    font_size = 18;
                               } instructiontext;
                               x=0; y=-2;   
                    
                       } mainsession;
                       code="Instruktion";
      } instructionstim;
} instructiontrial;     

  


trial {
      trial_duration=forever;
      trial_type = specific_response;
      terminator_button = 4;                                   # subject can continue           
      stimulus_event {
                     picture {   
                             text {
                                  caption = 
                                  "Üœbungsdurchgang";             
                                  font = "Arial";
                                  font_size = 60;
                              };
                              x=0; y=50;
               
                              text {
                                   caption = "Drücken Sie zum Starten die Leertaste";
                                   font = "Arial";
                                   font_size = 18;
                              };
                              x=0; y=-70;
                     } uebung;
                     code="uebung";
       } uebungstim;         
} uebungtrial;

trial {
      trial_duration=forever;
      trial_type = first_response;    # subject or investigator can continue                                           
      stimulus_event {
                     picture {   
               
                              text {
                                   caption = "Wenn Sie einen weiteren Übungsdurchgang
starten möchten, drücken Sie bitte die Leertaste";
                                   font = "Arial";
                                   font_size = 18;
                              }textueb;
                              x=0; y=50;
                     } uebung2;
                     code="uebung2";
       } uebungstim2;         
} uebungtrial2;

trial {
      trial_duration=1000;
      stimulus_event {
                     picture {   
                             text {
                                  caption = 
                                  "richtig!";             
                                   font = "Arial";
                                   font_size = 60;
                              } anzahl;
                              x=0; y=0;
                      } correct;
                      code="correct";
     } correctstim; 
} correcttrial;  

trial {
      trial_duration=1000;
      stimulus_event {
                     picture {   
                             text {
                                  caption = 
                                  "falsch!"; 
                                  font = "Arial";
                                  font_size = 60;
                             };
                             x=0; y=0;
                      } error;
                      code="error";
      } errorstim; 
} errortrial;

trial {
      trial_duration=forever;
      trial_type = specific_response;
      terminator_button = 3;                                   # only investigater can continue       
      stimulus_event {
                     picture {   
                             text {
                                  caption = 
                                  "Ende der Üœbung";             
                                  font = "Arial";
                                  font_size = 60;
                             };
                             x=0; y=0;
                     } uebungende;
                     code="uebungende";
      } uebungendestim;         
} uebungendetrial;  


#####################################################################################################################
# mainsession trial definitions
#####################################################################################################################


trial {  
      trial_duration=forever;  
      trial_type = specific_response;    
      terminator_button = 3;                                      # only investigator can continue                              
      stimulus_event {
                      picture {   
                              text {
                                   caption = "Hauptdurchgang";           
                                   font = "Arial";
                                   font_size = 48;
                              } main_session_text2a;
                                      x=0; y=50;
                               text {
                                    caption = "Bitte machen Sie sich bereit. Gleich geht es weiter.";
                                    font = "Arial";
                                    font_size = 24;
                               } main_session_text2b;
                               x=0; y=-70;
                      } main_session;
                      code="Hauptdurchgang";
       } main_sessionstim;
} mainsessiontrial;
 
trial { 
      trial_duration=1500; 
      stimulus_event {
                     picture dummy; 
      } showstim;  
 
} showtrial;                                                         # time and duration defined by PCL
                 
 
#####################################################################################################################
# trial definitions for blocks
#####################################################################################################################                                
                                
                                
trial {             
      trial_duration=500;   
      stimulus_event {               
			picture dummy2;        
			code = "pics";
      } pics; 
} pictrial;  

trial {             
      trial_duration=forever;
      trial_type = first_response;                                        
      stimulus_event {   
			picture{
				bitmap { filename = "fixation.jpg" ;} ; x = 0; y = 0; 
				text {                      
					caption = ".";
					font = "Arial";
					font_size = 50;   
				}text1;    
				x=200; y=20;
			} dotprobepic;
		code = "dotprobe";
		} dotprobestim;
} dotprobetrial; 
 

trial {
      trial_duration = forever;	   
      trial_type = specific_response;
      terminator_button = 2;                                   # only investigator can continue 
      stimulus_event {
                     picture {   
                              text {
                                   caption = 
                                   "Vielen Dank für Ihre Teilnahme!";             
                                   font = "Arial";
                                   font_size = 38;
                              } ende;
                              x=0; y=0;
                      } danke_ende;
                      code="ende";
      } endestim; 
} endetrial;   

