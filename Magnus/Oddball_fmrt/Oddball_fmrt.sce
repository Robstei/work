pcl_file = "Odball_fmrt.pcl";
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
