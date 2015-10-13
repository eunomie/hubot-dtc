# Description:
#   Display quote from "Dans Ton Chat <http://danstonchat.com>".
#
# Dependencies:
#   "cheerio": "0.7.0"
#   "he": "0.4.1"
#
# Configuration:
#   None
#
# Commands:
#   hubot dernier {dtc|dans ton chat}- Returns last quote
#   hubot {dtc|dans ton chat} - Returns random quote
#
# Author:
#   Eunomie

cheerio = require('cheerio')
he = require('he')

module.exports = (robot)->
  robot.respond /dernier (dtc|dans ton chat)/i, (message)->
    send_quote message, 'http://danstonchat.com', (text)->
      message.send text
  robot.respond /^(dtc|dans ton chat)/i, (message)->
    send_quote message, 'http://danstonchat.com/random.htlm', (text)->
      message.send text

send_quote = (message, location, response_handler)->
  url = location

  message.http(url).get() (error, response, body)->
    return response_handler "Sorry, something went wrong" if error

    if response.statusCode == 302 || response.statusCode == 301
      location = response.headers['location']
      return send_quote(message, location, response_handler)

    txt = get_quote(body, "p.item-content")

    response_handler txt

get_quote = (body, selector)->
  $ = cheerio.load(body)
  he.decode $(selector).first().text()
