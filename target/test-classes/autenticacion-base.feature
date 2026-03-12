Feature: Autenticación

  Background: Configuración inicial y autenticación
    * karate.configure('ssl', true);
  # Configuramos la URL base de la API y realizamos la autenticación
    Given url 'https://dummyjson.com'
    And path '/auth/login'
    * request
    """
    {
      "username": "sophiab",
      "password": "sophiabpass",
      "expiresInMins": 30,
      "credentials": "include"
    }
    """
    When method POST
    Then status 200
    # Imprimimos toda la respuesta para verificar su estructura
    And print 'response:', response
    # Guardamos el código retornado por la API en una variable para su uso en los escenarios
    And def token = response.accessToken.toString()
    And print 'token:', token

  Scenario: Consulta de usuarios autenticados
    # Utilizamos el token obtenido en el escenario anterior para realizar una consulta de usuarios
    Given url 'https://dummyjson.com'
    And path '/auth/me'
    And header Authorization = 'Bearer ' + token
    When method GET
    Then status 200
      # Verificamos que la respuesta contenga un usuario específico
    And match response.username == 'sophiab'