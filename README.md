# Hubot Dans Ton Chat

A little script to get quotes from [Dans Ton Chat](http://danstonchat.com/).

[![Build Status](https://travis-ci.org/eunomie/hubot-dtc.png)](https://travis-ci.org/eunomie/hubot-dtc) [![NPM version](https://badge.fury.io/js/hubot-dtc.png)](http://badge.fury.io/js/hubot-dtc)

## Usage

Returns the last quote or a random one.

* `robot dernier dans ton chat`: returns the last one
* `robot dtc`: returns a random one


* [cheerio](https://github.com/MatthewMueller/cheerio)
* [he](https://github.com/mathiasbynens/he)

## Installation

Add the package `hubot-dtc` as a dependency in your Hubot `package.json` file.

    "dependencies": {
      "hubot-dtc": "0.1.3"
    }

Run the following command to make sure the module is installed.

    $ npm install hubot-dtc

To enable the script, add the `hubot-dtc` entry to the `external-scripts.json` file (you may need to create this file).

    ["hubot-dtc"]
