<h1> CloudWalk Software Engineer test</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.6&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=5.2.4.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTS&message=%3E100&color=GREEN&style=for-the-badge"/>
</p>

### Topics

:small_blue_diamond: [Project descriptions](#project-descriptions)
:small_blue_diamond: [Functionalities](#functionalities)
:small_blue_diamond: [Prerequisites](#prerequisites)
:small_blue_diamond: [How to run the application](#how-to-run-the-application-arrow_forward)
:small_blue_diamond: [How to run the tests](#how-to-run-the-tests)
:small_blue_diamond: [Endpoints](#endpoints)
:small_blue_diamond: [JSON](#json-floppy_disk)
:small_blue_diamond: [Gems added](#gems-added-gem)

## Project descriptions 

<p align="justify">
This service aims to receive a log file from Quake via API containing matchs statistics, parsing the file and return all data in JSON organizedly
</p>

## Functionalities

:heavy_check_mark: Receive Quake log file via API
:heavy_check_mark: Return game statistics in JSON

## Prerequisites

:warning: [Docker](https://www.docker.com/get-started)

## How to run the application :arrow_forward:

Clone the project: 
```
$ git clone https://github.com/thiagodsalles/cloudwalk.git
```
In the root directory, build the docker-compose
```
$ docker-compose build
```
In the root directory, run docker-compose
```
$ docker-compose up
```  

## How to run the tests

In the root directory, run Rspec
```
$ bundle exec rspec 
```

## Endpoints

    endpoint: /file_upload
    method: POST
    body: file '.log file'


## JSON :floppy_disk:

```
{
	"game_6": {
		"total_kills": 29,
		"players": [
			"Fasano Again",
			"Oootsimo",
			"Isgalamido",
			"Zeh",
			"Dono da Bola",
			"UnnamedPlayer",
			"Maluquinho",
			"Assasinu Credi",
			"Mal"
		],
		"kills": {
			"Fasano Again": 0,
			"Oootsimo": 8,
			"Isgalamido": 3,
			"Zeh": 7,
			"Dono da Bola": 2,
			"UnnamedPlayer": 0,
			"Maluquinho": 0,
			"Assasinu Credi": 1,
			"Mal": 0
		},
		"kills_by_means": {
			"MOD_ROCKET": 5,
			"MOD_RAILGUN": 2,
			"MOD_SHOTGUN": 4,
			"MOD_ROCKET_SPLASH": 13,
			"MOD_TRIGGER_HURT": 3,
			"MOD_FALLING": 1,
			"MOD_MACHINEGUN": 1
		}
	}
}
```

## Gems added :gem:

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [rubocop-rails](https://github.com/rubocop-hq/rubocop-rails)
- [http](https://github.com/httprb/http)
## 
2020 - Software Engineer test. CloudWalk.


