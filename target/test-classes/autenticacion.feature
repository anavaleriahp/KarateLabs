Feature: Autenticación y consulta de usuarios

  Background: Configuración inicial y autenticación
    * def token = call read('classpath:/token.feature')
    * print 'Token obtenido:', token.response.accessToken

    Scenario: Consulta de usuarios autenticados
    # Utilizamos el token obtenido en el escenario anterior para realizar una consulta de usuarios
      Given url 'https://dummyjson.com'
      And path '/auth/me'
      And header Authorization = 'Bearer ' + token.response.accessToken
      When method get
      Then status 200
      # Verificamos que la respuesta contenga un usuario específico
      And match response.username == 'sophiab'
