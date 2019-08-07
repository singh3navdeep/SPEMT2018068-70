const express = require('express')
const app = express()
const port = process.env.PORT || 3000
var bodyParser = require("body-parser");
var cors = require('cors');
var mysql      = require('mysql');
var md5 = require('md5');
var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');
var config = require('./config/secret');
var connection = mysql.createConnection({
  host     : '34.73.175.209',
  user     : 'root',
  password : 'NIme&1212',
  database : 'event_information'
});
connection.connect(); 
app.use(cors());
app.use(bodyParser.json());
app.get('/', (req, res) => {
	//res.send('Hello World!')
	connection.query('SELECT * FROM `generalEventInfo`', function (error, results, fields) {
	  if (error) throw error;
	  
    res.status(200).send({ msg: 'successfull',  data:results});
	  
	});
})

app.post('/eventFetch', function (req, res) {
   	
	connection.query('SELECT * FROM `generalEventInfo`', function (error, results, fields) {
	  if (error) throw error;
	  
    res.status(200).send({ msg: 'successfull',  data:results});
	  
	}); 
})

app.post('/subEventFetch', function (req, res) {
   	
	connection.query('SELECT * FROM `subEventInfo` WHERE `eventId`="'+req.body.id+'"', function (error, results, fields) {
	  if (error) throw error;
	  if(results.length==1)
	  {
	  	connection.query('SELECT * FROM `generalEventInfo` WHERE `eventId`="'+req.body.id+'"', function (error2, results2, fields2) {
	  	if (error2) throw error2;
	  	res.status(200).send({ msg: 'successfull',  data:results,name:results2[0]['eventName']});
	});
	    
	  }
	  else if(results.length==0)
	  {
	  	res.status(200).send({ msg: 'unsuccessfull',  data:results});
	  }
	  
	}); 
})

app.post('/insertSubEvent', function (req, res) {
   	
	connection.query('SELECT * FROM `generalEventInfo` WHERE `eventName`="'+req.body.eventName+'"', function (error, results, fields) {
	  if (error) throw error;
	  if(results.length==1)
	  {
	  	connection.query('INSERT INTO `subEventInfo`(`subEventName`, `subEventInfo`, `contactName1`, `contactNum1`, `contactName2`, `contactNum2`,`subEventLocation`,`eventId`) VALUES ("'+req.body.eventName+'","'+req.body.subEventInfo+'","'+req.body.contactName1+'","'+req.body.contactNum1+'","'+req.body.contactName2+'","'+req.body.contactNum2+'","'+req.body.subEventLocation+'","'+results[0]['eventId']+'")', function (error2, results2, fields2) {
	  	if (error2) throw error2;
	  	res.status(200).send({ msg: 'successfull'});
	});
	    
	  }
	  else if(results.length==0)
	  {
	  	res.status(200).send({ msg: 'unsuccessfull'});
	  }
	  
	}); 
})



function removeLastComma(strng){        
    var n=strng.lastIndexOf(",");
    var a=strng.substring(0,n) 
    return a;
}


app.listen(port, () => console.log(`Example app listening on port ${port}!`))


