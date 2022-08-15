addEventListener("message", function(event){
	if (event.data.toggle == true) {
		document.getElementById("lesgo").innerHTML = event.data.html;
        $("#lesgo").show()
    }else{
    	$("#lesgo").hide()
    }
});
