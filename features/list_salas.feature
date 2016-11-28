Feature: display list of salas

  Given the following salas exist:
  | nome                    | qtd_lugares | disponivel |
  | sala 1                  | 20          | true       |
  | sala 2                  | 10          | true       |
  | sala 3                  | 10          | false      |
  | sala 4                  | 15          | true       |
  | sala 5                  | 5           | false      |

Scenario: list all salas
  Given I am on the salas page	
  Then I should see all the salas