var app = require('express')();
var http = require('http').Server(app);
var twilio = require('twilio');
var client = new twilio.RestClient('AC1855c5ea38c7b8de45e1ce3d85e2caf7','acd884dff899531302bdbd4767b9300e');
var bodyParser = require('body-parser');

//after running ngrok, go to twilio.com/console
//click the circle with the three dots on the left
//click legacy account portal
//click no thanks
//click phone numbers
//click on red phone number on left
//replace ngrok url with new ngrok url

var groceryList;
var tasks = [];

app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(bodyParser.json());

app.get("/smsReply", function(req, res){
	if (req.query.body.indexOf("grocery list:") != -1){
		groceryList = req.query.body.split("grocery list:")[1];
		client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Added grocery list!"
		});
	}
	if (req.query.body.indexOf("add task ") != -1){
		task.push(req.query.body.split("add task")[1]);
		client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Added task!"
		});
	}
});

app.get("/usw", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user walk" //text body
		});
});

app.get("/usr", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user run"
		});
});

app.get("/usd", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user drive"
		});
});
app.get("/uag", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for grocery store"
		});
});

app.get("/uwo", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user workout"
		});
});

app.get("/uss", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user sleep"
		});
});

app.get("/uwu", function(req, res){
	client.messages.create({
			to: '+17327427351', //replace with your phone number
			from: '+17324918329',
			body: "Stuff for user woke up"
		});
});

http.listen(8080, function(){
	console.log("Listening on *:8080");
});