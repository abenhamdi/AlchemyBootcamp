// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {

    function sum(uint[] memory values) external pure returns (uint) {
        
        uint sumValue = 0; 
        for(uint i = 0; i < values.length; i++){
            sumValue += values[i];
        }

        return sumValue; 
    }
    
}
