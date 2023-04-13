# Trend tracking transparancy in music charts
Chart manipulation has become a source of concern in online music streaming platforms. Given the huge influence of charts on the users’  listening behaviors, their fabrication threatens the ecosystem in the form of unfair compensation to the artists, loss in public’s confidence, and damages to the industry's artistic standard, just to name a few. While platforms like Spotify are held accountable in ensuring transparency in trend tracking, fake streams are challenging to detect and prevent. 

We thereby propose a solution that utilizes smart contracts and non-fungible tokens (NFTs) to ensure transparency in music charting.


## MusicNFT
MusicNFT is a smart contract built on the Ethereum blockchain using Solidity. It allows users to create and own unique music NFTs (non-fungible tokens) that represent ownership of a particular piece of music. Each music NFT contains information such as the title, artist, and track ID of the music it represents.

This project was created as part of the Hackust 2023 hackathon.

## Features
Users can create and own unique music NFTs
Music NFTs contain information such as the title, artist, and track ID of the music they represent
Users can transfer ownership of their music NFTs to other users
The contract implements the IERC2981 royalty standard for collecting and distributing royalties to the original music creator
The contract allows for streaming records to be made public

## Usage
To use MusicNFT, simply deploy the contract to the Ethereum network and interact with it using a compatible wallet such as MetaMask. Users can create music NFTs by calling the createMusicNFT function with the required parameters such as the music title, artist, track ID, and royalty percentage. The transferMusicNFT function can be used to transfer ownership of a music NFT to another user.

## Dependencies
Solidity v0.8.0
OpenZeppelin Contracts v4.5.0

## Contributors
Team CMH

## License
This project is licensed under the MIT License. 
