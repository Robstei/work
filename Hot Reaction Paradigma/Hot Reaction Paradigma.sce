pcl_file = "Hot Reaction Paradigma.pcl";
response_matching = simple_matching;
active_buttons = 4;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255;
default_font_size = 30;
default_font = "Arial";

begin;

array {
	bitmap { filename = "stimulus_neutral_1.jpg"; } bitmap_neutral_1;
	bitmap { filename = "stimulus_neutral_2.jpg"; } bitmap_neutral_2;
	bitmap { filename = "stimulus_neutral_3.jpg"; } bitmap_neutral_3;
	bitmap { filename = "stimulus_neutral_4.jpg"; } bitmap_neutral_4;
	bitmap { filename = "stimulus_neutral_5.jpg"; } bitmap_neutral_5;
} array_neutral_bitmaps;

array {
	bitmap { filename = "stimulus_sns_1.jpg"; } bitmap_non_neutral_1;
	bitmap { filename = "stimulus_sns_2.jpg"; } bitmap_non_neutral_2;
	bitmap { filename = "stimulus_sns_3.jpg"; } bitmap_non_neutral_3;
	bitmap { filename = "stimulus_sns_4.jpg"; } bitmap_non_neutral_4;
	bitmap { filename = "stimulus_sns_5.jpg"; } bitmap_non_neutral_5;
} array_non_neutral_bitmaps;

array {
	bitmap bitmap_neutral_1;
	bitmap bitmap_neutral_2;
	bitmap bitmap_neutral_3;
	bitmap bitmap_neutral_4;
	bitmap bitmap_neutral_5;
	bitmap bitmap_non_neutral_1;
	bitmap bitmap_non_neutral_2;
	bitmap bitmap_non_neutral_3;
	bitmap bitmap_non_neutral_4;
	bitmap bitmap_non_neutral_5;
}array_bitmaps;

trial {
	trial_type = first_response;
	trial_duration = forever;
	stimulus_event {
		picture { 
			bitmap { filename = "stimulus_neutral_1.jpg"; } bitmap_trial_test;
			x = 0; y = 0;
			text { caption = "Handelt es sich um ein Icon mit Bezug zu Instagram?
			\n Bitte drücke die Taste \"A\" für \"Ja\" und die Taste \"L\" für \"Nein\""; };
			x = 0; y = -300; 
		} picture_trial_test;
	} stimulus_event_trial_test;
} trial_test;

trial {
	trial_type = fixed;
	trial_duration = 1500;
	
	picture {
		text {
			caption = " ";
		} text_feedback;
		x = 0; y = 0;
	};
} trial_feedback;

trial {
	trial_type = fixed;
	trial_duration = EXPARAM("Pause at start of each block");
	
	picture {
		text {
			caption = " ";
		};
		x = 0; y = 0;
	};
} trial_pause_start_of_block;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		bitmap { filename = "stimulus_feedback_overview.jpg"; };
		x = 0; y = 0;
	};
} trial_feedback_overview;

trial {
	trial_type = fixed;
	trial_duration = EXPARAM("Response Active Duration Stimuli");

	stimulus_event {
		picture {
			bitmap {
				filename = "stimulus_neutral_1.jpg";
			} bitmap_trial_stimuli;
			x=0;y=0;
		} picture_trial_stimuli;
		duration = EXPARAM("Visibility Duration Stimuli");
	} stimulus_event_trial_stimuli;
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
			caption =" ";
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
			filename="instruction_test_run.jpg";
		};
		x=0;y=0;
	};
} trial_instruction_test_run;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	
	picture {
		bitmap {
			filename="instruction_neutral_is_target.jpg";
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