pcl_file = "Mutli_Dot_Task.pcl";
response_matching = simple_matching;
active_buttons = 2;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255;

scenario_type = fMRI_emulation;
scan_period = 2000;
pulses_per_scan = 1;

begin; 

trial {
	picture {
		text {
			caption = "... Der Scanner wird gestartet ...";
			font_size = 40;
		};
		x=0;y=0;
	};
}trial_sync;

trial {
	trial_type = fixed;
	picture {
		text {
			caption = "+";
			font_size = 40;
		};
		x=0;y=0;
	};
	code = "cross";
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
			- Richten Sie Ihren Blick während
			- der Aufgabe auf das Kreuz in der Mitte";
			font_size = 30;
		}text_pause_bottom;
		x=0;y=-200;
	};
} trial_pause;

trial {
	trial_type = specific_response;
	trial_duration = forever;
	terminator_button = 1;
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

					Drücken Sie mit dem Zeigefinger um fortzufahren.";
		font_size = 30;
		max_text_width = 1200;
		};
		x=0;y=0;
	};
	code = "instruction";
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
		code = "instruction_block";
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