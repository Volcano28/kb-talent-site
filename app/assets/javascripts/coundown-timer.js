/*Edited by Gonzalo on 2/2/2015*/
/*Edited by Mo on 2/3/2015*/

(function($) {

	//custom 'this' selector
	thisEl = $(this);

	//array of custom settings
	var settings = {
		date: "15 April 2015 23:59:59", // add the countdown's end date (i.e. 3 november 2012 12:00:00)
		format: "off" // on (03:07:52) | off (3:7:52) - two_digits set to ON maintains layout consistency
	};

	//main countdown function
	function countdown_proc() {

		var eventDate = Date.parse(settings['date']) / 1000;
		var currentDate = Math.floor($.now() / 1000);


		var seconds = eventDate - currentDate;

		var days = Math.floor(seconds / (60 * 60 * 24)); //calculate the number of days
		seconds -= days * 60 * 60 * 24; //update the seconds variable with no. of days removed

		var hours = Math.floor(seconds / (60 * 60));
		seconds -= hours * 60 * 60; //update the seconds variable with no. of hours removed

		var minutes = Math.floor(seconds / 60);
		seconds -= minutes * 60; //update the seconds variable with no. of minutes removed

		//conditional Ss
		if (days == 1) { thisEl.find(".timeRefDays").text("day"); } else { thisEl.find(".timeRefDays").text("days"); }
		if (hours == 1) { thisEl.find(".timeRefHours").text("hour"); } else { thisEl.find(".timeRefHours").text("hours"); }
		if (minutes == 1) { thisEl.find(".timeRefMinutes").text("minute"); } else { thisEl.find(".timeRefMinutes").text("minutes"); }
		if (seconds == 1) { thisEl.find(".timeRefSeconds").text("second"); } else { thisEl.find(".timeRefSeconds").text("seconds"); }

		//logic for the two_digits ON setting
		if(settings['format'] == "on") {
			days = (String(days).length >= 2) ? days : "0" + days;
			hours = (String(hours).length >= 2) ? hours : "0" + hours;
			minutes = (String(minutes).length >= 2) ? minutes : "0" + minutes;
			seconds = (String(seconds).length >= 2) ? seconds : "0" + seconds;
		}

		//update the countdown's html values.
		if(!isNaN(eventDate)) {
			$(".days").text(days);
			$(".hours").text(hours);
			$(".minutes").text(minutes);
			$(".seconds").text(seconds);
		} else {
			console.error("Invalid date. Here's an example: 12 Tuesday 2012 17:30:00");
			clearInterval(interval);
		}
	}

	//run the function
	countdown_proc();

	//loop the function
	interval = setInterval(countdown_proc, 1000);

}) (jQuery);
