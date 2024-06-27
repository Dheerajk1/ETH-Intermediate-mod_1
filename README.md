# ETH-Intermediate-mod_1

## Overview
The UniversityEligibility contract is designed to manage and verify the eligibility of a student based on their score for different types of universities (IIT, NIT, private universities, and any university). The contract includes functionalities to update and check student scores using require(), assert(), and revert() statements. Only the contract administrator can update the student scores.

## Contract Details

### State Variables
uint256 public score: Stores the score of the student, initialized to 30.

address public administrator: Stores the address of the contract administrator (the deployer).

### Events
event ScoreUpdated(uint256 newScore): Logs when the student score is updated.

### Modifiers
modifier onlyAdmin(): Restricts certain functions to be callable only by the contract administrator. It uses require() to check if the caller is the administrator.

### Constructor
constructor(): Sets the contract deployer as the administrator using msg.sender.

### Functions
1.
       validateIITEligibility
       function validateIITEligibility(uint256 newScore) external onlyAdmin
       
Checks if the student's score is greater than 90. If true, it updates the score and emits the ScoreUpdated event. Otherwise, it throws an error with a require() statement.



2.
       validateNITEligibility
       function validateNITEligibility(uint256 newScore) external onlyAdmin
       
Checks if the student's score is greater than 80. If true, it updates the score and emits the ScoreUpdated event. Otherwise, it throws an error with a require() statement.



3.
       validatePrivateEligibility
       function validatePrivateEligibility(uint256 newScore) external onlyAdmin
       
Checks if the student's score is greater than 60. If true, it updates the score and emits the ScoreUpdated event. Otherwise, it throws an error with a require() statement.



4.
       checkMinimumPassingScore
       function checkMinimumPassingScore() external view
       
Uses an assert() statement to ensure the student's score is at least 33. The assert() statement is used here to enforce a condition that should always be true and will cause the transaction to revert if it is not met.



5.
       validateGeneralEligibility
       function validateGeneralEligibility(uint256 newScore) external onlyAdmin
       
Checks if the student's score is greater than 45. If not, it uses a revert() statement to stop execution and revert any changes made during the transaction, providing a specific error message.

