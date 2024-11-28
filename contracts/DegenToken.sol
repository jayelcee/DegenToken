// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    struct Item {
        string id;
        string name;
        uint256 price;
        string description;
    }

    mapping(string => Item) private shop; 
    mapping(address => string[]) private playerOwnedItems; 

    event ItemRedeemed(address indexed player, string itemId, string itemName, uint256 price);
    event TokensBurned(address indexed burner, uint256 amount);

    constructor() ERC20("Degen", "DGN") {
        // Add initial shop items
        addItem("gold-sword", "Gold Sword", 500, "A mighty sword forged from gold.");
        addItem("silver-shield", "Silver Shield", 300, "A sturdy shield made of silver.");
        addItem("healing-potion", "Healing Potion", 100, "Restores 50 health points.");
    }

    // Mint new tokens (only owner can mint)
    function mint(address to, uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        _mint(to, amount);
    }

    // Burn tokens
    function burn(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    // Transfer tokens
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        super.transfer(recipient, amount);
        return true;
    }

    // Redeem an item from the shop
    function redeem(string memory itemId) external {
        Item memory item = shop[itemId];
        require(bytes(item.id).length > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

        _burn(msg.sender, item.price); 
        playerOwnedItems[msg.sender].push(itemId); 

        emit ItemRedeemed(msg.sender, item.id, item.name, item.price);
    }

    // Add items to the shop
    function addItem(string memory itemId, string memory name, uint256 price, string memory description) public onlyOwner {
        shop[itemId] = Item(itemId, name, price, description);
    }

    // View shop items
    function getShopItems() external view returns (Item[] memory) {
        uint256 shopSize = 3;
        Item[] memory items = new Item[](shopSize);

        items[0] = shop["gold-sword"];
        items[1] = shop["silver-shield"];
        items[2] = shop["healing-potion"];

        return items;
    }
}
