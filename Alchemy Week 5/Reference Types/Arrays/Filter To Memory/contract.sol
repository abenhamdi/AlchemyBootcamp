// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {

    function filterEven(uint[] calldata integers) external pure returns (uint[] memory) {
        uint nums;
        for(uint i = 0; i < integers.length; i++){
            if(integers [i] % 2 == 0){
                nums ++;
            }
        }  
        // create a new array with same size 
        uint[] memory sfiltred= new uint[] (nums);
        // keep an index to filter from where we are 
        uint indexpos = 0; 
        for(uint i = 0; i < integers.length; i++){
            if(integers[i] % 2 == 0){
                sfiltred[indexpos] = integers[i];
                indexpos ++; 
            }
        }
        return sfiltred;   
    }

}
