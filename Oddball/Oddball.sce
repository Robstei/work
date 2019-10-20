pcl_file = "Oddball.pcl";
#scenario_type = fMRI_emulation;
#scan_period = 2000;
active_buttons = 3;
response_matching = simple_matching;
default_font_size = 30;

begin;

	text {
		caption = "Mit der Taste \"A\" können Sie den Ton A abspielen.\nMit der Taste \"L\" können Sie den Ton B abspielen\n\n
						Bitte reagieren Sie mit Druch auf die Leertaste, wenn Sie den Ton A hören. Drücken Sie bitte keine Taste, wenn Sie den Ton B hören.
						Versuchen Sie dabei so schnell wie möglich zu reagieren, aber auch so wenig Fehler wie möglich zu machen.\n
						Feedback darüber, ob Sie richtig oder falsch reagiert haben, wird nicht gegeben.\n
						Während der Aufgabe sollten Sie ihren Blick zudem stets auf den Monitor gerichtet halten.\n
						Es erfolgt kein Testdurchlauf.";
		max_text_width = 1200;
	} text_sound_instructions;
	
	array {
		sound { wavefile { filename = "target.wav";};}sound_target;
		sound { wavefile { filename = "nontarget.wav"; };}sound_nontarget;
	}array_sounds;
	
	array {
		picture { 
			ellipse_graphic { 
			height = EXPARAM("CIRCLE WIDTH" : 100);
			width = EXPARAM("CIRCLE WIDTH": 100);
			ellipse_height = EXPARAM("CIRCLE WIDTH" : 100);
			ellipse_width = EXPARAM("CIRCLE WIDTH" : 100);
			color = 255,0,0;
			};
		x = 0;
		y = 0;
		on_top = true;
		}circle_target;
		picture { 
			ellipse_graphic { 
			height = EXPARAM("CIRCLE WIDTH" : 100);
			width = EXPARAM("CIRCLE WIDTH" : 100);
			ellipse_height = EXPARAM("CIRCLE WIDTH" : 100);
			ellipse_width = EXPARAM("CIRCLE WIDTH" : 100);
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
				caption = "Hallo!\nIm Folgenden werden Ihnen mehrmals unterschiedliche Reize in zufälliger Reihenfolge präsentiert.\nWeiter mit Leertaste";
			};
			x=0;y=0;
		};
	}trial_instructions_start;
	
		trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {
				caption = "Bitte wenden Sie sich an den Versuchsleiter";
			};
			x=0;y=0;
		};
	}trial_instructions_end;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {
				caption = "Bitte reagieren Sie mit Druch auf die Leertaste, wenn";
			};
			x=-400;y= 400;
			
			ellipse_graphic { 
				height = 50;
				width = 50;
				ellipse_height = 50;
				ellipse_width = 50;
				color = 255,0,0;
			} ellipse_graphic_preview_target;
			x = 75;y = 400;
			
			text {
				caption = "erscheint.";
			};
			x = 200;y = 400;
			
			text {
				caption = "Bitte reagieren Sie nicht, wenn";
			};
			x = -222;y = 300;
			
			ellipse_graphic { 
				height = 50;
				width = 50;
				ellipse_height = 50;
				ellipse_width = 50;
				color = 255,0,0;
			} ellipse_graphic_preview_non_target;
			x = 75;y = 300;
			
			text {
				caption = "erscheint";
			};
			x= 200;y= 300;
			text {
				caption = "Versuchen Sie dabei so schnell wie möglich zu reagieren, aber auch so wenig Fehler wie möglich zu machen.\n
						Feedback darüber, ob Sie richtig oder falsch reagiert haben, wird nicht gegeben.\n
						Während der Aufgabe sollten Sie ihren Blick zudem stets auf den Monitor gerichtet halten.\n
						Es erfolgt kein Testdurchlauf.\n
						Dücken Sie nun die Leertaste um zu starten.";
			};
			x=0;y= 0;
			
		
			
			
			
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

