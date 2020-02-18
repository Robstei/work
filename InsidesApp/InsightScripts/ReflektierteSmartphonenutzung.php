<?php 
	include("getParticipants");
	include("getAppUsage");
	include("getGeneralData");
	include("getSessionData");

	$array = ["header" => array()];
	$array = insertParticipants($array);
	$array = insertAppUsageTimeOverall($array, "WhatsApp", 0);
	$array = insertAppUsageTimeAveragePerUsage($array, "WhatsApp", 0);
	$array = insertFirstDaysDate($array);
	$array = insertLastDaysDate($array);
	$array = insertCountUnlockScreen($array);
	$array = insertCountActiveScreen($array);
	$array = insertFirstAndLastScreenUnlockPerDay($array, 18000);
	$array = insertWeeklyAverageFirstAndLastScreenUnlockPerDay($array, 18000);
	
	$fp= fopen($result_files_base_path. '/reflektierte_smartphonenutzung_' . date("Y-m-d_H-i-s") . '.csv', 'w');
	foreach($array as $singlePersonData){
		fputcsv($fp, $singlePersonData);
	}
	fclose($fp);

	echo "<pre>";
	var_dump($array);
    echo"</pre>";
	$data_analysis_functions->easyPrintMySQL(
						'SELECT 
							participant_id, DATE(FROM_UNIXTIME(screen_on_event_ts/1000 - 18000)) as date, 
							time(From_unixtime(MIN(screen_unlock_event_ts/1000))) as first_usage, 
							time(From_unixtime(MAX(screen_unlock_event_ts/1000))) as last_usage 
						FROM (Select *
								FROM data_user_sessions
								WHERE screen_unlock_event_ts > 0) as subquery1
						GROUP BY  participant_id, date
						ORDER BY participant_id, date
						LIMIT 10', array(0),"table");

	$data_analysis_functions->easyPrintMySQL(
						'SELECT 
							participant_id, DATE(FROM_UNIXTIME(screen_on_event_ts/1000)) as date, 
							time(From_unixtime(screen_unlock_event_ts/1000))
						FROM (Select *
								FROM data_user_sessions
								WHERE screen_unlock_event_ts > 0) as subquery1
						', array(0),"table");
?>