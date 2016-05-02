var phrases = [
	"Dw i ddim yn gwybod", 
	"Dwi'm yn gwbod", 
	"Wn i ddim",
	"Sa i'n gwybod",
	"Dywedwch hynny unwaith eto, os gwelwch yn dda",
	"Dywed hynny unwaith eto, os gweli di'n dda",
	"Unwaith eto, os gweli di'n dda",
	"Wnewch chi ysgrifennu hynna, os gwelwch yn dda?"
];


$('.phrase').text(phrases[0]);
displayPhrases(phrases);

$('.btn-change-phrase').on('click', function() {
	$('.phrase').text(phrases[Math.floor(Math.random() * phrases.length)])
});

$('form').on('submit', function() {
	event.preventDefault();
	addPhraseToArray($("form").find('input').val());
	clearPhrases();
	displayPhrases(phrases)
	$("form").find("input").val("");
});

$('.show-hide').on("click", function(){
  $('.phrases-list').toggle();
});

$('.phrases-list').on('click', function(event){
 	index = event.target.id;
 	phrases.splice(index, 1);
 	clearPhrases();
 	displayPhrases(phrases);
});

function addPhraseToArray(phrase){
  phrases.push(phrase);
}

function displayPhrases(phrases){
	for(i=0; i<phrases.length; i++){
		$('.phrases-list').append("<li>" + phrases[i] + "</li>" 
			+ "<img src='https://cdn3.iconfinder.com/data/icons/lynx/22x22/actions/dialog-close.png' id=" + i +" />");
  }
}

function clearPhrases(){
	$('.phrases-list').html("");
}


