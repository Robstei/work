scenario = "PCL program_pulse_manager example";
#scenario_type = fMRI_emulation;
#scan_period = 2000;
active_buttons = 1;
response_matching = simple_matching;

begin;

	array {
		sound { wavefile { filename = "target.wav";};}sound_target;
		sound { wavefile { filename = "nontarget.wav"; };}sound_nontarget;
	}array_sounds;
	
	video {
		filename = "video.avi";
	} video_stimulus;

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
		
		video video_stimulus;

		stimulus_event{
			sound{
				wavefile{ 
					filename = "target.wav";
				};
			};
			code = "sound";
		}stimulus_event_video;
			
	}trial_main_video;

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
		video video_stimulus;
	}trial_ITI_video;
	
	trial{
		trial_duration = stimuli_length;
		trial_type = fixed;
		
		video video_stimulus;		
	}trial_testing;

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
	video_stimulus.prepare();
	int video_stimulus_duration = int(video_stimulus.duration());
	#1 = index 2 = target/nontarget 3 = reaction time
	array<int> array_raw_data[STIMULI_COUNT][3];
	
	
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
	
	sub make_trials
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
		int time_overall = 2000 * STIMULI_COUNT + array_accumulated_ISIs[array_accumulated_ISIs.count()];
		
		loop  
		until false
		begin	
			if time_overall > video_stimulus.duration()
			then
				time_overall = int(time_overall - video_stimulus.duration());
				repeats_necessary = repeats_necessary + 1;
				video tmp_video = new video();
				tmp_video.set_filename("video.avi");
				array_videos.add(tmp_video);
			else
				break;
			end;
		end;
		
		
		loop int tmp_stimuli = 1; int repeat_count = 1
		until tmp_stimuli > STIMULI_COUNT
		begin
		
		int starttime = (tmp_stimuli-1) * 2000 + array_accumulated_ISIs[tmp_stimuli];
		if starttime > repeat_count * video_stimulus.duration()
		then
			video video_tmp = array_videos[repeat_count];
			
			if repeat_count == repeats_necessary
			then 
				video_tmp.set_end_time(mod(time_overall, int(video_stimulus.duration())));
			end;
			stimulus_event stimulus_event_tmp = trial_testing.add_stimulus_event(video_tmp);

			stimulus_event_tmp.set_time(int(video_stimulus.duration() * repeat_count + 100));
	
			repeat_count = repeat_count + 1;
			continue;
		end;
		#1=target 2=nontarget
		int tmp_sound = array_stimuli[tmp_stimuli];
		stimulus_event stimulus_event_tmp = trial_testing.add_stimulus_event(array_sounds[tmp_sound]);
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
			trial_testing.present();
				/*int next_sound = array_stimuli[i];
				stimulus_event_video.set_stimulus(array_sounds[next_sound]);
				if next_sound == 1
				then
					stimulus_event_video.set_target_button(1);
				else
					stimulus_event_video.set_target_button(0);
					stimulus_event_video.set_response_active(true);
				end;
				
				video_stimulus.prepare();
				term.print_line(mod( (i-1) * 2000 + array_accumulated_ISIs[i],video_stimulus_duration));
				video_stimulus.set_position(mod( (i-1) * 2000 + array_accumulated_ISIs[i],video_stimulus_duration));
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
		
	end;
	
	make_ISIs();
	make_trials();
	present_trials();
	report_data();

	

