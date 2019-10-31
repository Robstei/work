response_matching = simple_matching;

begin;

trial {




	video {
		filename = "video_main.avi";
	};
	
	time = 1000;
	video {
		filename = "video_test.avi";
	};	
	time = 5000;

	picture {
	ellipse_graphic {
		ellipse_height = 50;
		ellipse_width = 50;
		height = 1000;
		width = 1000;
		color = 255,0,0;
	};
	x = 0;
	y = 0;
	on_top = true;
	}circle;
	time = 4000;
	duration = 2000;
	
	picture {
	ellipse_graphic {
		ellipse_height = 200;
		ellipse_width = 200;
		height = 1000;
		width = 1000;
	};
	x = 0;
	y = 0;
	on_top = true;
	}ada;
	time = 1500;
	duration = 2000;
	
	

sound {
	wavefile {filename = "target.wav";};
};

time = 0;

} trial_test;
begin_pcl;
term.print_line("Hit: " + string(stimulus_data::HIT));
term.print_line("Miss: " + string(stimulus_data::MISS));
term.print_line("FALSE_ALARM: " + string(stimulus_data::FALSE_ALARM));
term.print_line("OTHER: " + string(stimulus_data::OTHER));
trial_test.present();
