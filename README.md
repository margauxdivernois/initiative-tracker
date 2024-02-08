# Initiative Tracker for TTRPG

This project's goal is the development of a simple and straightforward application allowing the GM (game master) to keep track of the initiatives of the players and NPCs (non-player characters) during a fight in TTRPG (tabletop role playing games) such as Dungeon & Dragons. 

The application must contains **two main pages**: 

- One dedicated to the GM needing a simple authentication system in which they can see secret information and manage the life and status of the NPC.
- One dedicated to the players, only imagined for display purpose. It will not be possible to interact with it, but it should update itself frequently to display the battle state.  

A third page will allow the GM to select the characters involved in the fight, either from a simple form or from a stock of saved characters. 

## Usage workflow 

- At the beginning of a fight, every player throw a dice and calculate their initiative. The GM will throw it for every NPC taking part in the fight. This will generate the playing order, with the biggest one being the first to play. 
- The GM will select on the application the characters for the fight and insert their respective initiative. They can either create a new character or take one from a list. The fight can start. 
- Each time a player finish their turn, the GM can click on "Next turn" button allowing the screen to update and display the next character playing. 
- The GM can update the life or remove the characters from the initiative tracker anytime. The life is only shown on the GM's screen. 

## Functionalities 

### Must have - Game Master-centric

This application is mainly focused on the GM side. 

- Access with a password to the GM-related pages
- Initiative tracking as a list, updated with a "next" button 
- Possibility to create characters using a form 
- Possibility to store these characters for a future usage
- Selection of the characters, with possibility to insert their initiative roll
- Update the life of a character from the initiative page

### Nice to have

- Additional informations can be added to a character, like their AC (Armor Class), an URL for additional informations and an image (which will be displayed when they play)
- A character can be "duplicable" or "unique"
- Game Master can add a condition, like charmed, frightened, etc
- Game Master can add a character in an on-going fight 
- Player-dedicated screen with minimal informations

### Initial wireframes

![image](https://github.com/margauxdivernois/initiative-tracker/assets/11376158/457bc882-570f-4f25-9ee2-dab2419916e1)

![image](https://github.com/margauxdivernois/initiative-tracker/assets/11376158/050d0697-c443-482d-a635-3d14e316a25d)

![image](https://github.com/margauxdivernois/initiative-tracker/assets/11376158/2a789205-b4f5-4a9a-8b30-4ee1514b10bf)

## Technology 

- This application will be developed with Ruby on Rails.
- Multiple accounts are not needed here. The authentication will be managed with a single configured account defined during the deployment (environment). The authentication will be necessary for the GM to access the configuration and full-scoped initiative tracker. 
- Database initial image

<img width="363" alt="image" src="https://github.com/margauxdivernois/initiative-tracker/assets/11376158/094f1d40-25ba-437e-8ad4-e4ad10a78d21">
