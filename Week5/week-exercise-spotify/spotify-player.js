var ENDPOINT_TRACK = 'https://api.spotify.com/v1/search?type=track&query='
var ENDPOINT_ARTIST = 'https://api.spotify.com/v1/search?type=artist&query='
var FORM_SELECTOR = '.js-search-form';

function trackRequest (search_term) {
	$.ajax({
      	type: 'GET',
    	url: ENDPOINT_TRACK + search_term,
      	dataType: 'json',
      	success: handleTrackSearch
    });
};

function artistRequest (search_term) {
	$.ajax({
      	type: 'GET',
    	url: ENDPOINT_ARTIST + search_term,
      	dataType: 'json',
      	success: handleArtistSearch
    });
};

function handleArtistSearch (response){
	$('.modal-title').text(response.artists.items[0].name);
	$('.js-artist-img').find('img').prop('src', response.artists.items[0].images[0].url);
	$('.js-artist-genres').text(displayGenres(response.artists.items[0].genres));
	$('.js-artist-followers').text(response.artists.items[0].followers.total);
	$('.js-artist-popularity').text(response.artists.items[0].popularity);
}

function handleTrackSearch (response){
	selectedTrack = response.tracks.items[0];
	trackListModal(response.tracks.items);
	$('.author').text(selectedTrack.artists[0].name);
	$('.title').text(selectedTrack.name)
	$('audio').prop('src', selectedTrack.preview_url);
	$('.cover').find('img').prop('src', selectedTrack.album.images[0].url);
}

function trackListModal (trackList){
	trackList.forEach(function (item, index) {
  	$('.more-results-list').append('<dd id=' + item.id  + '>' + item.name + ' by ' + item.artists[0].name + '</dd>');
	});
}

function printTime () {
  var current = $('.js-player').prop('currentTime');
  $('progress').val(current);
  console.debug('Current time: ' + current);
}

function displayGenres (arrayOfGenres) {
	return arrayOfGenres.join(", ");
}

$(document).on('ready',function(){

	$(FORM_SELECTOR).on('submit', function(event) {
		event.preventDefault();
		trackRequest($('input').val());
	});

	$('.btn-play').on('click', function(event){
		if ($('.btn-play').hasClass('playing')){
			$('.js-player').trigger('pause');
			$('.btn-play').removeClass('playing');
		} else {
			$('.js-player').trigger('play');
			$('.btn-play').addClass('playing');	
		}
	});

	$('.js-player').on('timeupdate', printTime);

	$('.author').on('click', function(event){
		artistRequest($('.author').text());
	});

	$('.more-results-list').on('click', function(event){
		//Bonus iteration 2 to be finished
		console.log("Id from the selected song" + event.target.id);
	});

});

