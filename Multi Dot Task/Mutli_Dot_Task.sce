pcl_file = "Mutli_Dot_Task.pcl";
response_matching = simple_matching;
active_buttons = 2;
no_logfile = false;

begin; 

trial {
	trial_type = first_response;
	trial_duration = forever;
	
	picture {
		ellipse_graphic {
		} eg_stimuli;
		x=0;y=0;
	} picture_stimuli;
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
			caption ="";
			font_size = 40;
		}text_pause;
		x=0;y=0;
	};
} trial_pause;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 2;
	picture {
		text{
			caption ="Gleich geht es weiter";
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
		caption = "Im Folgenden werden Ihnen gleichzeitig mehrere farbige Kreise in zufälliger Reihenfolge und unterschiedlicher Position, mehrfach präsentiert.

					Versuchen Sie dabei, so schnell wie möglich zu reagieren, aber auch so wenig Fehler wie möglich zu machen. 

					Feedback darüber, ob Sie richtig oder falsch reagiert haben, wird nicht gegeben. 
					Während der Aufgabe sollen Sie Ihren Blick zudem stets auf den Bildschirm gerichtet halten und das Kreuz in der Mitte fixieren. Zusätzlich sollten Sie sich so wenig wie möglich bewegen.

					Drücken Sie die Taste um fortzufahren.";
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