// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes

contract Mage is Hero(50){  
    function attack(address enemy) public override{
        Enemy(enemy).takeAttack(Hero.AttackTypes.Spell);
        super.attack(enemy);
    }

}

contract Warrior is Hero(200){
    function attack(address enemy) public override{
        Enemy(enemy).takeAttack(Hero.AttackTypes.Brawl);
        super.attack(enemy);

    }
  
}
