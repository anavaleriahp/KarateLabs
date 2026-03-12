Feature: Validamos consulta de usuarios

  Background: Configuracion
    * karate.configure('ssl', true);
    * def baseUrl = 'https://dummyjson.com'
    * def tokenRequest = call read('classpath:/token.feature')
    * def token = tokenRequest.respuesta.accessToken
    * print tokenRequest

  Scenario: Consulta del user
    Given url baseUrl
    And path '/auth/me'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.address.city == 'Washington'
