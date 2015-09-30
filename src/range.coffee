ReturnValue = require 'nanocyte-component-return-value'
sameType    = require 'same-type'

class Range extends ReturnValue
  onEnvelope: (envelope) =>
    {message,config} = envelope
    {value,min,max}  = config

    [typedValue, typedMin, typedMax] = sameType [value, min, max]

    return if typedValue > typedMax
    return if typedValue < typedMin
    return envelope.message

module.exports = Range
