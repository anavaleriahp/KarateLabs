Feature: Funcionalidades de Usuario

  Background: Configuraciones
    * def requestUsuario = read('classpath:/userRequest.json')

    Scenario Outline: Crear Usuario
      Given url baseUrl
      And path '/users/add'
      And requestUsuario.firstName = '<nombre>'
      And requestUsuario.lastName = '<apellido>'
      And requestUsuario.age = <edad>
      And requestUsuario.username = '<usuario>'
      And requestUsuario.password = '<clave>'
      And request requestUsuario
      When method post
      Then status 201
      Examples:
      | read('classpath:/data.csv') |
