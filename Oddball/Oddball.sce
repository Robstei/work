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
		}stimulus_event_sound;
		
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_main;
	
	trial{
		picture{
			text{
				caption = "+";
				font_size = 50;
			};
			x=0;y=0;
		};
	}trial_cross;


begin_pcl;

	int ISI_MIN = parameter_manager.get_int("ISI_MIN", 500); 
	int ISI_MAX = parameter_manager.get_int("ISI_MAX", 1000); 
	int ISI_INTERVAL = parameter_manager.get_int("ISI_INTERVAL", 100); 
	int TRIAL_COUNT = parameter_manager.get_int("TRIAL_COUNT", 50);
	int TARGET_COUNT = parameter_manager.get_int("TARGET_COUNT", 15);
	bool FIRST_CAN_BE_TARGET = parameter_manager.get_bool("FIRST_CAN_BE_TARGET", false);
	array<int> array_trials[0];
	array<int> array_potential_ISIs[0];
	
	sub make_ISIs
	begin
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
	end;
	
	sub bool validate
	begin
		array_trials.shuffle();
		
		if !FIRST_CAN_BE_TARGET
		then
			if array_trials[1] == 1
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
			array_trials.add(1);
			i = i + 1;
		end;
		
		loop
		until array_trials.count() == TRIAL_COUNT
		begin
			array_trials.add(2);
		end;
		
		loop
		until validate()
		begin
		end;
	end;

	sub present_trials
	begin
		loop int i = 1
		until i > array_trials.count()
		begin
			int next_sound = array_trials[i];
			stimulus_event_sound.set_stimulus(array_sounds[next_sound]);
			if next_sound == 1
			then
				stimulus_event_sound.set_target_button(1);
			else
				stimulus_event_sound.set_target_button(0);
				stimulus_event_sound.set_response_active(true);
				
			end;
			trial_main.present();
			trial_cross.set_duration(array_potential_ISIs[random(1,array_potential_ISIs.count())]);
			trial_cross.present();
			i = i + 1;
		end;
	end;
	
	
make_ISIs();
make_trials();
present_trials();

