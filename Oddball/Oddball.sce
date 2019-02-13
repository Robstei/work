scenario = "PCL program_pulse_manager example";
#scenario_type = fMRI_emulation;
#scan_period = 2000;
active_buttons = 3;
response_matching = simple_matching;
default_font_size = 30;

begin;

	array {
		sound { wavefile { filename = "target.wav";};}sound_target;
		sound { wavefile { filename = "nontarget.wav"; };}sound_nontarget;
	}array_sounds;
	
	video {
		filename = "video_main.avi";
	} video_main_stimulus;
	
	video {
		filename = "video_test.avi";
	} video_test_stimulus;
	
	text{
		caption="Instruction";
	}text_instruction;

	stimulus_event{
		sound{
			wavefile{ 
				filename = "target.wav";
			};
		};
		code = "sound";
	}stimulus_event_target;
	
	stimulus_event{
		sound{
			wavefile{ 
				filename = "nontarget.wav";
			};
		};
		code = "sound";
	}stimulus_event_notarget;
		
	trial {
		trial_duration = 2000;
		trial_type = fixed;
		
		stimulus_event{
			sound{
				wavefile{ 
					filename = "target.wav";
				};
			};
			code = "sound";
		}stimulus_event_novideo;
		
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_main_novideo;
	
	trial{
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_ITI;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text text_instruction;
			x=0;y=0;
		};
	}trial_instruction_nosound;
	
	trial{
		picture{
			text text_instruction;
			x=0;y=0;
		};
		
		sound sound_target;
	}trial_instruction_target;
	
	trial{
		picture{
			text text_instruction;
			x=0;y=0;
		};
		
		sound sound_nontarget;
	}trial_instruction_nontarget;
	
	trial{
		trial_type = first_response;
		trial_duration = forever;
		picture{
			text {caption = "Testdurchlauf beendet. \n\n Mit Leertaste wird der Versuch gestartet";};
			x=0;y=0;
		};
	}trial_instruction_after_test;

	trial{
		video video_main_stimulus;
	}trial_ITI_video;
	
	trial{
		trial_type = fixed;
		
	}trial_main_video;

begin_pcl;

	int ISI_MIN = parameter_manager.get_int("ISI_MIN", 500); 
	int ISI_MAX = parameter_manager.get_int("ISI_MAX", 1000); 
	int ISI_INTERVAL = parameter_manager.get_int("ISI_INTERVAL", 100); 
	int STIMULI_COUNT = parameter_manager.get_int("STIMULI_COUNT", 50);
	int TARGET_COUNT = parameter_manager.get_int("TARGET_COUNT", 15);
	bool FIRST_CAN_BE_TARGET = parameter_manager.get_bool("FIRST_CAN_BE_TARGET", false);
	bool VIDEO_MODE = parameter_manager.get_bool("VIDEO_MODE", true);
	array<int> array_stimuli[0];
	array<int> array_ISIs[0];
	array<int> array_accumulated_ISIs[STIMULI_COUNT];
	array<video> array_videos[0];
	video_main_stimulus.prepare();
	video_test_stimulus.prepare();
	int video_main_stimulus_duration = int(video_main_stimulus.duration());
	#1 = index 2 = target/nontarget 3 = reaction time
	array<int> array_raw_data[STIMULI_COUNT][3];
	
	sub reset_arrays
	begin
		array_stimuli.resize(0);
		array_ISIs.resize(0);
		array_accumulated_ISIs.resize(0);
		array_accumulated_ISIs.resize(STIMULI_COUNT);
		array_videos.resize(0);
		video_main_stimulus.prepare();
		video_test_stimulus.prepare();
		video_main_stimulus_duration = int(video_main_stimulus.duration());
		loop
		until trial_main_video.stimulus_event_count() == 0
		begin
			trial_main_video.remove_stimulus_event(1);
		end;
	end;
	
	
	sub make_ISIs
	begin
		array<int> array_potential_ISIs[0];
		
		loop int candidate = ISI_MIN
		until false
		begin
			if candidate > ISI_MAX
			then
				break;
			else
				array_potential_ISIs.add(candidate);
				candidate = candidate + ISI_INTERVAL;
			end;
		end;
		
		loop int i = 1
		until i > STIMULI_COUNT
		begin
			int ISI_tmp = array_potential_ISIs[random(1,array_potential_ISIs.count())];
			array_ISIs.add(ISI_tmp);
			
			loop int j = i
			until j > STIMULI_COUNT
			begin
				array_accumulated_ISIs[j] = array_accumulated_ISIs[j] + ISI_tmp;
				j = j + 1;
			end;
			
			i = i + 1;
		end;
	end;
	
	sub bool validate
	begin
		array_stimuli.shuffle();
		
		if !FIRST_CAN_BE_TARGET
		then
			if array_stimuli[1] == 1
			then
				return false;
			end;
		end;
		
		return true;
	end;
	
	sub make_trials (bool test_run)
	begin
		loop int i = 1
		until i > TARGET_COUNT
		begin
			array_stimuli.add(1);
			i = i + 1;
		end;
		
		loop
		until array_stimuli.count() == STIMULI_COUNT
		begin
			array_stimuli.add(2);
		end;
		
		loop
		until validate()
		begin
		end;
		
		int repeats_necessary = 0;
		int time_overall = 0;
		
		if test_run
		then
			time_overall = 2000 * STIMULI_COUNT + array_accumulated_ISIs[array_accumulated_ISIs.count()];
			
			loop int time_rest = time_overall
			until false
			begin	
				if time_rest > 0
				then
					time_rest = int(time_rest - video_test_stimulus.duration());
					repeats_necessary = repeats_necessary + 1;
					video tmp_video = new video();
					tmp_video.set_filename("video_test.avi");
					array_videos.add(tmp_video);
				else
					break;
				end;
			end;
		elseif !test_run
		then
			time_overall = 2000 * STIMULI_COUNT + array_accumulated_ISIs[array_accumulated_ISIs.count()];
	
			loop  int time_rest = time_overall
			until false
			begin	
				if time_rest > 0
				then
					time_rest = int(time_rest - video_main_stimulus.duration());
					repeats_necessary = repeats_necessary + 1;
					video tmp_video = new video();
					tmp_video.set_filename("video_main.avi");
					array_videos.add(tmp_video);
				else
					break;
				end;
			end;
		end;
	
		trial_main_video.set_duration(time_overall);
		
		if test_run
		then
			loop int tmp_stimuli = 1; int repeat_count = 0
			until tmp_stimuli > STIMULI_COUNT
			begin
			
			int starttime = (tmp_stimuli-1) * 2000 + array_accumulated_ISIs[tmp_stimuli];
			if starttime > repeat_count * video_test_stimulus.duration()
			then
				video video_tmp = array_videos[repeat_count + 1];
				repeat_count = repeat_count + 1;
				term.print_line("to " + string(time_overall));
				term.print_line("du " + string(video_test_stimulus.duration()));
				term.print_line("rc " + string(repeat_count));
				term.print_line("rn " + string(repeats_necessary));
				if repeat_count == repeats_necessary
				then 
					term.print_line("test12");
					term.print_line(string(mod(time_overall, int(video_test_stimulus.duration()))));

					video_tmp.set_end_time(mod(time_overall, int(video_test_stimulus.duration())));
				end;
				stimulus_event stimulus_event_tmp = trial_main_video.add_stimulus_event(video_tmp);

				stimulus_event_tmp.set_time(int(video_test_stimulus.duration() * (repeat_count - 1)));
		
				continue;
			end;
			#1=target 2=nontarget
			int tmp_sound = array_stimuli[tmp_stimuli];
			stimulus_event stimulus_event_tmp = trial_main_video.add_stimulus_event(array_sounds[tmp_sound]);
			stimulus_event_tmp.set_time(starttime);
			stimulus_event_tmp.set_duration(2000);
			if tmp_sound == 1
			then
				stimulus_event_tmp.set_target_button(1);
			else
				stimulus_event_tmp.set_response_active(true);
			end;
				tmp_stimuli = tmp_stimuli + 1;
			end;
		elseif !test_run
		then
			loop int tmp_stimuli = 1; int repeat_count = 0
			until tmp_stimuli > STIMULI_COUNT
			begin
			
			int starttime = (tmp_stimuli-1) * 2000 + array_accumulated_ISIs[tmp_stimuli];
			if starttime > repeat_count * video_main_stimulus.duration()
			then
				video video_tmp = array_videos[repeat_count + 1];
				repeat_count = repeat_count + 1;
				
				#term.print_line(repeat_count);
				#term.print_line(repeats_necessary);
				if repeat_count == repeats_necessary
				then 
					#term.print_line("test");
					#term.print_line(string(mod(time_overall, int(video_main_stimulus.duration()))));
					video_tmp.set_end_time(mod(time_overall, int(video_main_stimulus.duration())));
				end;
				stimulus_event stimulus_event_tmp = trial_main_video.add_stimulus_event(video_tmp);

				stimulus_event_tmp.set_time(int(video_main_stimulus.duration() * (repeat_count - 1)));
				continue;
			end;
			#1=target 2=nontarget
			int tmp_sound = array_stimuli[tmp_stimuli];
			stimulus_event stimulus_event_tmp = trial_main_video.add_stimulus_event(array_sounds[tmp_sound]);
			stimulus_event_tmp.set_time(starttime);
			stimulus_event_tmp.set_event_code("sound");
			stimulus_event_tmp.set_duration(2000);
			if tmp_sound == 1
			then
				stimulus_event_tmp.set_target_button(1);
			else
				stimulus_event_tmp.set_response_active(true);
			end;
			tmp_stimuli = tmp_stimuli + 1;
			end;
		end;
	end;
		
		
	sub present_trials
	begin
		if !VIDEO_MODE
		then
			loop int i = 1
			until i > array_stimuli.count()
			begin
				int next_sound = array_stimuli[i];
				stimulus_event_novideo.set_stimulus(array_sounds[next_sound]);
				if next_sound == 1
				then
					stimulus_event_novideo.set_target_button(1);
				else
					stimulus_event_novideo.set_target_button(0);
					stimulus_event_novideo.set_response_active(true);
					
				end;
				trial_main_novideo.present();
				trial_ITI.set_duration(array_ISIs[i]);
				trial_ITI.present();
				i = i + 1;
			end;
		elseif VIDEO_MODE
		then
			trial_main_video.present();
				/*int next_sound = array_stimuli[i];
				stimulus_event_video.set_stimulus(array_sounds[next_sound]);
				if next_sound == 1
				then
					stimulus_event_video.set_target_button(1);
				else
					stimulus_event_video.set_target_button(0);
					stimulus_event_video.set_response_active(true);
				end;
				
				video_main_stimulus.prepare();
				term.print_line(mod( (i-1) * 2000 + array_accumulated_ISIs[i],video_main_stimulus_duration));
				video_main_stimulus.set_position(mod( (i-1) * 2000 + array_accumulated_ISIs[i],video_main_stimulus_duration));
				trial_main_video.set_start_time( (i-1) * 2000 + array_accumulated_ISIs[i]);
				trial_main_video.present();
				i = i + 1;
				*/
		end;
	end;
	
	sub report_data
	begin
		output_file all_subjects = new output_file();
		bool new_file_created = all_subjects.open("all_subjects.txt", 0, false);
		if new_file_created
		then
			string variable_names = "ID	Date";
			loop int i = 1
			until i > STIMULI_COUNT
			begin
				variable_names = variable_names + "	T" + string(i) + "_RT";
				variable_names = variable_names + "	T" + string(i) + "_Typ";
				i = i + 1;
			end;
			all_subjects.print_line(variable_names);
		else
			all_subjects.open_append("all_subjects.txt");
		end;
		
		string subject_data = logfile.subject() + "	" + date_time();
		
		loop int i = 1
		until i > STIMULI_COUNT
		begin
			stimulus_data stimulus_data_tmp = stimulus_manager.get_stimulus_data(i);
			subject_data = subject_data + "	" + string(stimulus_data_tmp.reaction_time()) + "	" +
			string(stimulus_data_tmp.type());
			i = i + 1;
		end;
		all_subjects.print_line(subject_data);
	end;
	
	sub present_instruction
	begin
		loop 	bool target_heard; bool nontarget_heard
		until target_heard && nontarget_heard
		begin
			trial_instruction_nosound.present();
		
			int last_response = response_manager.last_response();
			if last_response == 2
			then
				trial_instruction_target.present();
				target_heard = true;
			elseif last_response == 3
			then
				trial_instruction_nontarget.present();
				nontarget_heard = true;
			end;
		end;	

		text_instruction.set_caption("Mit Leertaste weiter", true);

		loop
		until false
		begin
			trial_instruction_nosound.present();
		
			int last_response = response_manager.last_response();
			if last_response == 2
			then
				trial_instruction_target.present();
			elseif last_response == 3
			then
				trial_instruction_nontarget.present();
			elseif last_response == 1
			then
				break;
			end;
		end;
	end;
	
	sub make_and_present_trials (bool test_run)
	begin
		make_ISIs();
		make_trials(test_run);
		present_trials();
		reset_arrays();
	end;
	
	present_instruction();
	make_and_present_trials(true);
	trial_instruction_after_test.present();
	make_and_present_trials(false);
	report_data();

	

