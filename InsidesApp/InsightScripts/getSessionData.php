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

	// 	$maximumLength = $db_connection
	// 		->query(
	// 			"SELECT MAX(count_participant_id) as max_length
	// 			FROM 
	// 				(SELECT COUNT(*) as count_participant_id, participant_id
	// 				FROM (
	// 					SELECT participant_id, 
	// 						YEARWEEK(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as week 
	// 					FROM data_user_sessions
	// 					WHERE screen_unlock_event_ts > 0
	// 					GROUP BY participant_id, week) as subquery1
	// 				GROUP BY participant_id) as subquery2",
	// 				array($timeAdjustmentInMs));
	// 		echo "<pre>";
	// var_dump($maximumLength);
    // echo"</pre>";
	// 	for($i = 0; $i < $maximumLength[0]->max_length; $i++) {
	// 		$outputArray["header"][] = "Date_" . ($i + 1);
	// 		$outputArray["header"][] = "First_Usage_Date_" . ($i + 1);
	// 		$outputArray["header"][] = "Last_Usage_Date_" . ($i + 1);
	// 	}

		$results = $db_connection
			->query("SELECT
						parent.participant_id, 
						TIME(FROM_UNIXTIME(ROUND(screen_unlock_event_ts/1000))) as usage_time,
							(SELECT MIN(DATE(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))))
								FROM data_user_sessions subquery
								WHERE parent.participant_id = subquery.participant_id) as first_overall_usage_date,
						DATE(FROM_UNIXTIME(ROUND(screen_on_event_ts/1000 - ?))) as date,
						ROUND(screen_on_event_ts/1000) as unix_time
					FROM data_user_sessions parent
					WHERE screen_unlock_event_ts > 0
					GROUP BY participant_id, usage_time, date, unix_time",
					array($timeAdjustmentInMs, $timeAdjustmentInMs));

		foreach($results as $key => $result) {
			$firstDateOfParticipant = new Datetime($result->first_overall_usage_date);
			$date = new Datetime($result->date);
			// echo $result->participant_id;
			// echo "<br/>";
			// echo "Tag 1: ";
			// var_dump($firstDateOfParticipant);
			// echo "<br/>";
			// echo "Tag 2: ";
			// var_dump($date);
			// echo "<br/>";
			// echo "Difference ";
			// var_dump($firstDateOfParticipant->diff($date)->d);
			// echo "<br/>";

			$results[$key]->relative_day = $firstDateOfParticipant->diff($date)->d;
			$results[$key]->relative_week = floor($results[$key]->relative_day / 7);
		}	

		$maxRelativeWeeks = 0;
		
		foreach($results as $result) {
			if($result->relative_week > $maxRelativeWeeks) {
				$maxRelativeWeeks = $result->relative_week;
			}
		}

		$participantIds = array();
		foreach($results as $result) {
			if(!in_array($result->participant_id, $participantIds)) {
				$participantIds[] = $result->participant_id;
			}
		}

		$filteredFirstUsagesPerDay = array();
		$filteredLastUsagesPerDay = array();
		foreach($participantIds as $participantId) {
			$filteredFirstUsagesPerDay[$participantId] = array();
			$filteredLastUsagesPerDay[$participantId] = array();
		}

		foreach($results as $result) {
			if(!array_key_exists($result->relative_day, $filteredFirstUsagesPerDay[$result->participant_id])) {
				$filteredFirstUsagesPerDay[$result->participant_id][$result->relative_day] = $result->usage_time;
				$filteredLastUsagesPerDay[$result->participant_id][$result->relative_day] = $result->usage_time;
			}

			if($filteredFirstUsagesPerDay[$result->participant_id][$result->relative_day] > $result->usage_time) {
				$filteredFirstUsagesPerDay[$result->participant_id][$result->relative_day] = $result->usage_time;
			}

			if($filteredLastUsagesPerDay[$result->participant_id][$result->relative_day] < $result->usage_time) {
				$filteredLastUsagesPerDay[$result->participant_id][$result->relative_day] = $result->usage_time;
			}
		}
		
		$filteredFirstUsagesPerWeek = array();
		$filteredLastUsagesPerWeek = array();

		foreach($filteredFirstUsagesPerDay as $id => $singleParticipantData) {
			for($i = 0; $i < $maxRelativeWeeks; $i++) {
				$filteredFirstUsagesPerWeek[$id][$i] = array();
			}
		}

		foreach($filteredFirstUsagesPerDay as $id => $singleParticipantData) {
			foreach($singleParticipantData as $relativeDay => $time){
				$week = floor($relativeDay / 7);
				$filteredFirstUsagesPerWeek[$id][$week][] = $singleParticipantData[$relativeDay];
			}
		}

		foreach($filteredLastUsagesPerDay as $id => $singleParticipantData) {
			for($i = 0; $i < $maxRelativeWeeks; $i++) {
				$filteredLastUsagesPerWeek[$id][$i] = array();
			}
		}

		foreach($filteredLastUsagesPerDay as $id => $singleParticipantData) {
			foreach($singleParticipantData as $relativeDay => $time){
				$week = floor($relativeDay / 7);
				$filteredLastUsagesPerWeek[$id][$week][] = $singleParticipantData[$relativeDay];
			}
		}

		$averageFirstUsagesPerWeek = array();
		$averageLastUsagesPerWeek = array();

		foreach($filteredFirstUsagesPerWeek as $id => $singleParticipantData) {
			foreach($singleParticipantData as $week => $times) {
				$averageFirstUsagesPerWeek[$id][$week]["count"] = count($singleParticipantData[$week]);
				if($averageFirstUsagesPerWeek[$id][$week]["count"] == 0){
					$averageFirstUsagesPerWeek[$id][$week]["average"] = -1;
					continue;
				}

				$averageFirstUsagesPerWeek[$id][$week]["average"] =
				 date("H:i:s", array_sum(array_map("strtotime", $singleParticipantData[$week])) / count($singleParticipantData[$week]));
			}
		}

		foreach($filteredLastUsagesPerWeek as $id => $singleParticipantData) {
			foreach($singleParticipantData as $week => $times) {
				$averageLastUsagesPerWeek[$id][$week]["count"] = count($singleParticipantData[$week]);
				if($averageLastUsagesPerWeek[$id][$week]["count"] == 0){
					$averageLastUsagesPerWeek[$id][$week]["average"] = -1;
					continue;
				}
				
				$averageLastUsagesPerWeek[$id][$week]["average"] =
				 date("H:i:s", array_sum(array_map("strtotime", $singleParticipantData[$week])) / count($singleParticipantData[$week]));
			}
		}

		for($i = 0; $i < $maxRelativeWeeks; $i++) {
			$outputArray["header"][] = "week_{$i}_days_count";
			$outputArray["header"][] = "week_{$i}_avg_first_usage";
			$outputArray["header"][] = "week_{$i}_avg_last_usage";

			foreach($participantIds as $participantId){
				$outputArray[$participantId][] = $averageFirstUsagesPerWeek[$participantId][$i]["count"];
				$outputArray[$participantId][] = $averageFirstUsagesPerWeek[$participantId][$i]["average"];
				$outputArray[$participantId][] = $averageLastUsagesPerWeek[$participantId][$i]["average"];
			}
		}

		
		echo "<pre>";
		var_dump($averageLastUsagesPerWeek);
		echo"</pre>";
		echo "<pre>";
		var_dump($averageFirstUsagesPerWeek);
		echo"</pre>";
		// if($results) {
		// 	foreach($results as $result) {
		// 		$outputArray[$result->participant_id][] = $result->date;
		// 		$outputArray[$result->participant_id][] = $result->first_usage;
		// 		$outputArray[$result->participant_id][] = $result->last_usage;
		// 	}
		// }

		// foreach($outputArray as $key => $singleParticipantData){
		// 	while(count($outputArray[$key]) < count($outputArray["header"])) {
		// 		$outputArray[$key][] = "";
		// 	}
		// }

		return $outputArray;
	}
?>