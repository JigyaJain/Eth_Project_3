// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// For this project, you will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
// From your chosen tool, the contract owner should be able to mint tokens to a provided address and any user should be 
// able to burn and transfer tokens.
// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn tokens

contract myContract is ERC20{
    address private owner;

    constructor() ERC20( "MySmartToken", "MST"){
        owner = msg.sender;
    }

    mapping(address => uint) balance;

    modifier checkOwner(){
        require(owner == msg.sender, "Only contract owner can mint tokens");
        _;
    }
    
    function mintToken() public checkOwner returns (uint){
        _mint(address(owner), 4000) ;
        balance[owner] = 4000;

        return balance[owner];
    }

    function burnToken( address _add, uint _amount) public {
        _burn(address(_add), _amount);
    }

    function transferToken( address _to, uint _amount) public returns  (uint){
        require(balance[owner]>= _amount , "Amount transfer cannot be initialted because balance in low");
        _transfer( owner, _to, _amount);

        return balance[_to];
    }
}