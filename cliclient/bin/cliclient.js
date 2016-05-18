#! /usr/bin/env node




function g(v, d){ //value , default value
	if(v==null){
		return d;
	}else{
		return v;
	}
}




function remove(number, items){
	get_id=-1;
	items.forEach(function(obj){
		if(obj.number==number){
			get_id=obj.id
		}
	})
	if(get_id!=-1){
		requestS(null,"delete","favorites","/"+get_id,null);
	}else{
		console.log("Favorite not found");
	}
}

function requestS(url,method, action, options,data,silent, number){
  url = g(url,"http://127.0.0.1:3000");
  method = g(method,"GET");
  action = g(action,"favorites");
  options = g(options,"");
  data=g(data,"");
  silent=g(silent,false)
  api = "/api/v1/";
  final_url=url+api+action+options;
  
  console.log(final_url);
  request({
  	url:final_url,
  	method:method,
  	data:data
  	},
  	function(err, res, body) {
	  var json = JSON.parse(body);
	  if(!silent){
		  json.forEach(function(obj){
		  	console.log(obj)
		  });
	  }else{
	  	remove(number,json)
	  }
	}
	  
  );
}

var request = require("ajax-request");


action=(process.argv[2])
switch(action){
	case "all":
		page=g(process.argv[3],0);
		page_size=g(process.argv[4],100);
		options="/"+page+"/"+page_size;
		requestS(null,null, "numbers", options);
	break;
	case "favorites":
		requestS()
	break;
	case "add":
		number=g(process.argv[3])
		data={favorite:{number:number}}
		requestS(null,"POST","favorites",null,data);
	break;
	
	case "remove":
		number=g(process.argv[3]); // NUMBER
		favorites=requestS(null,null,null,null,null, true, number); //GET  FAVORITES
	break;
	
	default:
		requestS();
	break;
}