
var Viking = function(name){
	this.name = name;
	this.strength = Math.floor(Math.random() * 10);
	this.health = Math.floor(Math.random() * 200 + 50);
	this.almost_dead = false;
}

Viking.prototype.punching = function () {
	return (this.strength * 5);
};

Viking.prototype.spearing = function (){

};

var Pit = function (viking1, viking2){

	this.fight = function (turns){
		var vikings = this.defining_turns(turns, viking1, viking2);
		viking_striking = vikings[0];
		viking_receiving = vikings[1];
		if (turns !=0){
			viking_receiving.health = viking_receiving.health - viking_striking.punching();
			console.log(viking_striking.name + " punches " + viking_striking.punching());
			console.log(viking_receiving.name + "'s health is " + viking_receiving.health);
			if (this.check_health(viking_receiving)== true){
				this.winner();
			}
			else{
				this.fight (turns-1);
			}
		}
		else {
			this.winner();
		}
	};

	this.defining_turns = function (turns, viking1, viking2){
			if (turns%2==0){
				var viking_striking = viking1;
				var viking_receiving = viking2;
			}
			else {
				var viking_striking = viking2;
				var viking_receiving = viking1;
			};
			return [viking_striking, viking_receiving];
	}

	this.check_health = function(viking){
		if (viking.health <= 0){
			viking.almost_dead = true;
			return (true);
		}
	};


	this.winner = function(){
		if (viking1.almost_dead == true) {
			console.log("The winner is: " + viking2.name);
		}
	    else if (viking2.almost_dead == true){
	    	console.log("The winner is: " + viking1.name);
	    }
	    else{
	    	console.log("Both are still alive!")
	    }
	};
}

//viking_crew
viking1 = new Viking("Astrid");
viking2 = new Viking("Torunn");



var firstfight = new Pit(viking1, viking2);
firstfight.fight(9);



