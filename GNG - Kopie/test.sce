response_matching = simple_matching;
active_buttons = 2;

begin;

trial {
	trial_duration = 3000;
	
		picture {
			box {
				width = 300;
				height = 300;
				color = 255,0,0;
			};
			x=0;y=0;
		};
		target_button = 1;
		code = "rot";
}trial_test;

begin_pcl;

response_manager.set_button_active(2,false);
trial_test.present();
trial_test.present();


loop int i = 1
until i > response_manager.response_data_count()
begin
	response_data rd = response_manager.get_response_data(i);
	term.print_line(string(rd.button()) + " " + string(rd.time()) + " " + string(rd.type()));
	i = i + 1;
end;