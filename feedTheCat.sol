// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Error {

    // public variables
    uint public timesFed = 0;
    uint public totalCatsFed = 0;
    uint public prizeGathered = 0 ether;

    function feedCat (uint _value) public{
        require(_value >= 1, "Please feed your cat");
        timesFed += _value;
        assert(_value == 1);
    }

    function checkHunger () public {
        if (timesFed >= 5){
            timesFed = 0;
            revert("You fed the cat too many times and it became to chonky, please reset");
        }
        else if(timesFed >= 3){
            timesFed = 0;
            totalCatsFed++;
        }
        else{
            timesFed = 0;
            revert("Cat died of hungry, please reset");
        }
    }

    function checkCatStatus () public {
        if(totalCatsFed == 10){
            prizeGathered += 1 ether;
        }
        assert(totalCatsFed == 10);
    }

    function reset () public {
        timesFed = 0;
        totalCatsFed = 0;
        prizeGathered = 0 ether;
    }
}
