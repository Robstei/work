<?php 
	function insertCountUnlockScreen($inputArray) {
		
		global $db_connection;
		$outputArray = $inputArray;

		foreach($outputArray as $key => $singleParticipantData) {
			if($key === "header"){
				$outputArray[$key][] = "CountUnlockScreen";
				continue;
			}

			$results = $db_connection
				->query("SELECT participant_id,
					COUNT(*) AS count
					FROM data_user_sessions
					WHERE participant_id = ? AND
					screen_unlock_event_ts > 0
					GROUP BY participant_id", array($singleParticipantData[0]));

			if($results) {
				foreach($results as $result) {
				$outputArray[$key][] = $result->count;
				}
			} else {
				$outputArray[$key][] = -1;
			}
			
		}
		return $outputArray;
	}

	function insertCountActiveScreen($inputArray) {
		
		global $db_connection;
		$outputArray = $inputArray;

		foreach($outputArray as $key => $singleParticipantData) {
			if($key === "header"){
				$outputArray[$key][] = "CountActiveScreen";
				continue;
			}

			$results = $db_connection
				->query("SELECT participant_id,
					Count(*) AS count
					FROM data_user_sessions
					WHERE participant_id = ? AND
					screen_on_event_ts > 
					GROUP BY participant_id", array($singleParticipantData[0]));

			if($results) {
				foreach($results as $result) {
				$outputArray[$key][] = $result->count;
				}
			} else {
				$outputArray[$key][] = -1;
			}
		}
		return $outputArray;
	}

	function insertFirstAndLastScreenUnlockPerDay($inputArray, $timeAdjustmentInMs = 0) {
		
		global $db_connection;
		$outputArray = $inputArray;

		$maximumLength = $db_connection
			->query(
				"SELECT MAX(count_participant_id) as max_length
				FROM 
					(SELECT COUNT(*) as count_participant_id, participant_id
					FROM (
						SELECT participant_id, 
							DATE(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as date 
						FROM data_user_sessions
						WHERE screen_unlock_event_ts > 0
						GROUP BY participant_id, date) as subquery1
					GROUP BY participant_id) as subquery2",
					array($timeAdjustmentInMs));
			echo "<pre>";
	var_dump($maximumLength);
    echo"</pre>";
		for($i = 0; $i < $maximumLength[0]->max_length; $i++) {
			$outputArray["header"][] = "Date_" . ($i + 1);
			$outputArray["header"][] = "First_Usage_Date_" . ($i + 1);
			$outputArray["header"][] = "Last_Usage_Date_" . ($i + 1);
		}

		$results = $db_connection
			->query("SELECT 
						participant_id, DATE(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as date, 
						TIME(FROM_UNIXTIME(MIN(ROUND(screen_unlock_event_ts/1000)))) as first_usage, 
						TIME(FROM_UNIXTIME(MAX(ROUND(screen_unlock_event_ts/1000)))) as last_usage 
					FROM (
							Select *
							FROM data_user_sessions
							WHERE screen_unlock_event_ts > 0) as subquery1
					GROUP BY  participant_id, date
					ORDER BY participant_id, date",
					array($timeAdjustmentInMs));

		if($results) {
			foreach($results as $result) {
				$outputArray[$result->participant_id][] = $result->date;
				$outputArray[$result->participant_id][] = $result->first_usage;
				$outputArray[$result->participant_id][] = $result->last_usage;
			}
		}

		foreach($outputArray as $key => $singleParticipantData){
			while(count($outputArray[$key]) < count($outputArray["header"])) {
				$outputArray[$key][] = "";
			}
		}

		return $outputArray;
	}

	function insertWeeklyAverageFirstAndLastScreenUnlockPerDay($inputArray, $timeAdjustmentInMs = 0) {
		
		global $db_connection;
		$outputArray = $inputArray;

		$maximumLength = $db_connection
			->query(
				"SELECT MAX(count_participant_id) as max_length
				FROM 
					(SELECT COUNT(*) as count_participant_id, participant_id
					FROM (
						SELECT participant_id, 
							YEARWEEK(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as week 
						FROM data_user_sessions
						WHERE screen_unlock_event_ts > 0
						GROUP BY participant_id, week) as subquery1
					GROUP BY participant_id) as subquery2",
					array($timeAdjustmentInMs));
			echo "<pre>";
	var_dump($maximumLength);
    echo"</pre>";
		for($i = 0; $i < $maximumLength[0]->max_length; $i++) {
			$outputArray["header"][] = "Date_" . ($i + 1);
			$outputArray["header"][] = "First_Usage_Date_" . ($i + 1);
			$outputArray["header"][] = "Last_Usage_Date_" . ($i + 1);
		}

		$results = $db_connection
			->query("SELECT (SELECT 
						participant_id, DATE(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as date, 
						TIME(FROM_UNIXTIME(MIN(ROUND(screen_unlock_event_ts/1000)))) as first_usage, 
						TIME(FROM_UNIXTIME(MAX(ROUND(screen_unlock_event_ts/1000)))) as last_usage 
					FROM (
							Select *
							FROM data_user_sessions
							WHERE screen_unlock_event_ts > 0) as subquery1
					GROUP BY  participant_id, date
					ORDER BY participant_id, date) as daily_values",
					array($timeAdjustmentInMs));

		if($results) {
			foreach($results as $result) {
				$outputArray[$result->participant_id][] = $result->date;
				$outputArray[$result->participant_id][] = $result->first_usage;
				$outputArray[$result->participant_id][] = $result->last_usage;
			}
		}

		foreach($outputArray as $key => $singleParticipantData){
			while(count($outputArray[$key]) < count($outputArray["header"])) {
				$outputArray[$key][] = "";
			}
		}

		return $outputArray;
	}
?>