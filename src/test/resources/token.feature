Feature: Ejecuto token

  Background: Configuracion
    * karate.configure('ssl', true);
    * def baseUrl = 'https://dummyjson.com'
    * def autenticacion = read('classpath:/autenticacion.json')

    Scenario: Obtener token de autenticacion
    Given url baseUrl
    And path '/auth/login'
    And header Content-Type = 'application/json'
    And request autenticacion
    When method post
    Then status 200
    And def respuesta = response
    And print 'respuesta:', respuesta
