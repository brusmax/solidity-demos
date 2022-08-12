// SPDX-License-Identifier: GPL-3.0
// @author: @Brusmax

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Roles
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

 import "@openzeppelin/contracts/access/AccessControl.sol";

contract Roles is AccessControl{

    // 2. Implement roles: Admin & Writer
    bytes32 public constant ROL_ADMIN = keccak256("Admin");
    bytes32 public constant ROL_WRITER = keccak256("Writer");

    constructor(){
        _grantRole(ROL_ADMIN, msg.sender);
    }

    /*
    * 3. Ruls for rol Admin
    * 6. Modifier
    */
    modifier onlyAdmin{
        require(hasRole(ROL_ADMIN, msg.sender), "This function can be used only by ADMIN");
        _;
    }

    /*
    * 3. writer role is can only use the "store" function
    * 6. Modifier
    */
    modifier onlyWriter(){
        require(hasRole(ROL_WRITER, msg.sender), "This function can be used only by WRITER");
        _;
    }

    function addRole(bytes32 _role, address _account) public{
        require(hasRole(ROL_ADMIN, msg.sender), "This function can be used only by ADMIN");
        _grantRole(_role, _account);
    }

}