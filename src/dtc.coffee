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
#   hubot dernier dans ton chat- Returns last quote
#   hubot dtc - Returns random quote
#
# Author:
#   Eunomie

cheerio = require('cheerio')
he = require('he')

module.exports = (robot)->
  robot.respond /dernier dans ton chat/i, (message)->
    send_quote message, 'http://danstonchat.com', (text)->
      message.send text
  robot.respond /dtc/i, (message)->
    send_quote message, 'http://danstonchat.com/random.html', (text)->
      message.send text

send_quote = (message, location, response_handler)->
  url = location

  message.http(url).get() (error, response, body)->
    return response_handler "Sorry, something went wrong" if error

    if response.statusCode == 302 || response.statusCode == 301
      location = response.headers['location']
      return send_quote(message, location, response_handler)

    txt = get_quote(body, "p.item-content a")

    response_handler txt

get_quote = (body, selector)->
  $ = cheerio.load(body)
  res = []
  $(selector).first().contents().map((i, el) ->
    $(this).text()
  ).filter((i, txt) ->
    txt != ''
  ).map((i, txt) ->
    res.push txt
  )
  he.decode res.join '\n'
