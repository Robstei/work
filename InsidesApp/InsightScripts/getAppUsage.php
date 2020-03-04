<?php 
	function insertAppUsageTimeOverall($inputArray, $appName) {

		global $db_connection;
		$outputArray = $inputArray;
		foreach($outputArray as $key => $singleParticipantData) {
			if($key === "header"){
				$outputArray[$key][] = $appName . "_TimeOverall_seconds";
				continue;
			}

       		$results = $db_connection->query("SELECT participant_id,
				sum(usage_time_ms/1000) as usage_time
				FROM data_app_sessions
				WHERE participant_id = ? AND 
				app_label = ?
				GROUP BY participant_id",
				array($singleParticipantData[0], $appName));
			
			if($results){
				foreach($results as $result) {
				$outputArray[$key][] = $result->usage_time;  
				}    
			} else {
				$outputArray[$key][] = -1;
			}
		}
		return $outputArray;
	}

	function insertAppUsageTimeAveragePerUsage($inputArray, $appName) {

        global $db_connection;
		$outputArray = $inputArray;
		foreach($outputArray as $key => $singleParticipantData) {
			if($key === "header"){
				$outputArray[$key][] = $appName . "_TimeAveragePerUse_seconds";
				continue;
			}

       		$results = $db_connection->query("SELECT participant_id,
				sum(usage_time_ms/1000)/count(*) as average_usage_time
				FROM data_app_sessions
				WHERE participant_id = ? AND 
				app_label = ?
				GROUP BY participant_id",
				array($singleParticipantData[0], $appName));
			
			if($results){
				foreach($results as $result) {
				$outputArray[$key][] = $result->average_usage_time;  
				}    
			} else {
				$outputArray[$key][] = -1;
			}
		}
		return $outputArray;
	}

?>