#! /usr/bin/env node

/*HELPERS*/
var helper = require("includes/helper_functions");
var server = require("includes/request_server");


/* ACTIONS */
action = (process.argv[2]);
switch(action){
	case "all":
		page = helper.get(process.argv[3],0);
		page_size = helper.get(process.argv[4],100);
		options = "/" + page + "/" + page_size;
		server.requestS(null,null, "numbers", options);
	break;
	
	case "favorites":
		server.requestS();
	break;
	
	case "add":
		number = helper.get(process.argv[3]);
		data={favorite: {number: number}};
		server.requestS(null, "POST", "favorites", null, data);
	break;
	
	case "remove":
		number = helper.get(process.argv[3]); // NUMBER
		favorites = server.requestS(null, null, null, null, null, true, number); //GET  FAVORITES
	break;
	
	default:
		server.requestS();
	break;
}
/* END ACTIONS*/


