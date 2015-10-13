chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'dtc', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/dtc')(@robot)

  it 'registers respond listeners', ->
    expect(@robot.respond.args[0][0].toString()).to.equal("/dernier (dtc|dans ton chat)/i")
    expect(@robot.respond.args[0][0].toString()).to.equal("/^ *(dtc|dans ton chat)/i")
