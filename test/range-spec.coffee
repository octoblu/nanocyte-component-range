ReturnValue = require 'nanocyte-component-return-value'
Range = require '../src/range'

describe 'Range', ->
  beforeEach ->
    @sut = new Range

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with a value inside the range', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: 2
            min: 1
            max: 4

        expect(@sut.onEnvelope envelope).to.deep.equal 'pyramid-scheme'

    describe 'when called with a value equal to the min', ->
      it 'should return the message', ->
        envelope =
          message: 'fission'
          config:
            value: 1
            min: 1
            max: 4

        expect(@sut.onEnvelope envelope).to.deep.equal 'fission'

    describe 'when called with a value less than the min', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: 0
            min: 1
            max: 4

        expect(@sut.onEnvelope envelope).to.not.exist

    describe 'when called with a value greater than the max', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: 5
            min: 1
            max: 4

        expect(@sut.onEnvelope envelope).to.not.exist

    describe 'when called with a value equal to the max', ->
      it 'should return the message', ->
        envelope =
          message: 'fission'
          config:
            value: 4
            min: 1
            max: 4

        expect(@sut.onEnvelope envelope).to.deep.equal 'fission'

    describe 'when called with a date value inside the range', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: '1997-08-29'
            min: 'Aug 20, 1997'
            max: 'Aug 30, 1997'

        expect(@sut.onEnvelope envelope).to.deep.equal 'pyramid-scheme'

    describe 'when called with a number string inside the range', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: '23'
            min: 20
            max: 25

        expect(@sut.onEnvelope envelope).to.deep.equal 'pyramid-scheme'

    describe 'when the value is null', ->
      it 'should return the message', ->
        envelope =
          message: 'pyramid-scheme'
          config:
            value: null
            min: 0
            max: 25

        expect(@sut.onEnvelope envelope).to.be.undefined
