pragma solidity ^0.8.4;

contract Contract {
    function sumAndAverage(
       uint a, 
       uint c, 
       uint w, 
       uint p 
    )external pure returns(uint sum, uint average){
        sum = a + c + w + p;
        average = (a + c + w + p)/4 ;
    }
}
