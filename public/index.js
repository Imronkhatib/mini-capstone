var productTemplate = document.querySelector('#product-template');
var productContainer = document.querySelector('.row');

//    productContainer.appendChild(productTemplate.content.cloneNode(true));

/* global axios */

axios.get("http://localhost:3000/v1/products").then(function(response) {
  // console.log(response.data);
  var products = response.data;

  for (var i = 0; i < products.length; i++) {
    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector('.card-title').innerText = products[i].name;
    productContainer.appendChild(productClone);
  }  
});