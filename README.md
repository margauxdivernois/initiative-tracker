# Initiative Tracker for TTRPG

This project's goal is the development of a simple and straightforward application allowing the GM (game master) to keep track of the initiatives of the players and NPCs (non-player characters) during a fight in TTRPG (tabletop role playing games) such as Dungeon & Dragons.

## Specifications

- [Access to the specifications](Specifications.md)

## How to use

## How to launch

### Ruby on Rails

The development was done using the environment provided during the [MAS-RAD lessons](https://github.com/mas-rad/todomvc-rails-2023).

1. Install Docker and run :

```bash
docker volume create ruby-bundle-cache
```

2. Add the following alias to the shell configuration

```bash
alias docked='docker run --rm -it -v ${PWD}:/rails -v ruby-bundle-cache:/bundle -p 3000:3000 ghcr.io/mas-rad/rails-cli-firefox-esr:latest'
```

3. Clone this repository and run the following commands:

```bash
docked bundle
docked rails db:migrate
```

4. Load the fixtures (as Fights cannot be created through the interface)

```
docked rails db:fixtures:load
```

4. Run the server

```bash
docked rails server
```

The server should be available on `http://localhost:3000`.

### Password

The Game-Master dedicated pages are securized behind a password. This password is set in the environment files (`development.rb` and `production.rb`)

Default value is : `1234`

### How it works

1. Game Master log into the platform using a predefined password (see above for the default one).

2. Once connected, the Game Master can access the fights and the characters. The platform does not currently provide a creation form for the fights. As of version 1.0, it is necessary to use the fixtures.

3. Game Master can manage the characters from the "Characters" tab. They can create, update and delete the characters.

4. From the Fight tab, Game Master can access the fight screen. They can add characters, launch the fight, update the initiative and life (double-clic on the information) and advance the current player. They can also remove a player from the fight.

### Future

The developed application allows to manage the initiatives during a TTRPG fight and answer the specifications.

Version 1.0 presents some limitations which could be improved in the future :

- Create a Fight from the UI
- Search field to filter / find a character
- Improvement of the UI when many characters are created.
- Temporary characters are currently not different from any other character, so their usage is not presenting much interest now.
- Condition-system was not developed. It would be a nice addition to the current platform.

### Technologies

#### Orbit CSS

[Orbit CSS](https://orbitcss.com/) was selected as a CSS Framework for this project, mostly as an opportunity to test a light-weight modern framework. However, this experiment showed that it would probably not be the best call - as many simple custom-classes had to be created.

#### Iconoir

[Iconoir](https://iconoir.com/) was selected as the Icon library for the application.

#### Formatter / Linter

Unfortunately, a linter and formatter could not be easily included into V1.0. It will be investigated in the future.

#### Translations

The application is currently only available in French. However, all strings used are placed in the I18n structure.
