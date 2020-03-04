pcl_file = "Single_Dot_Task_pictures.pcl";
response_matching = simple_matching;
active_buttons = 2;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255;

begin;

trial {
	trial_type = fixed;
	trial_duration = 700;

	stimulus_event {
		picture {
			bitmap {
				filename = "stimulus_a.jpg";
			} picture_stimuli;
			x=0;y=0;
		} picture_stimuli_container;
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
		bitmap {
			filename="instruction_start.jpg";
		};
		x=0;y=0;
	};
} trial_instruction;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		bitmap {
			filename="instruction1.jpg";
		}picture_instruction_block;
		x=0;y=0;
		};
} trial_instruction_block;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		bitmap {
			filename="instruction_end.jpg";
		};
		x=0;y=0;
		};
} trial_instruction_end;