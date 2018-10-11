#text and color preferences
	default_font_size = 25;
	default_font = "Times new Roman"; 
	default_background_color =242,242,242;
	default_text_color = 0,0,0;
	active_buttons = 2;
	response_logging = log_active;
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
				
		trial {
			trial_type = first_response;
			
			stimulus_event {
					nothing {};
			} se_sound;
				
			stimulus_event {
				picture {
					box {color = 0,0,0; height = 400; width = 600;} box_feedback;
					x = 0; y = 0;
					box {height = 380; width = 580;};
					x = 0; y = 0;
					ellipse_graphic {
						height = 300;
						width = 300;
						ellipse_height = 300;
						ellipse_width= 300;
						color = 0,0,0,0;
				} circle;
				x=0;y=0;
				} picture_visuell;
			} se_visuell;
				
		} trial_main;
		
begin_pcl;

array <int> itiArray[20];
array <int> fixArray[20];
int size_with_circles;
array<int> block_with_circles[0];
array <int> added_iti_array[20];
array <int> start_time_array[0];


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
			
		loop int i = 1; 	int sound_index = 0;
		until i > size_with_circles
		begin
		int tmp_starttime = 0;
			if block_with_circles[i] != 5
			then
				tmp_starttime = added_iti_array[sound_index + 1] + 2000 * (sound_index);
				sound_index = sound_index + 1;
			elseif sound_index == 0
			then
				tmp_starttime = 0
			elseif sound_index == added_iti_array.count() - 1
			then
				tmp_starttime = random(added_iti_array[added_iti_array.count()] + 300, added_iti_array[added_iti_array.count()] + 1700);
			else
				tmp_starttime = random(added_iti_array[sound_index] + 300, added_iti_array[sound_index + 1] - 300) + 2000 * (sound_index);
			end;
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
				if candidate == circle_positions[j] || candidate == 1 || candidate == size_with_circles
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
		bool target;
		
		
		loop int i = 1
		until i > size_with_circles
		begin 
			
			
		se_sound.set_response_active(true);
		se_visuell.set_response_active(false);
		
			if block_with_circles[i] == 1
			then
				se_sound.set_stimulus(sound1);
				target = true;
			elseif block_with_circles[i] == 2
			then
				se_sound.set_stimulus(sound2);
				target = true;
			elseif block_with_circles[i] == 3
			then
				se_sound.set_stimulus(sound3);
				target = false;
			elseif block_with_circles[i] == 4
			then
				se_sound.set_stimulus(sound4);
				target = false;
			elseif block_with_circles[i] == 5
			then
				se_sound.set_response_active(false);
				se_visuell.set_response_active(true);
				sound tmp_sound = sound(se_sound.get_stimulus());
				tmp_sound.set_attenuation(1);
				circle.set_color(0,0,0,255);
				circle.redraw();
			end;
			
			trial_main.set_start_time(start_time_array[i]);
			circle.redraw();
			trial_main.present();
			sound tmp_sound = sound(se_sound.get_stimulus());
			tmp_sound.set_attenuation(0.05);
			circle.set_color(0,0,0,0);
			
			i = i + 1;
			
		end;
	end;
	
	array<int> bla[5] = {2,1,3,4,1};
	make_block(bla,3);
	present_trials();
	loop int bolo = 1 
	until bolo > stimulus_manager.stimulus_count()
	begin
		stimulus_data re = stimulus_manager.get_stimulus_data(bolo);
		term.print_line(
		string(re.reaction_time()) + " " +
		re.stimulus_type() + " " +
		string(re.type()) + " " +
		string(re.button()) + " " +
		string(bolo));
		bolo = bolo + 1;
	end;
	