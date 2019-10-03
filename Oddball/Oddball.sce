pcl_file = "Oddball.pcl";
#scenario_type = fMRI_emulation;
#scan_period = 2000;
active_buttons = 3;
response_matching = simple_matching;
default_font_size = 30;

begin;

	text {
		caption = "Instruktionen, wenn auf Töne reagiert werden soll.\n Um Target zu hören A drücken für non target L drücken.\n Auf Target mit Leertaste reagieren\n Weiter mit Leertaste";
	} text_sound_instructions;
	
	array {
		sound { wavefile { filename = "target.wav";};}sound_target;
		sound { wavefile { filename = "nontarget.wav"; };}sound_nontarget;
	}array_sounds;
	
	array {
		picture { 
			ellipse_graphic { 
			height = 100;
			width = 100;
			ellipse_height = 100;
			ellipse_width = 100;
			color = 255,0,0;
			};
		x = 0;
		y = 0;
		on_top = true;
		}circle_target;
		picture { 
			ellipse_graphic { 
			height = 100;
			width = 100;
			ellipse_height = 100;
			ellipse_width = 100;
			};
		x = 0;
		y = 0;
		on_top = true;
		} circle_non_target;
	} array_circles;

	stimulus_event{
		sound{
			wavefile{ 
				filename = "target.wav";
			};
		};
		code = "sound";
	}stimulus_event_target;
	
	stimulus_event{
		sound{
			wavefile{ 
				filename = "nontarget.wav";
			};
		};
		code = "sound";
	}stimulus_event_notarget;
		
	trial {
		trial_duration = 2000;
		trial_type = fixed;
		
		stimulus_event{
			sound{
				wavefile{ 
					filename = "target.wav";
				};
			};
			code = "sound";
		}stimulus_event_novideo;
		
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_main_novideo;
	
	trial{
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_ITI;
	
	trial{
		trial_type = fixed;
		trial_duration = 1;
		picture{
		};
	}trial_remove_pictures;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {
				caption = " Instruktionen START. Weiter mit Leertaste";
			};
			x=0;y=0;
		};
	}trial_instructions_start;
	
		trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {
				caption = " Instruktionen ENDE. Weiter mit Leertaste";
			};
			x=0;y=0;
		};
	}trial_instructions_end;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {
				caption = "Instruktionen wenn auf Kreise reagiert werden soll.\nAuf Target mit Leertaste reagieren \n Weiter mit Leertaste";
			};
			x=0;y=-300;
			
			text {
				caption = "Target Farbe";
			};
			x=-200;y=0;
			
			ellipse_graphic { 
				height = 20;
				width = 20;
				ellipse_height = 20;
				ellipse_width = 20;
				color = 255,0,0;
			} ellipse_graphic_preview_target;
			x= 100;y=0;
			
			text {
				caption = "Non Target Farbe";
			};
			x=-200;y=200;
			
			ellipse_graphic { 
				height = 20;
				width = 20;
				ellipse_height = 20;
				ellipse_width = 20;
				color = 255,0,0;
			} ellipse_graphic_preview_non_target;
			x= 200;y=200;
			
		};
	}trial_circle_instructions;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text text_sound_instructions;
			x=0;y=0;
		};
	}trial_sound_instructions_no_sound;
	
	trial{
		picture{
			text text_sound_instructions;
			x=0;y=0;
		};
		
		sound sound_target;
	}trial_sound_instructions_target;
	
	trial{
		picture{
			text text_sound_instructions;
			x=0;y=0;
		};
		
		sound sound_nontarget;
	}trial_sound_instructions_non_target;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {caption = "Testdurchlauf beendet. \n\n Mit Leertaste wird der Versuch gestartet";};
			x=0;y=0;
		};
	}trial_instructions_after_test;

