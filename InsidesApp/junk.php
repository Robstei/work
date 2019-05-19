    /*
    $all_data = [
        "participant_ids" => $participant_ids = [

        ],
        "first" => $participant_ids = [

        ],
        "participant_ids" => $participant_ids = [

        ],
    ]
    
     
    var_dump($results[0]->last_usage);
    echo "<br />";
    print_r($results[1]);
    echo "<br />";
    print_r($results[2]);
    echo "<br />";
    print_r($results[3]);
    */
    
    //date('H:i:s', array_sum(array_map('strtotime', $array)) / count($array));

   /*
   $data_analysis_functions->easyPrintMySQL("SELECT participant_id, DATE(FROM_UNIXTIME(screen_on_event_ts/1000)) as date, 
                                            TIME(FROM_UNIXTIME(MIN(screen_on_event_ts/1000))) as first_usage, 
                                            TIME(FROM_UNIXTIME(MAX(screen_on_event_ts/1000)))as last_usage 
                                            FROM data_user_sessions
                                            GROUP BY DATE(FROM_UNIXTIME(screen_on_event_ts/1000))
                                            ORDER BY participant_id", null, "no", "first_and_last_session_day_[DATE].csv");

    
    if($results!== false) {
        foreach($results as $result) {
            var_dump($result);
            echo "<br />";
            echo "<br />";
            echo "<br />";
        }
    }*/