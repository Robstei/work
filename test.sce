response_matching = simple_matching;
active_buttons = 1;
default_background_color = 255,255,255,255;

begin;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		picture {
			bitmap {
				filename="C:/work/Test/stimuli/Umrisse/Blume.png";
				description = "5";
			};
			x=0;y=0;
			
			ellipse_graphic {
				height = 100;
				width = 100;
				ellipse_height = 80;
				ellipse_width= 80;
				color = 255,0,0,255;
			};
			x=0;y=0;
		};
		
	} trial_test;

begin_pcl;

	trial_test.present();