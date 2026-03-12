Feature: Creación de Mascota usando karate
  #https://petstore.swagger.io/#/pet/addPet
  Scenario Outline: Creación de Mascota mediante POST
    Given url "https://petstore.swagger.io/v2"
    And karate.configure('ssl', true);
    And path "/pet"
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

