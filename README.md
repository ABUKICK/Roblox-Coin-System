# Server-Side Coin System for Roblox

A modular Coin System for your Roblox game. This script uses the leaderboards built into Roblox (`leaderstats`) and, therefore, requires no additional graphical user interface (GUI). Additionally, this system utilizes TweenService to create smoothly rotating coin animations.

## Features

- System Integration: This system automatically adds the leaderboard folders created by Roblox to track Coin amount, therefore, requiring no additional UI.

- Animation: Uses TweenService to create smoothly rotating coin animations.

- Respawn System: When a coin is collected, its animation is paused and it is removed from the screen for a short time before appearing again.

- Server-Side Validation: Validation on the server is used to ensure duplicate payouts are prevented.

## Setup and Installation

1. Leaderboard Script:

- Create a new 'Script' within 'ServerScriptService'.

- Paste the code located in 'LeaderstatsScript.lua'.

2. Coin Script:

- Place a part in 'Workspace' (e.g. a cylinder).

- Set 'Anchored' to true and 'CanCollide' to false.

- Place a script in the part and paste the code in 'CoinScript.lua'.

## License

This project is licensed under the [MIT License](LICENSE).
