/* global Vue, VueRouter, axios */


var ProductShowPage = {
  template: "#product-show-page",
  data: function() {
    return {
      message: "This is working",
      product: {}
    };
  },
  created: function() {
    axios.get('/v1/products/1').then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {

  },
  computed: {}
};


var ShoppingCartPage = {
  template: "#shoppingcart-page",
  data: function() {
    return {
      message: "This is working",
      products: []
    };
  },
  created: function() {
    axios.get('/v1/carted-products').then(function(response) {
      this.cartedproducts = response.data;
      // console.log(response.data);
      console.log(response.data);
    }.bind(this));
  },
  methods: {

  },
  computed: {}
};

var ProductNewPage = {
  template: "#products-new-page",
  data: function() {
    return {
      name: "",
      price: "",
      description:"",
      stock: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        stock: this.stock
      };
      axios
        .post("/v1/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v1/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      products: []
    };
  },
  created: function() {
    axios.get('/v1/products').then(function(response) {
      this.products = response.data;
      console.log(response.data);
    }.bind(this));
  },
  methods: {

  },
  computed: {}
};

var PracticePage = {
  template: "#practice-page",
  data: function() {
    return {
      message: "This is a practice Page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/practice", component: PracticePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/products/new", component: ProductNewPage },
    { path: "/products/:id", component: ProductShowPage },
    { path: "/shoppingcart", component: ShoppingCartPage },
    { path: "/logout", component: LogoutPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});


var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});


