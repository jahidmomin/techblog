function doLike(pid,uid) {
	console.log(pid,uid);
	const d={
			uid:uid,
			pid:pid,
			operation:'like'
	}
	
	$.ajax({
		url:"LikeServlet",
		data:d,
		method:"POST",
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trime() == "true") {
				let c=$('#likec').html();
				c++;
				$("#likec").html(c);
			}
		},
		error : function(jqXHR, textStatus, err) {
			console.log(jqXHR);
		}
	})
}