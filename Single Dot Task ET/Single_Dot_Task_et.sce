pcl_file = "Single_Dot_Task_et.pcl";
response_matching = simple_matching;
active_buttons = 2;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255;

begin;

trial {
	trial_type = first_response;
	trial_duration = 700;

	stimulus_event {
		picture {
			ellipse_graphic {
				color = 255, 0, 0, 255;
				ellipse_height = 100;
				ellipse_width = 100;
				height = 200;
				width = 200;
			} eg_stimuli;
			x=0;y=0;
		} picture_stimuli;
		duration = 200;
	} se_stimuli;
} trial_stimuli;

trial {
	trial_type = fixed;
	picture {
		text {
			caption = "+";
			font_size = 40;
		};
		x=0;y=0;
	};
} trial_cross;

trial {
	picture {
		text{
			caption ="Pause\n\nSie haben 3 Minuten Pause.
		An dem Countdown erkennen Sie wann es weiter geht.";
			font_size = 30;
		}text_pause_top;
		x=0;y=300;
		text{
			caption ="";
			font_size = 30;
		}text_pause;
		x=0;y=100;
		text{
			caption ="Bitte denken Sie daran:\n
			- So schnell und richtig wie möglich zu reagieren
			- Sie bekommen kein Feedback
			- Richten Sie Ihren Blick während der Aufgabe auf das Kreuz in der Mitte";
			font_size = 30;
		}text_pause_bottom;
		x=0;y=-200;
	};
} trial_pause;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	picture {
		text{
			caption = "Gleich geht es weiter";
			font_size = 40;
		}text_pause_button;
		x=0;y=0;
	};
} trial_pause_button;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		text {
		caption = "Im Folgenden werden Ihnen zwei unterschiedlich farbige Kreise in zufälliger Reihenfolge, mehrfach präsentiert.

					Versuchen Sie dabei, so schnell wie möglich zu reagieren, aber auch so wenig Fehler wie möglich zu machen. 

					Feedback darüber, ob Sie richtig oder falsch reagiert haben, wird nicht gegeben. 
					Während der Aufgabe sollen Sie Ihren Blick zudem stets auf den Bildschirm gerichtet halten und das Kreuz in der Mitte fixieren.
					
					Drücken Sie die Taste \"M\" um fortzufahren.";
		font_size = 30;
		max_text_width = 1200;
		};
		x=0;y=0;
	};
} trial_instruction;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		text {
		caption = "";
		font_size = 30;
		max_text_width = 1200;
		}text_instruction_block;
		x=0;y=0;
		};
} trial_instruction_block;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		text {
		caption = "Ende\n\n\nDie Aufgabe ist beendet, bitte wenden Sie sich an den Versuchsleiter.";
		font_size = 30;
		max_text_width = 1200;
		};
		x=0;y=0;
		};
} trial_instruction_end;