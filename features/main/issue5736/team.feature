@issue5736 @5736_team
Feature: Resources, subresources and their subresources with uri variables that are not `id`
  As a client software developer
  I need to be able to update subresources and their deeper subresources

  @createSchema
  Scenario: GET Teams collection
    Given there is a company with name "Company #1"
    And there are 3 teams in company 1
    And I send a "GET" request to "/issue5736_companies/1/issue5736_teams"

    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
        "@context": "/contexts/Team",
        "@id": "/issue5736_companies/1/issue5736_teams",
        "@type": "hydra:Collection",
        "hydra:totalItems": 3,
        "hydra:member": [
            {
                "@id": "/issue5736_companies/1/issue5736_teams/1",
                "@type": "Team",
                "id": 1,
                "company": "/issue5736_companies/1",
                "name": "Team #1",
                "employees": []
            },
            {
                "@id": "/issue5736_companies/1/issue5736_teams/2",
                "@type": "Team",
                "id": 2,
                "company": "/issue5736_companies/1",
                "name": "Team #2",
                "employees": []
            },
            {
                "@id": "/issue5736_companies/1/issue5736_teams/3",
                "@type": "Team",
                "id": 3,
                "company": "/issue5736_companies/1",
                "name": "Team #3",
                "employees": []
            }
        ]
    }
    """

  @createSchema
  Scenario: POST Team
    Given there is a company with name "Company #1"
    And I add "Content-Type" header equal to "application/ld+json"
    And I send a "POST" request to "/issue5736_companies/1/issue5736_teams" with body:
    """
    {
      "name": "Team 1"
    }
    """

    Then the response status code should be 201
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
       "@context": "/contexts/Team",
       "@id": "/issue5736_companies/1/issue5736_teams/1",
       "@type": "Team",
       "id": 1,
       "company": "/issue5736_companies/1",
       "name": "Team 1",
       "employees": []
    }
    """

  @createSchema
  Scenario: GET Team
    Given there is a company with name "Company #1"
    And there is a team "Team #1" in company 1
    And I add "Content-Type" header equal to "application/ld+json"
    And I send a "GET" request to "/issue5736_companies/1/issue5736_teams/1"

    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/Team",
      "@id": "/issue5736_companies/1/issue5736_teams/1",
      "@type": "Team",
      "id": 1,
      "company": "/issue5736_companies/1",
      "name": "Team #1",
      "employees": []
    }
    """

  @createSchema
  Scenario: PUT Team
    Given there is a company with name "Company #1"
    And there is a team "Team #1" in company 1
    And I add "Content-Type" header equal to "application/ld+json"
    And I send a "PUT" request to "/issue5736_companies/1/issue5736_teams/1" with body:
    """
    {
      "name": "Team #1 - edited"
    }
    """

    Then the response status code should be 200
    And the response should be in JSON
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/Team",
      "@id": "/issue5736_companies/1/issue5736_teams/1",
      "@type": "Team",
      "id": 1,
      "company": "/issue5736_companies/1",
      "name": "Team #1 - edited",
      "employees": []
    }
    """
