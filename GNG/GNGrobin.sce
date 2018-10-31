#text and color preferences
	default_font_size = 25;
	default_font = "Times new Roman"; 
	default_background_color =242,242,242;
	default_text_color = 0,0,0;
	active_buttons = 3;
	response_matching = simple_matching;
	default_clear_active_stimuli = false;

begin;
	
	$inheight = 800;
	$inwidth = 1280;		

	array{  
		bitmap {filename = "instructions/Folie1.jpg";description = "instruction1";height=$inheight;width=$inwidth;}instructions1;
		bitmap {filename = "instructions/Folie2.jpg";description = "instruction2";height=$inheight;width=$inwidth;}instructions2;
		bitmap {filename = "instructions/Folie3.jpg";description = "instruction3";height=$inheight;width=$inwidth;}instructions3;
		bitmap {filename = "instructions/Folie4.jpg";description = "instruction4";height=$inheight;width=$inwidth;}instructions4;
		bitmap {filename = "instructions/Folie5.jpg";description = "instruction5";height=$inheight;width=$inwidth;}instructions5;
		bitmap {filename = "instructions/Folie6.jpg";description = "instruction6";height=$inheight;width=$inwidth;}instructions6;
		bitmap {filename = "instructions/Folie7.jpg";description = "instruction7";height=$inheight;width=$inwidth;}instructions7;
		bitmap {filename = "instructions/Folie8.jpg";description = "instruction_after";height=$inheight;width=$inwidth;}instructions8;
		#bitmap {filename = "instructions/Folie9.jpg";description = "practice4";height=$inheight;width=$inwidth;}instructions1;
		bitmap {filename = "instructions/Folie10.jpg";description = "target";height=$inheight;width=$inwidth;}instructions10;
		bitmap {filename = "instructions/Folie11.jpg";description = "non_target";height=$inheight;width=$inwidth;}instructions11;
		bitmap {filename = "instructions/Folie12.jpg";description = "end";height=$inheight;width=$inwidth;}instructions12;
	}instructions;
	
	array {
		sound { wavefile { filename = "sounds/modifiziert/SNS1.wav"; };attenuation = 0.05;}sound1;
		sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 0.05;}sound2;
		sound { wavefile { filename = "sounds/modifiziert/SNS2.wav"; };attenuation = 0.05;}sound3;
		sound { wavefile { filename = "sounds/modifiziert/N2.wav"; };attenuation = 0.05;}sound4;
	}soundarray;
				
	box {color = 0,0,0; height = 400; width = 600;} box_feedback;
	box {height = 380; width = 580;} box_feedback_inner;
	
	picture {
		#background_color = 255,255,255;
		 
			text {
			caption = "Bitte Versuchspersonencode eingeben:"; 
			};
			x = 0;
			y = 0;     
		  
		
		  text {
			caption = " "; 
			font_color = 0,0,0; 
			background_color = 150,150,150;
			height = 30;
			width = 120;
			} text_vpncode;
			x = 0;
			y = -30;   
	}picture_vpncode;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		stimulus_event {
			picture {
				bitmap {filename = "instructions/Folie1.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			}picture_instruction;
		};
	}trial_instruction1;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		stimulus_event {
			picture {
				bitmap {filename = "instructions/Folie2.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
		};
	}trial_instruction2;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		stimulus_event {
			picture {
				bitmap {filename = "instructions/Folie3.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
		};
	}trial_instruction3;
	
	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
		
		picture {
			bitmap {filename = "instructions/Folie4.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
		
		sound { wavefile { filename = "sounds/modifiziert/SNS1.wav"; };attenuation = 0.05;};
		time = 0;
	
		
		sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 0.05;};
		time = 2000;
		
	}trial_instruction4;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		picture {
			bitmap {filename = "instructions/Folie4.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
	}trial_instruction4_no_sound;
	
	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
		
		picture {
			bitmap {filename = "instructions/Folie5.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};

		sound { wavefile { filename = "sounds/modifiziert/SNS2.wav"; };attenuation = 0.05;};
		time = 0;
		
		sound { wavefile { filename = "sounds/modifiziert/N2.wav"; };attenuation = 0.05;};
		time = 2000;
		
	}trial_instruction5;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		picture {
			bitmap {filename = "instructions/Folie5.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
	}trial_instruction5_no_sound;
	
	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
	
		picture {
			bitmap {filename = "instructions/Folie6.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
		
		sound { wavefile { filename = "sounds/modifiziert/SNS2.wav";};attenuation = 0.05;};
		time = 0;
		
		sound { wavefile { filename = "sounds/modifiziert/N2.wav";};attenuation = 0.05;};
		time = 2000;
		
	}trial_instruction6;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
	
		picture {
			bitmap {filename = "instructions/Folie6.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
	}trial_instruction6_no_sound;
	
	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
		
		picture {
			bitmap {filename = "instructions/Folie7.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
		
		sound { wavefile { filename = "sounds/modifiziert/SNS1.wav"; };attenuation = 0.05;};
		time = 0;
	
		
		sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 0.05;};
		time = 2000;
	}trial_instruction7;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		picture {
			bitmap {filename = "instructions/Folie7.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};
	}trial_instruction7_no_sound;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		picture {
			bitmap {filename = "instructions/Folie8.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
			x=0;y=0;
		};	
	}trial_instruction8;

	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
		
			picture {
				bitmap {filename = "instructions/Folie10.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
				
		stimulus_event {
			sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 1;};
			time = 0;
		}stimulus_event_first_target;
		
		stimulus_event {
			sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 1;};
			time = 2000;
		}stimulus_event_second_target;
		
	}trial_instruction10;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
			picture {
				bitmap {filename = "instructions/Folie10.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
	} trial_instruction10_no_sound;
	
	trial {
		trial_duration = stimuli_length;
		trial_type = fixed;
		
			picture {
				bitmap {filename = "instructions/Folie11.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
				
		stimulus_event {
			sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 1;};
			time = 0;
		}stimulus_event_first_nontarget;
		
		stimulus_event {
			sound { wavefile { filename = "sounds/modifiziert/N1.wav"; };attenuation = 1;};
			time = 2000;
		}stimulus_event_second_nontarget;
		
	}trial_instruction11;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
			picture {
				bitmap {filename = "instructions/Folie11.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
	} trial_instruction11_no_sound;
	
	trial {
		trial_duration = forever;
		trial_type = first_response;
		
		stimulus_event {
			picture {
				bitmap {filename = "instructions/Folie12.jpg";description = "instruction1";height=$inheight;width=$inwidth;};
				x=0;y=0;
			};
		};
	}trial_instruction12;
	
	trial {
		trial_type = fixed;
		trial_duration = 2000;
	} trial_two_seconds;
	
	trial {
		trial_type = first_response;
		
		stimulus_event {
			picture {
				box {color = 0,0,0; height = 400; width = 600;};
				x=0;y=0;
				box {height = 380; width = 580;};
				x=0;y=0;
				
				text {
					caption = "+"; 
					font_size = 50;
					};
					x = 0;
					y = 0; 
				};
		} se_sound_box;
		
		stimulus_event {
			sound { 
				wavefile {
					filename = "sounds/modifiziert/N1.wav"; 
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
				
				text {
				caption = "+"; 
				font_size = 50;
				};
				x = 0;
				y = 0; 
				
			} picture_feedback;
			
		} se_feedback_box;
		
	} trial_feedback;

begin_pcl;

	int blocksInTotal = 4;
	int stimuliPerBlock = 12;
	int trialCount = blocksInTotal * stimuliPerBlock + blocksInTotal * 6;
	int trial_number = 1;
	bool exportVariableNames = true;

	#store buffered data to storage
	# 1=stimulus,2=position,3=rt,4=answerGiven,5=answerCorrect,6=goTrial	
	array <int> rawData[trialCount][6];
	array <int> correctedData[trialCount][6];
	
	array <int> itiArray[12];
	array <int> fixArray[12];
	int size_with_circles;
	array<int> block_with_circles[0];
	array<int> blockConditions[4];
	array <int> added_iti_array[12];
	array <int> added_fix_array[12];
	array <int> start_time_array[0];
	array<int> all_orders_without_circles[4][12];

	string vpCode = "";
	int experimentGroup = 0;
	int last_picture_number = 0;
	int sound_index_logging = 0;

	#include "GNGrobin_data.pcl";

	response_manager.set_button_active(2, false);

#--  STIMULI RANDOMIZATION  --#
	sub stimuliRandomization
	begin			

		if experimentGroup == 1 
		then
			blockConditions = {1,2,1,2};
		else
			blockConditions = {2,1,2,1};
		end;	
			
		array<int> order1[12] = {1,2,3,1,4,2,3,4,1,3,2,4};
		array<int> order2[12] = {1,2,3,2,4,1,4,3,1,4,2,3};
		array<int> order3[12] = {2,1,4,3,1,2,4,3,2,1,3,4};
		array<int> order4[12] = {4,1,2,3,1,2,4,3,4,2,3,1};

		all_orders_without_circles[1] = order1;
		all_orders_without_circles[2] = order2;
		all_orders_without_circles[3] = order3;
		all_orders_without_circles[4] = order4;

		#shuffle arrays
		all_orders_without_circles.shuffle();	
		
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
	
	sub make_start_time_array (int block_start_time)
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
			
		start_time_array.resize(0);
		
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
				tmp_starttime = random(tmp_trial_before + 1450, tmp_trial_after - 300);
			end;
		#term.print_line( "st " + string(tmp_starttime) + " " + string(block_with_circles[i]) + " ");
		tmp_starttime = tmp_starttime + block_start_time;
		start_time_array.add(tmp_starttime);
		i = i + 1;
		end;
	end;
	
	sub make_block(array<int> block[], int circles)
	begin
		#term.print_line("block Flag 1");
		size_with_circles = block.count() + circles;
		block_with_circles.resize(0);
		array<int> circle_positions[circles];
		
		loop int i = 1
		until i > circles
		begin
			#term.print_line("block Flag 2");
			int candidate = random(2,size_with_circles);
			bool valid = true;
			loop int j = 1
			until j > circles
			begin				
				#term.print_line("block Flag 3");
				if candidate == circle_positions[j] || 
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
		#term.print_line("block Flag 4");
	end;
	
	sub set_button_mode(bool in_block)
	begin
		if in_block
		then
			response_manager.set_button_active(1, true);
			response_manager.set_button_active(3, false);
		else
			response_manager.set_button_active(1, false);
			response_manager.set_button_active(3, true);
		end;
	end;
	
	sub check_feedback
	begin
		if stimulus_manager.stimulus_count() == last_picture_number
			then
				stimulus_data last = stimulus_manager.get_stimulus_data(last_picture_number);
				if last.type() == last.HIT || (last.type() == last.OTHER && (clock.time() > last.time() + 2000))
				then
					box_feedback.set_color(0,255,0);
				elseif last.type() == last.MISS || last.type() == last.FALSE_ALARM
				then
					box_feedback.set_color(255,0,0);
				end;
			end;
	end;
		
	sub present_block (array<int,1> block, int condition, bool report_data)
	begin
		
		if condition == 1 && report_data == true
		then
			set_button_mode(false);
			stimulus_event_first_target.set_stimulus(sound1);
			stimulus_event_second_target.set_stimulus(sound2);
			trial_instruction10_no_sound.present();
			trial_instruction10.present();
			trial_instruction10_no_sound.present();
			stimulus_event_first_nontarget.set_stimulus(sound3);
			stimulus_event_second_nontarget.set_stimulus(sound4);
			trial_instruction11_no_sound.present();
			trial_instruction11.present();
			trial_instruction11_no_sound.present();
		elseif condition == 2 && report_data == true
		then
			set_button_mode(false);
			stimulus_event_first_target.set_stimulus(sound3);
			stimulus_event_second_target.set_stimulus(sound4);
			trial_instruction10_no_sound.present();
			trial_instruction10.present();
			trial_instruction10_no_sound.present();
			stimulus_event_first_nontarget.set_stimulus(sound1);
			stimulus_event_second_nontarget.set_stimulus(sound2);
			trial_instruction11_no_sound.present();
			trial_instruction11.present();
			trial_instruction11_no_sound.present();
		end;
		
		set_button_mode(true);
		sound_index_logging = stimulus_manager.stimulus_count() + 1;
		randomizeTiming();
		trial_two_seconds.present();
		int clocktime = clock.time();
		make_start_time_array(clock.time());
		term.print_line("clocktime: " + string(clocktime));
		
		loop int i = 1
		until i > block.count()
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
			
			if condition == 1
			then
				if block_with_circles[i] == 1 || block_with_circles[i] == 2
				then
					se_sound.set_target_button(1);
				elseif block_with_circles[i] == 3 || block_with_circles[i] == 4
				then
					se_sound.set_target_button(0);
					se_sound.set_response_active(true);
				end;
			elseif condition == 2
			then
				if block_with_circles[i] == 3 || block_with_circles[i] == 4
				then
					se_sound.set_target_button(1);
				elseif block_with_circles[i] == 1 || block_with_circles[i] == 2
				then
					se_sound.set_target_button(0);
					se_sound.set_response_active(true);
				end;
			end;
			
			if block_with_circles[i] != 5
			then
				trial_sound.set_start_time(start_time_array[i]);
				trial_sound.present();
				last_picture_number = last_picture_number + 1;
			elseif block_with_circles[i] == 5
			then
				se_sound.set_target_button(0);
				check_feedback();
				trial_circle.set_start_time(start_time_array[i]);
				check_feedback();
				trial_circle.present();
				check_feedback();
				trial_circle.present();
				check_feedback();
				trial_circle.present();
			end;
			
			loop bool time_for_next_stimuli;
			until time_for_next_stimuli
			begin
				check_feedback();

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
					loop int feedback_at_end
					until feedback_at_end > 15
					begin
						check_feedback();
						trial_feedback.present();
						feedback_at_end = feedback_at_end + 1;
					end;
					time_for_next_stimuli = true;
				end;
			end;
			box_feedback.set_color(0,0,0);
			i = i + 1;	
		end;
		if report_data
		then
			loop int presented_block_counter = 1
			until presented_block_counter > block.count()
			begin
				rawData[trial_number][1] = trial_number;
				rawData[trial_number][2] = block_with_circles[presented_block_counter];
				if block_with_circles[presented_block_counter] != 5
				then
					term.print("sound_index: " + string(sound_index_logging));
					stimulus_data sd = stimulus_manager.get_stimulus_data(sound_index_logging);
					rawData[trial_number][3] = sd.reaction_time();
					rawData[trial_number][4] = sd.type();
					if sd.type() == sd.HIT || sd.type() == sd.OTHER
					then
						rawData[trial_number][6] = 1;
					end;
					sound_index_logging = sound_index_logging + 1;
				elseif block_with_circles[presented_block_counter] == 5
				then
					loop int response_count = 1
					until response_count > response_manager.response_data_count()
					begin
						response_data rd = response_manager.get_response_data(response_count);
						if rd.button() == 2 && rd.time() > start_time_array[presented_block_counter] &&
							rd.time() - start_time_array[presented_block_counter] < 1750
						then
							rawData[trial_number][3] = rd.time() - start_time_array[presented_block_counter];
							break;
						end;
						response_count = response_count + 1;
					end;
					if rawData[trial_number][3] != 0
					then
						rawData[trial_number][6] = 1;
					end;
				end;
				rawData[trial_number][5] = condition;
				trial_number = trial_number + 1;
				presented_block_counter = presented_block_counter + 1;
			end;
		end;
		term.print_line(added_iti_array);
		term.print_line(added_fix_array);
		term.print_line(start_time_array);
		term.print_line(block_with_circles);
	end;
	
	sub present_instruction_and_testblocks
	begin
		
		loop bool correctInput = false
		until correctInput == true
		begin
			vpCode = system_keyboard.get_input(picture_vpncode, text_vpncode );
			if vpCode != "" then
				correctInput = true;
			end;
		end;	
		
		set_button_mode(false);
		trial_instruction1.present();
		trial_instruction2.present();
		trial_instruction3.present();
		trial_instruction4_no_sound.present();
		trial_instruction4.present();
		trial_instruction4_no_sound.present();
		trial_instruction5_no_sound.present();
		trial_instruction5.present();
		trial_instruction5_no_sound.present();
		set_button_mode(true);
		make_block({1,2,3,4,3,2,1,4,3,2,4,1},random(4,6));
		present_block(block_with_circles, 1, false);
		set_button_mode(false);
		trial_instruction6_no_sound.present();
		trial_instruction6.present();
		trial_instruction6_no_sound.present();
		trial_instruction7_no_sound.present();
		trial_instruction7.present();
		trial_instruction7_no_sound.present();
		set_button_mode(true);
		make_block({2,3,4,1,3,2,4,1,3,2,4,2},random(4,6));
		present_block(block_with_circles, 2, false);
		set_button_mode(false);
		trial_instruction8.present();
	end;
	
	sub export_rawdata
	begin
		output_file single = new output_file();
		string single_file_name = "singles/GoNoGoRobin" + vpCode + ".txt";
		single.open_append(single_file_name);
		
		string variable_names = "stimulus_number	stimulus_type	response_time	response_type	condition	correct_reaction";
		single.print_line(variable_names);
		
		loop int export_data_counter = 1
		until export_data_counter > rawData.count()
		begin
			string stimulus_data_string = "";
			loop int stimulus_data_counter = 1
			until stimulus_data_counter > rawData[export_data_counter].count() 
			begin
				stimulus_data_string = stimulus_data_string + string(rawData[export_data_counter][stimulus_data_counter]);
				if stimulus_data_counter < rawData[export_data_counter].count()
				then
					stimulus_data_string = stimulus_data_string + "	";
				end;
				stimulus_data_counter = stimulus_data_counter + 1;
			end;
			single.print_line(stimulus_data_string);
			export_data_counter = export_data_counter + 1;
		end;
	end;
	
	present_instruction_and_testblocks();

	stimuliRandomization();
	make_block(all_orders_without_circles[1],random(4,6));
	present_block(block_with_circles, blockConditions[1], true);
	make_block(all_orders_without_circles[2],random(4,6));
	present_block(block_with_circles, blockConditions[2], true);
	make_block(all_orders_without_circles[3],random(4,6));
	present_block(block_with_circles, blockConditions[3], true);
	make_block(all_orders_without_circles[4],random(4,6));
	present_block(block_with_circles, blockConditions[4], true);
	export_rawdata();
	trial_instruction12.present();
	
	term.print_line("HIT " + string(stimulus_data::HIT));
	term.print_line("FALSE_ALARM " + string(stimulus_data::FALSE_ALARM));
	term.print_line("MISS " + string(stimulus_data::MISS));
	term.print_line("INCORRECT " + string(stimulus_data::INCORRECT));
	term.print_line("OTHER " + string(stimulus_data::OTHER));

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
	
	term.print_line("HIT " + string(response_data::HIT));
	term.print_line("INCORRECT " + string(response_data::INCORRECT));
	term.print_line("FALSE_ALARM " + string(response_data::FALSE_ALARM));
	term.print_line("OTHER " + string(response_data::OTHER));
	
	term.print_line(response_manager.response_count());
	loop int i = 1
	until i > response_manager.response_data_count()
	begin
	response_data rp = response_manager.get_response_data(i);
	term.print_line("button " + string(rp.button()) + 
					" time " + string(rp.time()) + 
					" type " + string(rp.type()));
	i = i + 1;
	end;
	term.print_line(rawData);
	