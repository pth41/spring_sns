console.log("Reply Module........");
var replyService = (function(){
	function add(reply, callback, error){
		console.log("add reply..............");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function getList(post_no, callback, error) {
		$.getJSON("/replies/list/"+post_no+".json",
				function(data) {
					if(callback){
						callback(data); // 댓글 목록만 가져오는 경우
						//callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
					}
				}
		).fail(function(xhr, status, err) {
					if(error) {
						error();
					}
			});
	}
	
	function remove(reply_no, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/'+reply_no,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error) {
		console.log("Reply_no: "+reply.reply_no);
		
		$.ajax({
			type : 'put',
			url : '/replies/'+reply.reply_no,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function get(reply_no, callback, error) {
		$.get("/replies/"+reply_no+".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	function getCount(post_no, callback, error) {
		$.get("/replies/count/"+post_no+".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue) {
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60)){
			return '방금 전';
		} else if(gap < (1000 * 60 * 60)){
			var m = 60 - dateObj.getMinutes();
			return m+'분 전';
		} else if(gap < (1000 * 60 * 60 * 24)) {
			var h = Math.floor(gap / 1000 / 60 / 60);
			/*var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');*/
			return h+'시간 전';
		} else if(gap < (1000 * 60 * 60 * 24 * 7)){
			var d = Math.floor(gap / 1000 / 60 / 60 / 24);
			return d+'일 전';
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
		
	};
	
})();