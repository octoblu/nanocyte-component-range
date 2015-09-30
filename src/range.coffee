ReturnValue = require 'nanocyte-component-return-value'

class Range extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Range
