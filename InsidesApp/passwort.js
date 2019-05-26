<script>window.onload = function() { 
	$("#1-1-2").hide(); 
	
	$("#1-1-1").change(function() {
		if($("#1-1-1").val() == "abc") {
			$("#1-1-2").show();
		}
	}); 
	};
