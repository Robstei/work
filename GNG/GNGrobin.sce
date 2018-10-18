#text and color preferences
	default_font_size = 25;
	default_font = "Times new Roman"; 
	default_background_color =242,242,242;
	default_text_color = 0,0,0;
	active_buttons = 2;
	response_matching = simple_matching;

begin;
	
	$inheight = 800;
	$inwidth = 1280;		

array{  
			bitmap {filename = "instructions/original/instruction1.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/play1.jpg";description = "play1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/play2.jpg";description = "play2";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/play3.jpg";description = "play3";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/play4.jpg";description = "play4";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice1.jpg";description = "practice1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice2.jpg";description = "practice2";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice3.jpg";description = "practice3";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice4.jpg";description = "practice4";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice5.jpg";description = "practice5";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/practice6.jpg";description = "practice6";height=$inheight;width=$inwidth;};
		}instructions;
		
		array{  
			bitmap {filename = "instructions/original/block_A_1.jpg";description = "block_A_1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/block_A_2.jpg";description = "block_A_2";height=$inheight;width=$inwidth;};
		}blockA;
		
		array{  
			bitmap {filename = "instructions/original/block_B_1.jpg";description = "block_B_1";height=$inheight;width=$inwidth;};
			bitmap {filename = "instructions/original/block_B_2.jpg";description = "block_B_2";height=$inheight;width=$inwidth;};
		}blockB;
		
		array {
		sound { wavefile { filename = "sounds/original/Kugelschreiber.wav"; };attenuation = 0.05;}sound1;
		sound { wavefile { filename = "sounds/original/Locher.wav"; };attenuation = 0.05;}sound2;
		sound { wavefile { filename = "sounds/original/Schere_zweimal.wav"; };attenuation = 0.05;}sound3;
		sound { wavefile { filename = "sounds/original/Tacker.wav"; };attenuation = 0.05;}sound4;
		}soundarray;
				
		box {color = 0,0,0; height = 400; width = 600;} box_feedback;
		box {height = 380; width = 580;} box_feedback_inner;
		
		trial {
			trial_type = fixed;
			trial_duration = stimuli_length;
			
			stimulus_event {
				
				picture {
					box {color = 0,0,0; height = 400; width = 600;};
					x=0;y=0;
					box {height = 380; width = 580;};
					x=0;y=0;
				};
			response_active = true;
			
			} se_sound_box;
			
			stimulus_event {
				sound { 
					wavefile {
						filename = "sounds/original/Kugelschreiber.wav"; 
					};
					attenuation = 1;
				};
				target_button = 1;
				stimulus_time_out = 2000;
			} se_sound;
			
		} trial_sound;
		
		trial {
			trial_duration = 300;
			stimulus_event {
				picture {
					box box_feedback;
					x=0;y=0;
					
					box box_feedback_inner;
					x=0;y=0;
					
					ellipse_graphic {
						height = 300;
						width = 300;
						ellipse_height = 300;
						ellipse_width= 300;
						color = 0,0,0,255;
					} circle;
					x=0;y=0;
				};

			} se_circle;
		} trial_circle;
		
		trial {
			trial_type = fixed;
			trial_duration = 100;
			
			stimulus_event {
				picture {
					box box_feedback;
					x=0;y=0;
					
					box box_feedback_inner;
					x=0;y=0;
				};
			#code = "feedback";
			} se_feedback_box;
			
		} trial_feedback;
		
begin_pcl;

array <int> itiArray[20];
array <int> fixArray[20];
int size_with_circles;
array<int> block_with_circles[0];
array <int> added_iti_array[20];
array <int> added_fix_array[20];
array <int> start_time_array[0];
response_manager.set_button_active(2, false);


sub randomizeTiming
		begin
			
			int value1 = 1000;
			int value2 = 1500;
			int value3 = 2000;
			int value4 = 2500;
			
			itiArray[1] = value1;
			itiArray[2] = value1;
			itiArray[3] = value1;
			itiArray[4] = value1;
			itiArray[5] = value1;			
			itiArray[6] = value2;
			itiArray[7] = value2;
			itiArray[8] = value2;
			itiArray[9] = value2;
			itiArray[10] = value2;			
			itiArray[11] = value3;
			itiArray[12] = value3;
			itiArray[13] = value3;
			itiArray[14] = value3;
			itiArray[15] = value3;			
			itiArray[16] = value4;
			itiArray[17] = value4;
			itiArray[18] = value4;
			itiArray[19] = value4;
			itiArray[20] = value4;			
			
			value1 = 750;
			value2 = 1000;
			value3 = 1250;
			value4 = 1500;
			
			fixArray[1] = value1;
			fixArray[2] = value1;
			fixArray[3] = value1;
			fixArray[4] = value1;
			fixArray[5] = value1;			
			fixArray[6] = value2;
			fixArray[7] = value2;
			fixArray[8] = value2;
			fixArray[9] = value2;
			fixArray[10] = value2;			
			fixArray[11] = value3;
			fixArray[12] = value3;
			fixArray[13] = value3;
			fixArray[14] = value3;
			fixArray[15] = value3;			
			fixArray[16] = value4;
			fixArray[17] = value4;
			fixArray[18] = value4;
			fixArray[19] = value4;
			fixArray[20] = value4;			
			
			itiArray.shuffle();
			fixArray.shuffle();
			
		end;
	
	sub make_start_time_array
	begin
		loop int i = 1
		until i > itiArray.count()
		begin
			int added_iti = 0;
			loop int j = 1
			until j == i 
			begin
				added_iti = added_iti + itiArray[j];
				j = j + 1;
			end;
			added_iti_array[i] = added_iti;
			i = i + 1;
		end;
		
		loop int i = 1
		until i > fixArray.count()
		begin
			int added_fix = 0;
			loop int j = 1
			until j > i 
			begin
				added_fix = added_fix + fixArray[j];
				j = j + 1;
			end;
			added_fix_array[i] = added_fix;
			i = i + 1;
		end;
			
		loop int i = 1; 	int sound_index = 1;
		until i > size_with_circles
		begin
		int tmp_starttime = 0;
			if block_with_circles[i] != 5
			then
				tmp_starttime = added_iti_array[sound_index] + added_fix_array[sound_index] + 2500 * (sound_index - 1) ;
				sound_index = sound_index + 1;
			else
				int tmp_trial_before = added_iti_array[sound_index - 1] + added_fix_array[sound_index - 1] + (sound_index - 2) * 2500;
				int tmp_trial_after = added_iti_array[sound_index] + added_fix_array[sound_index] + (sound_index - 1) * 2500;
				#term.print_line("before:" + string(tmp_trial_before));
				#term.print_line("after:" + string(tmp_trial_after));
				tmp_starttime = random(tmp_trial_before + 300, tmp_trial_after - 300);
			end;
		#term.print_line( "st " + string(tmp_starttime) + " " + string(block_with_circles[i]) + " ");
		start_time_array.add(tmp_starttime);
		i = i + 1;
		end;
	end;
	
	sub make_block(array<int> block[], int circles)
	begin
		size_with_circles = block.count() + circles;
		block_with_circles.resize(0);
		array<int> circle_positions[circles];
		
		loop int i = 1
		until i > circles
		begin
			int candidate = random(1,size_with_circles);
			bool valid = true;
			loop int j = 1
			until j > circle_positions.count()
			begin
				if candidate == circle_positions[j] || 
					candidate == 1 || 
					candidate == size_with_circles ||
					candidate == circle_positions[j] + 1 ||
					candidate == circle_positions[j] -1
				then
					valid = false;
				end;
				j = j + 1;
			end;
			if valid
			then
			circle_positions[i] = candidate;
			i = i + 1;
			end;
		end;	
		
		loop int i = 1; int sound_item = 1;
		until i > size_with_circles
		begin
		bool added_this_itteration = false;
			loop int j = 1
			until j > circle_positions.count()
			begin
				if i == circle_positions[j]
				then
					block_with_circles.add(5);
					added_this_itteration = true;
				end;
				j = j + 1;
			end;
			
			if !added_this_itteration
			then
				block_with_circles.add(block[sound_item]);
				sound_item = sound_item + 1;
			end;
			i = i + 1;
		end;
	end;
	
	sub present_trials
	begin
		randomizeTiming();
		make_start_time_array();
		
		loop int i = 1
		until i > size_with_circles
		begin
		
			if block_with_circles[i] == 1
			then
				se_sound.set_stimulus(sound1);
			elseif block_with_circles[i] == 2
			then
				se_sound.set_stimulus(sound2);
			elseif block_with_circles[i] == 3
			then
				se_sound.set_stimulus(sound3);
			elseif block_with_circles[i] == 4
			then
				se_sound.set_stimulus(sound4);
			end;
			if block_with_circles[i] != 5
			then
				trial_sound.set_start_time(start_time_array[i]);
				se_sound.set_target_button(1);
				term.print(se_sound.response_active());
				trial_sound.present();
			elseif block_with_circles[i] == 5
			then
				trial_circle.set_start_time(start_time_array[i]);
				trial_circle.present();
			end;
			bool time_for_next_stimuli = false;
			loop 
			until time_for_next_stimuli
			begin
				int clock_time = clock.time();
				if i < size_with_circles
				then
					if start_time_array[i+1] - clock_time > 200 
					then
						#trial_feedback.set_duration(start_time_array[i+1] - clock_time);
						trial_feedback.present();
					end;
				end;
				if i == size_with_circles
				then
					time_for_next_stimuli = true;
				elseif clock_time > start_time_array[i+1]
				then
					time_for_next_stimuli = true;
				end;
			end;
			i = i + 1;	
		end;
	end;
	
	array<int> bla[2] = {1,2};
	make_block(bla,0);
	present_trials();
	term.print_line(added_iti_array);
	term.print_line(added_fix_array);
	term.print_line(start_time_array);
	term.print_line(block_with_circles);
	loop int bolo = 1 
	until bolo > stimulus_manager.stimulus_count()
	begin
		stimulus_data re = stimulus_manager.get_stimulus_data(bolo);
		term.print_line(
		string(re.reaction_time()) + " " +
		re.stimulus_type() + " " +
		string(re.type()) + " " +
		string(re.button()) + " " +
		re.event_code() + " " +
		string(re.time()) + " " +
		string(bolo));
		bolo = bolo + 1;
	end;
	
	term.print_line(string(stimulus_manager.stimulus_count()));