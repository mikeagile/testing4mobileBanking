@transfer 
Feature: Transfer
As a BanK client and i need do a transfer

Background: Welcome
    Given Access to web
    When check global position
    Then select transfer

@toPopularAccount
Scenario Outline: transfer
    Given select source account
    And select destination account
    When set amount "<amount>", comments "<comments>", phone "<phone>" and email "<email>"
    Then set key operations "<key>", check LOPD and press continue
    
    Examples: 
    | amount | comments | phone     | email                 | key  |
    | 1500   | rent car | 626962051 | miguel@simpleswipe.es | 1234 |
    