<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<?php 
function pretty_dump ($var){
    echo "<pre>";
    var_dump($var);
    echo "</pre>";
}
    
    foreach($formatet_results as $key => $formatet_result) {
        $results = $db_connection->query("SELECT participant_id, app_label,
            sum(usage_time_ms/1000) as usage_time,
            count(*) as count FROM data_app_sessions
            WHERE participant_id = ? AND 
            (package_name = 'com.whatsapp'
            OR package_name = 'com.instagram.android')
            GROUP BY participant_id, app_label
           ", array($formatet_result["id"]));
          
        if($results){
            echo "Test";
            foreach($results as $result) {
            $currentReference = $formatet_results[$key];
            $formatet_results[$key]["app"] = $result->app_label;  
            }    
        }
    }       
    
    pretty_dump($formatet_results);
?>