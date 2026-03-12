function fn() {
  var config = {
  baseUrl: 'https://petstore.swagger.io',
  baseUrl2: 'https://dummyjson.com',
  };

  // Configuración para ignorar errores SSL
  karate.configure('ssl', true);

  return config;
}
