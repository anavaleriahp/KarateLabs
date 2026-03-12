Feature: Validacion de Endpoints API Petstore

  Background: Configuracion inicial
    * karate.configure('ssl', true);
    * def baseUrl = 'https://petstore.swagger.io'
    * def requestMascota = read('classpath:/mascotaRequest.json')

  Scenario Outline: Crear Mascota
    Given url baseUrl
    And path 'v2/pet'
    And request
    """
    {
    "id": <codigo>,
    "category": {
        "id": 0,
        "name": "<categoria>"
    },
    "name": "<nombre>",
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
    When method post
    Then status 200
    And match response.name == '<nombre>'
    Examples:
      | codigo    | nombre | categoria |
      | 000000123 | firu   | perros    |
      | 000000124 | pecas  | gatos     |

  Scenario Outline: Consultar Mascota
    Given url baseUrl
    And path 'v2/pet/<codigo>'
    When method get
    Then status 200
    Examples:
      | codigo    |
      | 000000123 |
      | 000000124 |

  Scenario: Actualizar Mascota
    Given url baseUrl
    And path 'v2/pet'
    And request requestMascota
    When method put
    Then status 200
    And match response.name == 'Salvador'

  Scenario Outline: Eliminar Mascota
    Given url baseUrl
    And path 'v2/pet/<codigoValido>'
    When method delete
    Then status 200
    And match response.message == '<codigoValido>'
    Examples:
      | codigoValido |
      | 124          |