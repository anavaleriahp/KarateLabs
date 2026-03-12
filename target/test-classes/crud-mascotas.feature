Feature: Funcionalidades de mascotas

  Background: Configuración inicial
    * def baseUrl = 'https://petstore.swagger.io/v2'
    * karate.configure('ssl', true);

  Scenario Outline: Creación de Mascota mediante POST
    Given url baseUrl
    And path "pet"
    And request
    """
        {
      "id": <codigo>,
      "category": {
        "id": 0,
        "name": <categoria>
      },
      "name": <nombre>,
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
      }
    """
    Then method post
    And status 200
    And match response.name == '<nombre>'
    Examples:
      | codigo    | nombre | categoria |
      | 000000123 | firu   | perros    |
      | 000000124 | pecas  | gatos     |

  Scenario: Consulta de Mascota mediante GET
    Given url baseUrl
    And path "pet/000000123"
    When method get
    Then status 200
    And match response.name == 'firu'

  Scenario: Actualización de Mascota mediante PUT
    Given url baseUrl
    And path "pet"
    And request
        """
            {
          "id": 000000123,
          "category": {
            "id": 0,
            "name": "perros"
          },
          "name": "Salvador",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "id": 0,
              "name": "string"
            }
          ],
          "status": "available"
        }
        """
    Then method put
    And status 200
    And match response.name == 'Salvador'

  Scenario Outline: Eliminación de Mascota mediante DELETE
    Given url baseUrl
    And path "pet/<codigo>"
    When method delete
    Then status 200
    And match response.message == '<codigo>'
    Examples:
      | codigo |
      | 123    |