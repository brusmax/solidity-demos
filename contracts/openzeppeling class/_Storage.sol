// SPDX-License-Identifier: GPL-3.0
// @author: @Brusmax

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


/*
* Challenges:
* 1. Take the Remix Storage contract.
* 2. Implement two roles: “Admin” and “Writer”.
* 3. “Admin” role will be able to add and remove “Writer”.
* 4. The “Writer” role will be the only one enabled to use the “store” function.
* 5. The reception function will have no role restrictions.
* 6. Use of modifiers.
*/

 // 2. Roles implemented into Roles contract
 import "./Roles.sol";

// 1. Contract token from Remix Storage 
contract Storage is Roles {

    uint256 number;
    
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyWriter() {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}