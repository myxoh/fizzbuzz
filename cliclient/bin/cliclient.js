#! /usr/bin/env node

/*HELPERS*/
var h = require("includes/helper_functions");
var s = require("includes/request_server");


/* ACTIONS */
action=(process.argv[2]);
switch(action){
	case "all":
		page=h.g(process.argv[3],0);
		page_size=h.g(process.argv[4],100);
		options="/"+page+"/"+page_size;
		s.requestS(null,null, "numbers", options);
	break;
	case "favorites":
		requestS();
	break;
	case "add":
		number=h.g(process.argv[3]);
		data={favorite:{number:number}};
		s.requestS(null,"POST","favorites",null,data);
	break;
	
	case "remove":
		number=h.g(process.argv[3]); // NUMBER
		favorites=s.requestS(null,null,null,null,null, true, number); //GET  FAVORITES
	break;
	
	default:
		s.requestS();
	break;
}
/* END ACTIONS*/


