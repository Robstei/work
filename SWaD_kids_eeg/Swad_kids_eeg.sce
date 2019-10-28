scenario = "Swad_kids_eeg";   
pcl_file = "Swad_kids_eeg.pcl"; 

response_matching = simple_matching;
default_font = "Apercu Mono";
active_buttons = 3;
event_code_delimiter = ";";
stimulus_properties = configuration, number, conditionid, string, trialid, string, form, string, color, string, seperateAttention, number, target, number;
response_logging = log_active;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255; 

default_output_port = 1;
pulse_width=50;
write_codes = true;

begin;

	ellipse_graphic {
		color=255,0,0,255;
		ellipse_width = EXPARAM("Circle Diameter" : 100);
		ellipse_height= EXPARAM("Circle Diameter" : 100);
		width = EXPARAM("Circle Diameter" : 100);
		height = EXPARAM("Circle Diameter" : 100);
	}ellipse;
	
	ellipse_graphic {
		color=255,0,0,255;
		ellipse_width = 60;
		ellipse_height = 60;
		width = 70;
		height = 70;
	}ellipse_instruction;
	
	array {
		picture {
			description = "flower";
			bitmap {filename = "flower.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_flower;
		
		picture {
			description = "bell";
			bitmap {filename = "bell.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_bell;
		
		picture {
			description = "heart";
			bitmap {filename = "heart.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_heart;
		
		picture {
			description = "circle";
			bitmap {filename = "circle.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_circle;
		
		picture {
			description = "moon";
			bitmap {filename = "moon.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_moon;
		
		picture {
			description = "star";
			bitmap {filename = "star.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_star;
	} form_array;

	trial {
		trial_duration = EXPARAM("Time Response Active" : 1800);
		trial_type = first_response;
		
		stimulus_event{
		picture {} main_picture;
		duration = EXPARAM("Time Stimulus" : 250);
		}stim_event;
	} trial_main;

	trial {
		picture {
			text {
				caption="+";
				font_size=50;
			};
			x=0; y=0;
		}cross;
	} trial_cross;

	trial {
		trial_duration = EXPARAM("Time Feedback" : 2000);
		picture {
			text { caption = " "; font_size = 24; max_text_width = 600;} text_feedback; 
			x=0; y=0;
		} feedback_pic;
	} trial_feedback;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;

		picture {
			text { caption = " "; font_size = 25; max_text_width = 1200;} text_introduction;
			x=0;y=0;
		} picture_information;
		stimulus_time_in = 1000;
		response_active= true;
	} trial_information;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
			picture {
				text { caption = ""; font_size = 30;}text_instruction_color1;
				x=0; y=200;
				
				ellipse_graphic ellipse_instruction;
				x=-100; y=100;
				
				text { caption = ""; font_size = 30;}text_instruction_color2;
				x=50; y=100;
				
				text { caption = ""; font_size = 30;}text_instruction_color5;
				x=0; y=-200;
				
				text { caption = ""; font_size = 30;}text_instruction_color6;
				x=0; y=-300;
				
			} picture_instruction_color;
			stimulus_time_in = 1500;
			response_active= true;
	
		} trial_instruction_color;
		
		trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
		picture {
			text { caption = ""; font_size = 30;}text_instruction_form3;
			x=0; y=200;
			
			bitmap {filename = "heart.png"; width=266; height=150;}bitmap_target_form;
			x=-100; y=100;

			text { caption = ""; font_size = 30;}text_instruction_form4;
			x=100; y=100;
			
			text { caption = ""; font_size = 30;}text_instruction_form5;
			x=0; y=-200;
			
			text { caption = ""; font_size = 30;}text_instruction_form6;
			x=0; y=-300;
		} picture_instruction_form;
		
		stimulus_time_in = 1500;
		response_active= true;
		} trial_instruction_form;
		
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
		picture {
		
			text { caption = ""; font_size = 30;}text_instruction_divided1;
			x=0; y=350;
			
			ellipse_graphic ellipse_instruction;
			x=-100; y=250;
			
			text { caption = ""; font_size = 30;}text_instruction_divided2;
			x=50; y=250;
			
			text { caption = ""; font_size = 30;}text_instruction_divided3;
			x=0; y=50;
			
			bitmap {filename = "heart.png"; width=266; height=150;}bitmap_target_divided;
			x=-100; y=-50;

			text { caption = ""; font_size = 30;}text_instruction_divided4;
			x=100; y=-50;
			
			
			
			text { caption = ""; font_size = 30;}text_instruction_divided5;
			x=0; y=-200;
			
			text { caption = ""; font_size = 30;}text_instruction_divided6;
			x=0; y=-300;
		} picture_instruction_divided;
		
		stimulus_time_in = 1500;
		response_active= true;
		} trial_instruction_divided;
		
	trial {
		trial_duration = 100;
		
		picture {
			text {caption = "Pause. \nIn 2 Minuten geht es weiter."; font_size = 25;} pause_text;
			x=0; y=0;
		};
	} trial_pause;