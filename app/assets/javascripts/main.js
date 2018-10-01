function bindEventListeners() {
  $("#new_beer").on("submit", newBeer)
}

function nextBeer() {
  var nextId = parseInt($(".js-next").attr("data-id")) + 1;
  $.get("/beers/" + nextId + ".json", function(data) {
    $("h3").text(data["name"]);
    $("#brewery").text(data["brewery"]);
    $("h5").text(data["style"]);
      // re-set the id to current on the link
    $(".js-next").attr("data-id", data["id"]);
    $(".js-prev").attr("data-id", data["id"]);
  });
}

function prevBeer() {
  var prevId = parseInt($(".js-prev").attr("data-id")) - 1;
  $.get("/beers/" + prevId + ".json", function(data) {
    $("h3").text(data["name"]);
    $("#brewery").text(data["brewery"]);
    $("h5").text(data["style"]);
      // re-set the id to current on the link
    $(".js-prev").attr("data-id", data["id"]);
    $(".js-next").attr("data-id", data["id"]);
  });
}

function newBeer(e) {
  e.preventDefault()
  var values = $(this).serialize();
  var form = this
  var posting = $.post('/beers', values);

  posting.done(function(data) {
    var beer = new Beer(data.id, data.name, data.brewery, data.style);
    $("#beers").append(beer.template());
    form.reset()
    });
}

function beerIndex(id) {
  $.get("/users/" + id + ".json", function(data) {

    data.beers.sort(function(a, b){return a.brewery > b.brewery})

    function beertable() {
      return data.beers.map(beer =>{
        var tablebeer = new Beer(beer.id, beer.name, beer.brewery, beer.style)
        return tablebeer.tableTemplate()}
      ).join('')
    }

    $(`#${id}add`).html(beertable());
  });
}

window.onload = bindEventListeners;
