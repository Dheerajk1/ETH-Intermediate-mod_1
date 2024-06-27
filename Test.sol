// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversityEligibility 
{
    uint256 public score = 30;
    address public administrator;

   
    event ScoreUpdated(uint256 newScore);                  // creating event to log when the score is updated

   
    modifier onlyAdmin()                                  // creating modifier to restrict access to the administrator
    {
        require(msg.sender == administrator, "Access denied: Caller is not the admin");
        _;
    }

    constructor() 
    {
        // Setting the contract deployer as the administrator
        administrator = msg.sender;
    }

    
    function validateIITEligibility(uint256 newScore) external onlyAdmin       // Function to verify eligibility for IIT
    {
        require(newScore > 90, "Ineligible: Score must be greater than 90");

        score = newScore;
        emit ScoreUpdated(newScore);
    }

    
    function validateNITEligibility(uint256 newScore) external onlyAdmin      // Function to verify eligibility for NIT
    {
        require(newScore > 80, "Ineligible: Score must be greater than 80");

        score = newScore;
        emit ScoreUpdated(newScore);
    }

    
    function validatePrivateEligibility(uint256 newScore) external onlyAdmin   // Function to verify eligibility for private universities
    {
        require(newScore > 60, "Ineligible: Score must be greater than 60");

        score = newScore;
        emit ScoreUpdated(newScore);
    }

    
    function checkMinimumPassingScore() external view                          // Function to check minimum passing score
    {
        assert(score >= 33); // This should always be true
    }

    
    function validateGeneralEligibility(uint256 newScore) external onlyAdmin   // Function to verify eligibility for any university
    {
        if (newScore <= 45) {
            revert("Ineligible: Score must be greater than 45 for any university");
        }
        score = newScore;
        emit ScoreUpdated(newScore);
    }
}

