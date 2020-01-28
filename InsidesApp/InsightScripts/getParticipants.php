<?php 
	function insertParticipants($inputArray) {

		global $db_connection;
		$outputArray = $inputArray;
		$outputArray["header"][] = "participant_id";

		$results = $db_connection
			->query("SELECT DISTINCT participant_id FROM data_user_sessions");

		foreach($results as $result) {
			$outputArray[$result->participant_id] = array($result->participant_id);
		}
		return $outputArray;
	}
?>