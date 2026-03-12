Feature: Autenticación

  Scenario: Configuración inicial y autenticación
  # Configuramos la URL base de la API y realizamos la autenticación
    Given url 'https://dummyjson.com'
    And path '/auth/login'
    * request read('classpath:/authRequest.json')
    When method post
    Then status 200
    # Imprimimos toda la respuesta para verificar su estructura
    And print 'response:', response
    # Guardamos el código retornado por la API en una variable para su uso en los escenarios
    And def token = response.accessToken.toString()
    And print 'token:', token

