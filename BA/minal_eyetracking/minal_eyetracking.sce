response_matching = simple_matching;

begin;

begin_pcl;

# connection settings
string iViewX_IP = "192.168.1.2";
string Local_IP = "192.168.1.1";
int Send_Port = 4444;
int Recv_Port = 5555;

# Calibration method 
#double calibration_method = 1.0;
#double calibration_method = 2.0;
double calibration_method = 5.0;
#double calibration_method = 9.0;
#double calibration_method = 13.0;

# Calibration auto accept
#double calibration_auto_accept = 0.0;
double calibration_auto_accept = 1.0;
#double calibration_auto_accept = 2.0;

# Calibration speed
double calibration_speed = 0.0;
#double calibration_speed = 1.0;

iViewXAPI::eye_tracker2 tracker2 = new iViewXAPI::eye_tracker2( "{B7A4A7F7-7879-4C95-A3BA-6CCB355AECF6}" );
tracker2.connect(iViewX_IP, Send_Port, Local_IP, Recv_Port);

# create eye tracker extension instance, start tracking and start deliver gazeposition data
eye_tracker tracker = new eye_tracker( "{FDC35980-7480-4761-859F-4DCCFA93BA57}");
tracker.start_tracking();
tracker.start_data(dt_position);

# start calibration using a predefined calibration method, acceptation andspeed setting, and start IDF data recording
tracker.calibrate( et_calibrate_default, calibration_method, calibration_auto_accept, calibration_speed);
tracker.set_recording (true);
# get the current gaze position data

if( tracker.new_position_data() != 0 ) then
eye_position_data eyepos = tracker.last_position_data();
end;
# stop IDF data recording and save the recorded data to a predefined file
tracker.set_recording(false);
tracker2.save_data("presentation_data.idf", "description", "user", 1);
# disconnect from iView eye tracking server
tracker2.disconnect()