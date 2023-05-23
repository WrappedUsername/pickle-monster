// SPDX-License-Identifier: MIT
/**
      ::::::::: ::::::::::: ::::::::  :::    ::: :::        :::::::::: 
     :+:    :+:    :+:    :+:    :+: :+:   :+:  :+:        :+:         
    +:+    +:+    +:+    +:+        +:+  +:+   +:+        +:+          
   +#++:++#+     +#+    +#+        +#++:++    +#+        +#++:++#      
  +#+           +#+    +#+        +#+  +#+   +#+        +#+            
 #+#           #+#    #+#    #+# #+#   #+#  #+#        #+#             
###       ########### ########  ###    ### ########## ##########       

        :::   :::    ::::::::  ::::    :::  :::::::: ::::::::::: :::::::::: ::::::::: 
      :+:+: :+:+:  :+:    :+: :+:+:   :+: :+:    :+:    :+:     :+:        :+:    :+: 
    +:+ +:+:+ +:+ +:+    +:+ :+:+:+  +:+ +:+           +:+     +:+        +:+    +:+  
   +#+  +:+  +#+ +#+    +:+ +#+ +:+ +#+ +#++:++#++    +#+     +#++:++#   +#++:++#:    
  +#+       +#+ +#+    +#+ +#+  +#+#+#        +#+    +#+     +#+        +#+    +#+    
 #+#       #+# #+#    #+# #+#   #+#+# #+#    #+#    #+#     #+#        #+#    #+#     
###       ###  ########  ###    ####  ########     ###     ########## ###    ###      

      :::::::::     :::   :::   :::  :::   :::   :::::::::: ::::    ::: ::::::::::: :::::::: 
     :+:    :+:  :+: :+: :+:   :+: :+:+: :+:+:  :+:        :+:+:   :+:     :+:    :+:    :+: 
    +:+    +:+ +:+   +:+ +:+ +:+ +:+ +:+:+ +:+ +:+        :+:+:+  +:+     +:+    +:+         
   +#++:++#+ +#++:++#++: +#++:  +#+  +:+  +#+ +#++:++#   +#+ +:+ +#+     +#+    +#++:++#++   
  +#+       +#+     +#+  +#+   +#+       +#+ +#+        +#+  +#+#+#     +#+           +#+    
 #+#       #+#     #+#  #+#   #+#       #+# #+#        #+#   #+#+#     #+#    #+#    #+#     
###       ###     ###  ###   ###       ### ########## ###    ####     ###     ########       
*/
pragma solidity 0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @author WrappedUsername
contract PickleMonsterPayments is Ownable {
    /// @notice Price will be in MATIC
    uint256 public priceAviationArt = 18 ether;
    uint256 public priceDCSWorldMovie = 8 ether;
    uint256 public priceDCSWorldMission = 8 ether;
    uint256 public priceDCSWorldModule = 80 ether;
    uint256 public priceCustomAIGenerativeNFT = 180 ether;

    event PaymentReceived(address indexed payer, uint256 amount);
    event UpdatePrice(uint256 amount, uint256 when);
    event Withdrawal(uint256 amount, uint256 when);

    constructor() {}

    function purchaseAviationArt() public payable {
        require(msg.value == priceAviationArt, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function purchaseDCSWorldMovie() public payable {
        require(msg.value == priceDCSWorldMovie, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function purchaseDCSWorldMission() public payable {
        require(msg.value == priceDCSWorldMission, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function purchaseDCSWorldModule() public payable {
        require(msg.value == priceDCSWorldModule, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function purchaseCustomAIGenerativeNFT() public payable {
        require(msg.value == priceCustomAIGenerativeNFT, "Incorrect payment amount");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function updateAviationArtPrice(uint256 newAviationArtPrice) public payable onlyOwner {
        priceAviationArt = newAviationArtPrice;
        emit UpdatePrice(newAviationArtPrice, block.timestamp);
    }

    function updateDCSWorldMoviePrice(uint256 newDCSWorldMoviePrice) public payable onlyOwner {
        priceDCSWorldMovie = newDCSWorldMoviePrice;
        emit UpdatePrice(newDCSWorldMoviePrice, block.timestamp);
    }

    function updateDCSWorldMissionPrice(uint256 newDCSWorldMissionPrice) public payable onlyOwner {
        priceDCSWorldMission = newDCSWorldMissionPrice;
        emit UpdatePrice(newDCSWorldMissionPrice, block.timestamp);
    }

    function updateDCSWorldModulePrice(uint256 newDCSWorldModulePrice) public payable onlyOwner {
        priceDCSWorldModule = newDCSWorldModulePrice;
        emit UpdatePrice(newDCSWorldModulePrice, block.timestamp);
    }

    function updateCustomAIGenerativeNFTPrice(uint256 newCustomAIGenerativeNFTPrice) public payable onlyOwner {
        priceCustomAIGenerativeNFT = newCustomAIGenerativeNFTPrice;
        emit UpdatePrice(newCustomAIGenerativeNFTPrice, block.timestamp);
    }

    function getThisBalance() public view onlyOwner returns(uint256) {
        return address(this).balance;
    }

    function withdraw() public payable onlyOwner {
        payable(owner()).transfer(address(this).balance);
        emit Withdrawal(address(this).balance, block.timestamp);
    }
}