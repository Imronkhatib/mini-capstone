var productTemplate = document.querySelector('#product-template');
var productContainer = document.querySelector('.row');

productContainer.appendChild(productTemplate.content.cloneNode(true));