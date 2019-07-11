pcl_file = "test.pcl";
response_matching = simple_matching;
active_buttons = 1;

begin;
array {
bitmap { filename = "cat2.jpg"; }custom_btmp;
}btmap_aary;
			
trial {
	trial_type = fixed;
	trial_duration = 3000;
	
	stimulus_event {
		picture {
			text {
				caption = "this is a test";
				font_size = 40;
			}test_text;
			x=0;y=0;
		}picture_test;
		duration = 1000;
		code = "important stimulus";
	}se;
}trial_test;


trial {
	trial_type = fixed;
	trial_duration = 3000;
	
	stimulus_event {
		picture {
			bitmap { 
				filename = "cat.jpg";
				}cat_btmp;
				x=0;y=0;
		}picture_cat;
		duration = 1000;
		code = "important cat";
	}se_cat;
}trial_cat;