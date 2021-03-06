response_matching = simple_matching;
default_font = "Apercu Mono";
active_buttons = 3;
event_code_delimiter = ";";
stimulus_properties = conditionid, string, trialid, string, form, string, color, string, seperateAttention, number, target, number;
response_logging = log_active;
default_background_color = 60, 60, 60;
default_text_color = 255, 255, 255;

begin;	

	ellipse_graphic {
		color=255,0,0,255;
		ellipse_width = EXPARAM("Circle Diameter" : 100);
		ellipse_height= EXPARAM("Circle Diameter" : 100);
		width = EXPARAM("Circle Diameter" : 100);
		height = EXPARAM("Circle Diameter" : 100);
	}ellipse;
	
	ellipse_graphic {
		color=255,0,0,255;
		ellipse_width = 60;
		ellipse_height = 60;
		width = 70;
		height = 70;
	}ellipse_instruction;
	
	array {
		picture {
			description = "flower";
			bitmap {filename = "flower.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_flower;
		
		picture {
			description = "bell";
			bitmap {filename = "bell.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_bell;
		
		picture {
			description = "heart";
			bitmap {filename = "heart.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_heart;
		
		picture {
			description = "circle";
			bitmap {filename = "circle.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_circle;
		
		picture {
			description = "moon";
			bitmap {filename = "moon.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_moon;
		
		picture {
			description = "star";
			bitmap {filename = "star.png"; width = EXPARAM("Form Width" : 1093); height = EXPARAM("Form Heigth" : 614);};
			x = 0; y = 0;
			
			ellipse_graphic ellipse;
			x = 0;y = 0;
		} main_picture_star;
	} form_array;

	trial {
		trial_duration = EXPARAM("Time Response Active" : 1800);
		trial_type = first_response;
		
		stimulus_event{
		picture {} main_picture;
		duration = EXPARAM("Time Stimulus" : 250);
		}stim_event;
	} trial_main;

	trial {
		picture {
			text {
				caption="+";
				font_size=50;
			};
			x=0; y=0;
		}cross;
	} trial_cross;

	trial {
		trial_duration = EXPARAM("Time Feedback" : 2000);
		picture {
			text { caption = " "; font_size = 24; max_text_width = 600;} text_feedback; 
			x=0; y=0;
		} feedback_pic;
	} trial_feedback;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;

		picture {
			text { caption = " "; font_size = 25; max_text_width = 1200;} text_introduction;
			x=0;y=0;
		} picture_information;
		stimulus_time_in = 1000;
		response_active = true;
	} trial_information;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
			picture {
				text { caption = ""; font_size = 30;}text_instruction_color1;
				x=0; y=200;
				
				ellipse_graphic ellipse_instruction;
				x=-100; y=100;
				
				text { caption = ""; font_size = 30;}text_instruction_color2;
				x=50; y=100;
				
				text { caption = ""; font_size = 30;}text_instruction_color5;
				x=0; y=-200;
				
				text { caption = ""; font_size = 30;}text_instruction_color6;
				x=0; y=-300;
				
			} picture_instruction_color;
			stimulus_time_in = 1500;
			response_active = true;
	
		} trial_instruction_color;
		
		trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
		picture {
			text { caption = ""; font_size = 30;}text_instruction_form3;
			x=0; y=200;
			
			bitmap {filename = "heart.png"; width=266; height=150;}bitmap_target_form;
			x=-100; y=100;

			text { caption = ""; font_size = 30;}text_instruction_form4;
			x=100; y=100;
			
			text { caption = ""; font_size = 30;}text_instruction_form5;
			x=0; y=-200;
			
			text { caption = ""; font_size = 30;}text_instruction_form6;
			x=0; y=-300;
		} picture_instruction_form;
		
		stimulus_time_in = 1500;
		response_active= true;
		} trial_instruction_form;
		
	trial {
		trial_duration = forever;
		trial_type = first_response;
		all_responses = false;
		
		picture {
		
			text { caption = ""; font_size = 30;}text_instruction_divided1;
			x=0; y=350;
			
			ellipse_graphic ellipse_instruction;
			x=-100; y=250;
			
			text { caption = ""; font_size = 30;}text_instruction_divided2;
			x=50; y=250;
			
			text { caption = ""; font_size = 30;}text_instruction_divided3;
			x=0; y=50;
			
			bitmap {filename = "heart.png"; width=266; height=150;}bitmap_target_divided;
			x=-100; y=-50;

			text { caption = ""; font_size = 30;}text_instruction_divided4;
			x=100; y=-50;
			
			
			
			text { caption = ""; font_size = 30;}text_instruction_divided5;
			x=0; y=-200;
			
			text { caption = ""; font_size = 30;}text_instruction_divided6;
			x=0; y=-300;
		} picture_instruction_divided;
		
		stimulus_time_in = 1500;
		response_active= true;
		} trial_instruction_divided;
		
	trial {
		trial_duration = 100;
		
		picture {
			text {caption = " "; font_size = 25;} pause_text;
			x=0; y=0;
		};
	} trial_pause;

	trial {
		trial_type = first_response;
		sound {
			wavefile { filename="pause_end.wav"; };
		};
		
		picture {
			bitmap {filename="star.png"; };
			x=0; y=0;
		};
	} trial_pause_finished;
	
	

################################PCL##############################################	
begin_pcl;
	
	int COLOR = 1;
	int FORM = 2;
	array <int> ISI_values [] = {500, 700, 900, 1100, 1300, 1500, 1700, 1900, 2100, 2300};
	array <int> array_color_indexes [] = {1,2,3,4,5,6};
	
	
	array <string> array_instructions [][] = {
		{ 
			"Drücke die Taste \"L\" wenn",
			"erscheint.",
			"Drücke die Taste \"S\" wenn",
			"erscheint.",
			"Antworte so schnell und richtig wie möglich.",
			"Drücke die Leertaste um weiter zu kommen."
		},
		{
			"Press the key \"L\" if",
			"appears.",
			"Press the key \"S\" if",
			"appears.",
			"React as fast and as correct as possible.",
			"Press space bar to continue."
		}
	};
	
	array<string> array_feedback [2][4]; 
	array_feedback[1][1] = parameter_manager.get_string("Feedback HIT GER", "Richtig.");
	array_feedback[1][2] = parameter_manager.get_string("Feedback INCORRECT GER", "Falsche Taste.");
	array_feedback[1][3] = parameter_manager.get_string("Feedback MISS GER", "Falsch.\nDu hättest drücken müssen.");
	array_feedback[1][4] = parameter_manager.get_string("Feedback FALSE ALARM GER", "Falsch.\nDu hättest nicht drücken müssen.");
		
	array_feedback[2][1] = parameter_manager.get_string("Feedback HIT ENG", "Right.");
	array_feedback[2][2] = parameter_manager.get_string("Feedback INCORRECT ENG", "Wrong key.");
	array_feedback[2][3] = parameter_manager.get_string("Feedback MISS ENG", "You should have reacted.");
	array_feedback[2][4] = parameter_manager.get_string("Feedback FALSE ALARM ENG", "You should not have reacted.");
	
	array<string> array_information[2][6];
	array_information[1][1] =
		"Im Folgenden werden dir auf dem Bildschirm unterschiedliche Farben und Formen präsentiert. " +
		"Vor jedem Durchlauf erhältst du eine kurze Instruktion, auf welche Farben und/oder Formen du reagieren sollst. " + 
		"Die Reaktion erfolgt mit den Tasten \"L\" und \"S\". Reagiere so schnell und so richtig wie möglich.\n\n" +
		#"Zunächst folgt ein Testdurchlauf." +
		"\n\n Drücke die Leertaste, um fortzufahren.";
	array_information[1][2] = 
		"Dies ist ein Testdurchlauf. \n\n Weiter mit Leertaste.";
	array_information[1][3] =
		"Der Testdurchlauf ist vorbei.\n\n" +
		"Im Folgenden wird dir kein Feedback mehr präsentiert.\n\n" +
		"Der erste Durchgang beginnt.\n" + 
		"Weiter mit Leertaste.";
	array_information[1][4] =
		"Der zweite Durchgang beginnt.\n" + 
		"Weiter mit Leertaste.";
	array_information[1][5] =
		"Der dritte Durchgang beginnt.\n" + 
		"Weiter mit Leertaste.";
	array_information[1][6] =
		"Bitte wende dich sich an den Versuchsleiter.";
		
	array_information[2][1] = 
		"In the following, you will see different numbers and shapes on the screen. Before each run, you will receive a brief instruction on " +
		"which numbers and/or shapes you should react to. Please use the keys \"L\" and \"S\". React as fast and as correct as possible." +
		#"\n\nFirst, a test run follows." +
		"\n\nPress space bar to continue.";
	array_information[2][2] = "This is a test run.\n\nSpace bar to continue.";
	array_information[2][3] = "Test run is over.\n\n In the following, no feedback will be given.\n\n" + "The first run begins.\n Space bar to continue.";
	array_information[2][4] = "The second run begins.\n Space bar to continue.";
	array_information[2][5] = "The third run begins.\n Space bar to continue.";
	array_information[2][6] = "Please contact the experimenter.";
	
	int non_targets = parameter_manager.get_int("Non Targets at Start of each Block");
	int language = parameter_manager.get_int("Language");
	
	sub pause_seconds (int time_in_seconds)
	begin
		loop int start_time = clock.time()
		until clock.time() > start_time + time_in_seconds * 1000
		begin
			if language == 1
			then
				pause_text.set_caption("Pause \nIn " + string(time_in_seconds - floor((clock.time() - start_time) / 1000)) + " Sekunden geht es weiter", true);
				trial_pause.present();
			elseif language == 2
			then
				pause_text.set_caption("Break \nIt continues in " + string(time_in_seconds - floor((clock.time() - start_time) / 1000)) + " seconds", true);
				trial_pause.present();
			end;
		end;
	end;
	
	sub pause_minutes (int time_in_minutes)
	begin
		int time_in_seconds = time_in_minutes * 60;
		loop int start_time = clock.time()
		until clock.time() > start_time + time_in_seconds * 1000
		begin
			trial_pause.present();
		end;
			trial_pause_finished.present();
	end;
	
	sub set_logfile_name
	begin
			logfile.set_filename(logfile.subject() + "_" + "swad_kids_" + date_time("mm_dd_yyyy") + ".log");
	end;
	
	sub present_information (string information, int font_size)
	begin
		text_introduction.set_font_size(font_size);
		text_introduction.set_caption(information, true);
		trial_information.present();
	end;
		
	sub set_response_mode (int mode)
	begin
		if mode == 1
		then
			response_manager.set_button_active(1, false);
			response_manager.set_button_active(2, false);
			response_manager.set_button_active(3, true);
		elseif mode == 2
		then
			response_manager.set_button_active(1, true);
			response_manager.set_button_active(2, true);
			response_manager.set_button_active(3, false);
		end;
	end;
	
	# returns true if
	# 1. successive stimuli are never identical
	# 2. first "Non Targets at Start of each Block" (parameter) are non targets
	# 3. successive stimuli are never targets
	
	sub change_color(ellipse_graphic eg, int color_index)
	begin
		if color_index == 1
		then
			eg.set_color(255,0,0,255);
			eg.redraw();
		elseif color_index == 2
		then
			eg.set_color(0,0,0,255);
			eg.redraw();
		elseif color_index == 3
		then
			eg.set_color(255,204,0,255);
			eg.redraw();
		elseif color_index == 4
		then
			eg.set_color(0,102,255,255);
			eg.redraw();
		elseif color_index == 5
		then
			eg.set_color(0,204,0,255);
			eg.redraw();
		elseif color_index == 6
		then
			eg.set_color(153,0,153,255);
			eg.redraw();
		end;
	end;
	
	sub bool validade (array<int,2> list_to_test, int seperate_attention, int form_target_index, 
							int color_target_index, array<int,1> color_indexes)
	begin
		loop int i = 1 until i == list_to_test.count()
		begin
			if list_to_test[i] == list_to_test[i+1]
			then 
				return false;
			end;
			i = i + 1;
		end;
		
		loop int i = 1 until i > non_targets
		begin
			if seperate_attention == 1 
			then
				if color_indexes[list_to_test[i][COLOR]] == color_indexes[color_target_index]
				then
					return false;
				end;
			elseif seperate_attention == 2			
			then
				if list_to_test[i][FORM] == form_target_index
				then
					return false;
				end;
			elseif seperate_attention == 3 &&
				(color_indexes[list_to_test[i][COLOR]] == color_indexes[color_target_index]
				|| list_to_test[i][FORM] == form_target_index)
			then
				return false;
			end;
			i = i + 1;
		end;		
	
		loop int i = (non_targets + 1) until i == list_to_test.count()
		begin
			if seperate_attention == 1
			then
					if color_indexes[list_to_test[i][COLOR]] == color_indexes[color_target_index] &&
					color_indexes[list_to_test[i+1][COLOR]] == color_indexes[color_target_index]
				then 
					return false;
				end;
			elseif seperate_attention == 2
			then
				if list_to_test[i][FORM] == form_target_index &&
					list_to_test[i+1][FORM] == form_target_index 
				then
					return false;
				end;
			elseif seperate_attention == 3 &&
						(color_indexes[list_to_test[i][COLOR]] == color_indexes[color_target_index]
								|| list_to_test[i][FORM] == form_target_index)
			then
				if 
					color_indexes[list_to_test[i+1][COLOR]] == color_indexes[color_target_index]
								|| list_to_test[i+1][FORM] == form_target_index
				then
					return false;
				end;
			end;
			i = i +1;
		end;
		return true;
	end;

	# returns  a 2D array representation of a valid block with given paramters
	# for each pair the first value represents the index of the used char in color_indexes and the second value
	# represents the index of the used form in form_array
	# see make_and_present_block for parameter explanation
	
	sub array<int,2> make_block (int seperate_attention, int color_target_index, array<int,1> color_indexes,
											int form_target_index, int number_of_targets, int number_of_non_targets)
	begin
		array<int> list[0][2];
		array<int> tmp_possible_targets[0][2];
		array<int> tmp_possible_color_targets[0][2];
		array<int> tmp_possible_form_targets[0][2];
		array<int> tmp_possible_non_targets[0][2];
		
		if seperate_attention == 1
		then
			loop int i = 1 until i > form_array.count()
			begin
				array<int> tmp[2];
				tmp[COLOR] = color_target_index;
				tmp[FORM] = i;
				tmp_possible_targets.add(tmp);
				i = i + 1;
			end;
			tmp_possible_targets.shuffle();
			
			loop int i = 1 until i > number_of_targets
			begin
				int index = i % tmp_possible_targets.count();
				if index == 0
				then
					list.add(tmp_possible_targets[tmp_possible_targets.count()]);
				else
					list.add(tmp_possible_targets[index]);
				end;
				i = i + 1;
			end;
			
			loop int color_count = 1 until color_count > color_indexes.count()
			begin
				loop int form_count = 1 until form_count > form_array.count()
				begin
					if color_count != color_target_index
					then
						array<int> tmp[2];
						tmp[COLOR] = color_count;
						tmp[FORM] = form_count;
						tmp_possible_non_targets.add(tmp);
					end;
					form_count = form_count + 1;
				end;
				color_count = color_count + 1;
			end;
			tmp_possible_non_targets.shuffle();		
			
			
			loop int i = 1 until list.count() == number_of_targets + number_of_non_targets
			begin
				int index = i % tmp_possible_non_targets.count();
				if index == 0
				then
					list.add(tmp_possible_non_targets[tmp_possible_non_targets.count()]);
				else
					list.add(tmp_possible_non_targets[index]);
				end;
				i = i + 1;
			end;
			
		elseif seperate_attention == 2
		then
			loop int i = 1 until i > color_indexes.count()
			begin
				array<int> tmp[2];
				tmp[COLOR] = i;
				tmp[FORM] = form_target_index;
				tmp_possible_targets.add(tmp);
				i = i + 1;
			end;
			tmp_possible_targets.shuffle();
			
			loop int i = 1 until i > number_of_targets
			begin
				int index = i % tmp_possible_targets.count();
				if index == 0
				then
					list.add(tmp_possible_targets[tmp_possible_targets.count()]);
				else
					list.add(tmp_possible_targets[index]);
				end;
				i = i + 1;
			end;
			
			loop int color_count = 1 until color_count > color_indexes.count()
			begin
				loop int form_count = 1 until form_count > form_array.count()
				begin
					if form_count != form_target_index
					then
						array<int> tmp[2];
						tmp[COLOR] = color_count;
						tmp[FORM] = form_count;
						tmp_possible_non_targets.add(tmp);
					end;
					form_count = form_count + 1;
				end;
				color_count = color_count + 1;
			end;
			tmp_possible_non_targets.shuffle();		
			
			
			loop int i = 1 until list.count() == number_of_targets + number_of_non_targets
			begin
				int index = i % tmp_possible_non_targets.count();
				if index == 0
				then
					list.add(tmp_possible_non_targets[tmp_possible_non_targets.count()]);
				else
					list.add(tmp_possible_non_targets[index]);
				end;
				i = i + 1;
			end;
		elseif seperate_attention == 3
		then
			loop int i = 1 until i > form_array.count()
			begin
				if i != form_target_index
				then
					array<int> tmp[2];
					tmp[COLOR] = color_target_index;
					tmp[FORM] = i;
					tmp_possible_color_targets.add(tmp);
				end;
				i = i + 1;
			end;
			tmp_possible_color_targets.shuffle();
			
			loop int i = 1 until i > color_indexes.count()
			begin
				if i != color_target_index
				then
					array<int> tmp[2];
					tmp[COLOR] = i;
					tmp[FORM] = form_target_index;
					tmp_possible_form_targets.add(tmp);
				end;
				i = i + 1;
			end;
			tmp_possible_form_targets.shuffle();
			
			loop int i = 1 until i > number_of_targets/2
			begin
				int color_index = i % tmp_possible_color_targets.count();
				if color_index == 0
				then
					list.add(tmp_possible_color_targets[tmp_possible_color_targets.count()]);
				else
					list.add(tmp_possible_color_targets[color_index]);
				end;
				
				int form_index = i % tmp_possible_form_targets.count();
				if form_index == 0
				then
					list.add(tmp_possible_form_targets[tmp_possible_form_targets.count()]);
				else
					list.add(tmp_possible_form_targets[form_index]);
				end;
				i = i + 1;
			end;
			
			loop int color_count = 1 until color_count > color_indexes.count()
			begin
				loop int form_count = 1 until form_count > form_array.count()
				begin
					if color_count != color_target_index && form_count!= form_target_index
					then
						array<int> tmp[2];
						tmp[COLOR] = color_count;
						tmp[FORM] = form_count;
						tmp_possible_non_targets.add(tmp);
					end;
					form_count = form_count + 1;
				end;
				color_count = color_count + 1;
			end;
			tmp_possible_non_targets.shuffle();		
			
			loop int i = 1 until list.count() == number_of_targets + number_of_non_targets
			begin
				int index = i % tmp_possible_non_targets.count();
				if index == 0
				then
					list.add(tmp_possible_non_targets[tmp_possible_non_targets.count()]);
				else
					list.add(tmp_possible_non_targets[index]);
				end;
				i = i + 1;
			end;
		end;
		
		loop until (validade(list, seperate_attention ,form_target_index,
						color_target_index, color_indexes))
		begin
			list.shuffle();
		end;
		return list;
	end;

	# presents a block with given paramters.
	# that means showing instructions, fixation cross and possibly feedback.
	# The block is normally created by make_block() but could be created manually aswell
	# see make_and_present_block for parameter explanation
	
	sub present_block( int seperate_attention, int color_target_index, array<int,1> color_indexes, 
								int form_target_index, array<int> block[][], bool show_feedback, string condition_id, string block_id)
	begin
		
		if seperate_attention == 1
		then
			text_instruction_color1.set_caption(array_instructions[language][1], true);
			
			change_color(ellipse_instruction, color_target_index);
			
			text_instruction_color2.set_caption(array_instructions[language][2], true);
			text_instruction_color5.set_caption(array_instructions[language][5], true);
			text_instruction_color6.set_caption(array_instructions[language][6], true);
			trial_instruction_color.present();
		elseif seperate_attention == 2
		then
			text_instruction_form3.set_caption(array_instructions[language][3], true);
			
			bitmap_target_form.set_filename(bitmap(form_array[form_target_index].get_part(1)).filename());
			bitmap_target_form.load();
			
			text_instruction_form4.set_caption(array_instructions[language][4], true);
			text_instruction_form5.set_caption(array_instructions[language][5], true);
			text_instruction_form6.set_caption(array_instructions[language][6], true);
			trial_instruction_form.present();
		elseif seperate_attention == 3
		then
			text_instruction_divided1.set_caption(array_instructions[language][1], true);
			
			bitmap_target_divided.set_filename(bitmap(form_array[form_target_index].get_part(1)).filename());
			bitmap_target_divided.load();
			
			text_instruction_divided2.set_caption(array_instructions[language][2], true);
			text_instruction_divided3.set_caption(array_instructions[language][3], true);
			
			change_color(ellipse_instruction, color_target_index);
			
			text_instruction_divided4.set_caption(array_instructions[language][4], true);
			text_instruction_divided5.set_caption(array_instructions[language][5], true);
			text_instruction_divided6.set_caption(array_instructions[language][6], true);
			trial_instruction_divided.present();
		end;
		
			
	
	
	
		loop int i = 1 until i > block.count()
		begin
			int color_index = block[i][COLOR];
			int form_index = block[i][FORM];

			main_picture = form_array[form_index];
			change_color(ellipse_graphic(main_picture.get_part(2)), color_index);
			stim_event.set_stimulus(main_picture);
			string tmp_event_code = condition_id + ";" + block_id + ";" + main_picture.description() + 
												";" + string(color_index) + ";" + string(seperate_attention);

			stim_event.set_target_button(0);
			stim_event.set_response_active(true);
			
			if seperate_attention == 1
			then
				if color_target_index == color_index
				then
					stim_event.set_target_button(1);
					stim_event.set_event_code(tmp_event_code + ";" + "1");
				else
					stim_event.set_event_code(tmp_event_code + ";" + "0");
				end;
			elseif seperate_attention == 2
			then
				if form_target_index == form_index
				then 
					stim_event.set_target_button(2);
					stim_event.set_event_code(tmp_event_code + ";" + "2");
				else
					stim_event.set_event_code(tmp_event_code + ";" + "0");
				end;
			elseif seperate_attention == 3 
			then
				if color_target_index == color_index
				then
					stim_event.set_target_button(1);
					stim_event.set_event_code(tmp_event_code + ";" + "1");
				elseif form_target_index == form_index
				then
					stim_event.set_target_button(2);
					stim_event.set_event_code(tmp_event_code + ";" + "2");
				else
					stim_event.set_event_code(tmp_event_code + ";" + "0");
				end;
			else	
			end;
			
			#ISI
			if i == 1
			then 
				trial_cross.set_duration(1000);
			else
				trial_cross.set_duration(ISI_values[random(1,ISI_values.count())]);
			end;
			trial_cross.present();
			set_response_mode(2);
			trial_main.present();
			set_response_mode(1);
			i=i+1;
		
			if show_feedback
			then
				string feedback = "";
				stimulus_data last = stimulus_manager.last_stimulus_data();
				if (last.type() == last.HIT)
				then
					feedback = array_feedback[language][1];
				elseif (last.type() == last.INCORRECT)
				then
					feedback = array_feedback[language][2];
				elseif (last.type() == last.MISS)
				then
					feedback = array_feedback[language][3];
				elseif (last.type() == last.FALSE_ALARM)
				then
					feedback = array_feedback[language][4];
				end;
				
				if feedback != ""
				then
				text_feedback.set_caption(feedback, true);
				trial_feedback.present();	
				end;
			end;
		end;
	end;
	
	#	Parameters for make_and_present_block
	#	1. Value: seperate_attention: 1 = only a color is a target
	#											 2 = only a form is a target
	#											 3 = a color and a form is a target
	#	2. Value: index of color target. Use -1 if no color targets will be presentet
	#	3. Value: color array to be used
	#	4. Value: index of form target in form_array. Use -1 if no form targets will be presentet
	#	5. Value: number of targets in returned trial
	#	6. Value: number of non targets in returned trial
	#	7. Value: bool to determin if feedback will be given. true = feedback
	#	8. Value: condition_id for event_code
	#	9. Value: block_id for event_code
	
	sub make_and_present_block (int seperate_attention, int color_target_index, array<int,1> color_indexes,
											int form_target_index, int number_of_targets, int number_of_non_targets,  
											bool show_feedback, string condition_id, string block_id)
	begin
		array<int> block_presentet[][] = make_block(seperate_attention,color_target_index, array_color_indexes,
											form_target_index, number_of_targets, number_of_non_targets);
		present_block(seperate_attention, color_target_index, array_color_indexes,
											 form_target_index, block_presentet, show_feedback, condition_id, block_id)
	end;
	

	set_response_mode(1);
	set_logfile_name();
	present_information(array_information[language][1], 25);
	
	#make_and_present_block(1, 1, array_color_indexes, -1, 4, 6, true, "test", "1");
	#make_and_present_block(3, 2, array_color_indexes, 1, 4, 6, true, "test", "2");
	
			make_and_present_block(3, 1, array_color_indexes, 1, 7, 19, false, "divided", "1");
			
			pause_minutes(3);
			make_and_present_block(3, 1, array_color_indexes, 1, 8, 18, false, "divided", "2");
			
			pause_minutes(3);
			make_and_present_block(3, 1, array_color_indexes, 1, 9, 17, false, "divided", "3");
			
			pause_minutes(3);
			make_and_present_block(3, 1, array_color_indexes, 1, 6, 20, false, "divided", "4");

	present_information(array_information[language][6], 25);
