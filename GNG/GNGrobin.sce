#text and color preferences
	default_font_size = 25;
	default_font = "Times new Roman"; 
	default_background_color =242,242,242;
	default_text_color = 0,0,0;
	active_buttons = 2;
	response_matching = simple_matching;
	default_clear_active_stimuli = false;

begin;
	
	$inheight = 800;
	$inwidth = 1280;		

	array{  
		bitmap {filename = "instructions/modifiziert/instruction1.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/play1.jpg";description = "play1";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/play2.jpg";description = "play2";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/play3.jpg";description = "play3";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/play4.jpg";description = "play4";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice1.jpg";description = "practice1";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice2.jpg";description = "practice2";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice3.jpg";description = "practice3";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice4.jpg";description = "practice4";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice5.jpg";description = "practice5";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/practice6.jpg";description = "practice6";height=$inheight;width=$inwidth;};
	}instructions;
		
	array{  
		bitmap {filename = "instructions/modifiziert/block_A_1.jpg";description = "block_A_1";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/block_A_2.jpg";description = "block_A_2";height=$inheight;width=$inwidth;};
	}blockA;
	
	array{  
		bitmap {filename = "instructions/modifiziert/block_B_1.jpg";description = "block_B_1";height=$inheight;width=$inwidth;};
		bitmap {filename = "instructions/modifiziert/block_B_2.jpg";description = "block_B_2";height=$inheight;width=$inwidth;};
	}blockB;
		
	array {
		sound { wavefile { filename = "sounds/modifiziert/SNS1.wav"; };attenuation = 0.05;}sound1;
		sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 0.05;}sound2;
		sound { wavefile { filename = "sounds/modifiziert/SNS2.wav"; };attenuation = 0.05;}sound3;
		sound { wavefile { filename = "sounds/modifiziert/N2.wav"; };attenuation = 0.05;}sound4;
	}soundarray;
				
	box {color = 0,0,0; height = 400; width = 600;} box_feedback;
	box {height = 380; width = 580;} box_feedback_inner;
	
	trial {
		trial_type = first_response;
		
		stimulus_event {
			
			picture {
				box {color = 0,0,0; height = 400; width = 600;};
				x=0;y=0;
				box {height = 380; width = 580;};
				x=0;y=0;
			};
		
		} se_sound_box;
		
		stimulus_event {
			sound { 
				wavefile {
					filename = "sounds/original/Kugelschreiber.wav"; 
				};
				attenuation = 1;
			};
			code = "sound";
			target_button = 1;
			stimulus_time_out = 2000;
		} se_sound;
		
	} trial_sound;
	
	trial {
		trial_duration = 100;
		
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

			} picture_feedback;
		} se_feedback_box;
		
	} trial_feedback;

		### INSTRUCTIONS ###

	trial {    
		trial_duration = 2500;
		picture {  
			# placeholder - set by PCL
			bitmap {filename = "instructions/modifiziert/play1.jpg";height=$inheight;width=$inwidth;};
			x = 0; y = 0;};
			sound sound1;
			time = 500;
	}inPlay1;
	
	trial {    
		trial_duration = 2500;
		picture {  
			# placeholder - set by PCL
			bitmap {filename = "instructions/modifiziert/play2.jpg";height=$inheight;width=$inwidth;};
			x = 0; y = 0;};
			sound sound2;
			time = 500;
	}inPlay2;
	
	trial {    
		trial_duration = 2500;
		picture {  
			# placeholder - set by PCL
			bitmap {filename = "instructions/modifiziert/play3.jpg";height=$inheight;width=$inwidth;};
			x = 0; y = 0;};
			sound sound3;
			time = 500;
	}inPlay3;
	
	trial {    
		trial_duration = 2500;
		picture {  
			# placeholder - set by PCL
			bitmap {filename = "instructions/modifiziert/play4.jpg";height=$inheight;width=$inwidth;};
			x = 0; y = 0;};
			sound sound4;
			time = 500;
	}inPlay4;		
	
	trial {    
		trial_duration = 7000;
		picture {  
			# placeholder - set by PCL
			box { height = 1; width = 1; color = 0,0,0; };
				x = 0; y = 0;}p_1_2;
			sound sound1;
			time = 500;
			sound sound2;
			time = 3000;
	}play1And2;		
	
	trial {    
		trial_duration = 7000;
		picture {  
			# placeholder - set by PCL
			box { height = 1; width = 1; color = 0,0,0; };
				x = 0; y = 0;}p_3_4;
			sound sound3;
			time = 500;
			sound sound4;
			time = 3000;
	}play3And4;		

### INSTRUCTIONS ###

#--  PARTICIPANT PAGE  --#
		trial {
		stimulus_event {
			picture {
				#background_color = 255,255,255;
				 text {
					caption = "Bitte tun sie irgendwas!"; 
					} inputPageText;
					x = 0;
					y = 0;     
				  
				  text {
					caption = " "; 
					font_color = 0,0,0; 
					background_color = 150,150,150;
					height = 30;
					width = 120;
					} input;
					x = 0;
					y = -30;   
			} exp_eingabe;
			duration = response;
			}participantEvent;
		}inputPage; 
	#-- /PARTICIPANT PAGE  --#
	
		
#--  SPACE PAGE  --#
	trial {
		trial_duration = forever;
		trial_type = specific_response;    	
		terminator_button = 2; 
		stimulus_event {
			picture {
				text {caption ="Bitte tun sie irgendwas!";}spacePageText;
			x = 0; y = 0;};
		};
	}spacePage; 
#-- /SPACE PAGE  --#

begin_pcl;

array <int> itiArray[12];
array <int> fixArray[12];
int size_with_circles;
array<int> block_with_circles[0];
array <int> added_iti_array[12];
array <int> added_fix_array[12];
array <int> start_time_array[0];
array<int> all_orders_without_circles[4][0];

string vpCode = "";
int experimentGroup = 0;

response_manager.set_button_active(2, false);

#--  SHOW PARTICIPANT PAGE  --#
		#first page where the experimenteer is supposed to insert the participant number
		sub showInputPage (int condition)	
		begin				
			#response_data feedback; 
			if condition == 1 then
				loop
					bool correctInput = false
				until
					correctInput == true
				begin
					inputPageText.set_caption("Bitte Versuchspersonencode eingeben:");
					inputPageText.redraw();
					vpCode = system_keyboard.get_input( exp_eingabe, input );
					if vpCode != "" then
						correctInput = true;
					else
						spacePageText.set_caption("ERROR!\n\nBitte geben Sie einen Code an!\nDrücken Sie Leertaste um fortzufahren.");
						spacePageText.redraw();
						spacePage.present();
					end;
				end;
			elseif condition == 2 then
				loop
					bool correctInput = false
				until
					correctInput == true
				begin
					inputPageText.set_caption("Bitte Gruppe eingeben (1 oder 2):");
					inputPageText.redraw();
					string group = system_keyboard.get_input( exp_eingabe, input );
					
					if group == "1" || group == "2" then
						experimentGroup = int(group);
						correctInput = true;
					else
						spacePageText.set_caption("ERROR!\n\nBitte eine zulässige Gruppe eingeben!\nDrücken Sie Leertaste um fortzufahren.");
						spacePageText.redraw();
						spacePage.present();
					end;
				end;
			end;		
		end;	
#-- /SHOW PARTICIPANT PAGE  --#

#--  STIMULI RANDOMIZATION  --#
	sub stimuliRandomization
	begin						
		array<int> order1[12] = {1,2,3,1,4,2,3,4,1,3,2,4};
		array<int> order2[12] = {1,2,3,2,4,1,4,3,1,4,2,3};
		array<int> order3[12] = {2,1,4,3,1,2,4,3,2,1,3,4};
		array<int> order4[12] = {4,1,2,3,1,2,4,3,4,2,3,1};
		
		all_orders_without_circles.add(order1);
		all_orders_without_circles.add(order2);
		all_orders_without_circles.add(order3);
		all_orders_without_circles.add(order4);
		
		all_orders_without_circles.shuffle();
		#shuffle arrays
		array<int> setOrder[4] = {1,2,3,4};
		setOrder.shuffle();		
		
		/*
		loop 
			int i = 1 
		until
			i > setOrder.count()
		begin
			array<int> bufferArray[12];
			if setOrder[i] == 1 then
				bufferArray = order1;
			elseif setOrder[i] == 2 then
				bufferArray = order2;
			elseif setOrder[i] == 3 then
				bufferArray = order3;
			elseif setOrder[i] == 4 then
				bufferArray = order4;
			end;
			
			if i == 1 then
				block1Order = bufferArray;
			elseif i == 2 then
				block2Order = bufferArray;
			elseif i == 3 then
				block3Order = bufferArray;
			elseif i == 4 then
				block4Order = bufferArray;
			end;
			
			i = i + 1;
		end;
		*/
	end;
#--  STIMULI RANDOMIZATION  --# 
	
	sub randomizeTiming
		begin
			
			int value1 = 1000;
			int value2 = 1500;
			int value3 = 2000;
			int value4 = 2500;
			
			itiArray[1] = value1;
			itiArray[2] = value1;
			itiArray[3] = value1;
			itiArray[4] = value2;
			itiArray[5] = value2;			
			itiArray[6] = value2;
			itiArray[7] = value3;
			itiArray[8] = value3;
			itiArray[9] = value3;
			itiArray[10] = value4;			
			itiArray[11] = value4;
			itiArray[12] = value4;
			/*itiArray[13] = value3;
			itiArray[14] = value3;
			itiArray[15] = value3;			
			itiArray[16] = value4;
			itiArray[17] = value4;
			itiArray[18] = value4;
			itiArray[19] = value4;
			itiArray[20] = value4;			
			*/
			
			value1 = 750;
			value2 = 1000;
			value3 = 1250;
			value4 = 1500;
			
			fixArray[1] = value1;
			fixArray[2] = value1;
			fixArray[3] = value1;
			fixArray[4] = value2;
			fixArray[5] = value2;			
			fixArray[6] = value2;
			fixArray[7] = value3;
			fixArray[8] = value3;
			fixArray[9] = value3;
			fixArray[10] = value4;			
			fixArray[11] = value4;
			fixArray[12] = value4;
			/*fixArray[13] = value3;
			fixArray[14] = value3;
			fixArray[15] = value3;			
			fixArray[16] = value4;
			fixArray[17] = value4;
			fixArray[18] = value4;
			fixArray[19] = value4;
			fixArray[20] = value4;			
			*/			
			
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
		term.print_line("block Flag 1");
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
					candidate == circle_positions[j] - 1
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
		term.print_line("block Flag 2");
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
		term.print_line("block Flag 3");
	end;
	
	sub check_feedback (int last_picture_number)
	begin
		if stimulus_manager.stimulus_count() == last_picture_number
			then
				stimulus_data last = stimulus_manager.get_stimulus_data(last_picture_number);
				if last.type() == last.HIT
				then
					box_feedback.set_color(0,255,0);
				elseif last.type() == last.MISS || last.type() == last.FALSE_ALARM
				then
					box_feedback.set_color(255,0,0);
				end;
			end;
	end;
		
	sub present_block (array<int,1> block, int condition)
	begin
		randomizeTiming();
		make_start_time_array();
		int last_picture_number = 0;
		
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
				trial_sound.present();
				last_picture_number = last_picture_number + 1;
				
			elseif block_with_circles[i] == 5
			then
				check_feedback(last_picture_number);
				trial_circle.set_start_time(start_time_array[i]);
				check_feedback(last_picture_number);
				trial_circle.present();
				check_feedback(last_picture_number);
				trial_circle.present();
				check_feedback(last_picture_number);
				trial_circle.present();
			end;
			
			loop bool time_for_next_stimuli;
			until time_for_next_stimuli
			begin
				check_feedback(last_picture_number);

				if i < start_time_array.count()
				then
					if start_time_array[i+1] - clock.time() > 100 
					then
						#trial_feedback.set_duration(start_time_array[i+1] - clock_time);
						trial_feedback.present();
					else
						time_for_next_stimuli = true;
					end;
				else
					term.print_line(i);
					loop int feedback_at_end
					until feedback_at_end == 15
					begin
						check_feedback(last_picture_number);
						trial_feedback.present();
						feedback_at_end = feedback_at_end + 1;
					end;
					time_for_next_stimuli = true;
				end;
			end;
			box_feedback.set_color(0,0,0);
			i = i + 1;	
		end;
	end;
	
	#showInputPage(1);
	#showInputPage(2);
	
	term.print_line(all_orders_without_circles);
	term.print_line("flag 1");
	array<int> bla[4] = {2,1,3,4};
	stimuliRandomization();
	term.print_line("flag 2");
	make_block(all_orders_without_circles[1],1);
	#present_block(block_with_circles, 1);

	term.print_line("flag 3");
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

	term.print_line(all_orders_without_circles);
	term.print_line(string(stimulus_manager.stimulus_count()));