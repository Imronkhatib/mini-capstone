var productTemplate = document.querySelector('#product-template');
var productContainer = document.querySelector('.row');
 

/* global axios */

axios.get("http://localhost:3000/v1/products").then(function(response) {
  // console.log(response.data);
  var products = response.data;

  for (var i = 0; i < products.length; i++) {
    var productContainer = productTemplate.content.cloneNode(true);
      productContainer.querySelector('.card-title').innerText = products[i].name;
  }
});