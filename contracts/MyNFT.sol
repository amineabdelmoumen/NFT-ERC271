//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



//contains the implementation of the ERC-721 standard, which our NFT smart contract will inherit
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
//provides counters that can only be incremented or decremented by one
import "@openzeppelin/contracts/utils/Counters.sol";
//sets up access control on our smart contract, so only the owner of the smart contract (you) can mint NFTs
import "@openzeppelin/contracts/access/Ownable.sol";
//contract is an implementation of ERC721 that includes the metadata standard extensions,
//That’s where the _setTokenURI method comes from
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable {  //we declare it Ownable so only the owner can mint nfts
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() public ERC721("MyNFT", "NFT") {}
     /*
    ----address recipient:  specifies the address that will receive your freshly minted NFT
    ----string memory tokenURI:  is a string that should resolve to a JSON document that describes the NFT's metadata
     */
    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
