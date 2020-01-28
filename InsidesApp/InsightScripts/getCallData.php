<?php 
	function insertNumberOfCalls($inputArray) {
		
		global $db_connection;
		$outputArray = $inputArray;

		// foreach($outputArray as $key => $singleParticipantData) {
		// 	if($key === "header"){
		// 		$outputArray[$key][] = "FirstDate";
		// 		continue;
		// 	}

		// 	$results = $db_connection
		// 		->query("SELECT participant_id,
		// 			DATE(FROM_UNIXTIME(MIN(screen_on_event_ts)/1000)) AS first_date
		// 			FROM data_user_sessions
		// 			WHERE participant_id = ?
		// 			GROUP BY participant_id", array($singleParticipantData[0]));
		// 	foreach($results as $result) {
		// 		$outputArray[$key][] = $result->first_date;
		// 	}
		// }
		// return $outputArray;
	}

	function insertDurationOfCalls($inputArray) {
		
		global $db_connection;
		$outputArray = $inputArray;

		// foreach($outputArray as $key => $singleParticipantData) {
		// 	if($key === "header"){
		// 		$outputArray[$key][] = "FirstDate";
		// 		continue;
		// 	}

		// 	$results = $db_connection
		// 		->query("SELECT participant_id,
		// 			DATE(FROM_UNIXTIME(MAX(screen_on_event_ts)/1000)) AS first_date
		// 			FROM data_user_sessions
		// 			WHERE participant_id = ?
		// 			GROUP BY participant_id", array($singleParticipantData[0]));
		// 	foreach($results as $result) {
		// 		$outputArray[$key][] = $result->first_date;
		// 	}
		// }
		// return $outputArray;
	}
?>