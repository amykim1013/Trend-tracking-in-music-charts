// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";

contract MusicNFT is ERC721, IERC2981 {
    struct Music {
        string title;
        string artist;
        uint256 trackID;
        mapping(address => uint256) streamCounts;
    }

    Music[] public musicList;

    mapping(uint256 => address) public musicOwner;
    mapping(uint256 => uint256) public royaltyBPS;

    bool public resaleAllowed = false;
    uint256 public maxStreamCount = 100;

    event Streamed(uint256 musicID, address streamer);

    constructor() ERC721("MusicNFT", "MUSIC") {}

    function createMusicNFT(string memory _title, string memory _artist, uint256 _trackID, uint256 _royalty) public {
        Music memory newMusic = Music(_title, _artist, _trackID);
        uint256 musicID = musicList.length;
        musicList.push(newMusic);
        _safeMint(msg.sender, musicID);
        musicOwner[musicID] = msg.sender;
        royaltyBPS[musicID] = _royalty;
    }

    function transferMusicNFT(address _receiver, uint256 _musicID) public {
        require(msg.sender == musicOwner[_musicID], "You are not the owner of this music NFT");
        _transfer(msg.sender, _receiver, _musicID);
        musicOwner[_musicID] = _receiver;
    }

    function getMusicDetails(uint256 _musicID) public view returns (string memory, string memory, uint256, address) {
        Music storage music = musicList[_musicID];
        return (music.title, music.artist, music.trackID, musicOwner[_musicID]);
    }

    function streamMusic(uint256 _musicID) public {
        Music storage music = musicList[_musicID];
        uint256 streamCount = music.streamCounts[msg.sender];
        require(streamCount < maxStreamCount, "You have exceeded the maximum number of streams allowed in one sitting");
        music.streamCounts[msg.sender] = streamCount + 1;

        emit Streamed(_musicID, msg.sender);
    }

    function royaltyInfo(uint256 _tokenId, uint256 _salePrice) external view override returns (address, uint256) {
        uint256 royalty = (_salePrice * royaltyBPS[_tokenId]) / 10000;
        return (musicOwner[_tokenId], royalty);
    }

    function isResaleAllowed(uint256 _musicID) public view returns (bool) {
        return resaleAllowed;
    }

    function setResaleAllowed(bool _resaleAllowed) public {
        resaleAllowed = _resaleAllowed;
    }

    function setMaxStreamCount(uint256 _maxStreamCount) public {
        maxStreamCount = _maxStreamCount;
    }
}

