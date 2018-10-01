class Beer {
  constructor(id, name, brewery, style) {
    this.id = id
    this.name = name;
    this.brewery = brewery;
    this.style = style;
  }

 template() {
   return `<p><input type="checkbox" name="beer_ids[]" value="${this.id}">${this.name} - ${this.brewery} - ${this.style}</input> Rating: <input type="text" name="rating[${this.id}]"></p><br>`;
 }

 tableTemplate() {
   return `<tr><td>${this.name}</td><td>${this.brewery}</td><td>${this.style}</td></tr>`
 }
}
