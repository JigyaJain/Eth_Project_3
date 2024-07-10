# Eth_Project_3
This solidity program is a smart contract of creating our own ERC20 token. The project aims for creating and deploying token.

## Description

This smart contract is creating an ERC20 token and aims to implement the ERC20 interface in our contract. There are different functions inside this ERC20 interface and by this program we use some of the functions like mint, burn and transfer. Mint function allows only contract owner to mint the token and this is done by using a modifier. In this we have also done a mapping from address to uint that maps a owner's address with its amount. 

## Getting Started

### Executing program

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

    
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the Compile "myContract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "myContract" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint, burn and transfer function. Before calling mint function we need to ensure that only owner is minting thte token i.e you have selected that account whose address is stored in owner's address. Now we can call our functions one by one and fill the necesaary details and then transact it and see the result. We can also check the token name, its symbol also.
If any of the condition is not correct then it reverts the transaction.

## Authors

Jigya Jain

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
    
