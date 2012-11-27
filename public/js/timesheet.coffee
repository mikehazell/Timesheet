
window.TimeEntry = class TimeEntry
  constructor: (rawDescription = "") ->
    [all, @time, @title, @description] = @parseRawDescription rawDescription
    @time = new Time @time

  parseRawDescription: (rawDescription) ->
    #pattern = /(^.*h )(.*-)/ - getting there
    pattern = ///
      ([^$]+)       # Title
      (\$\d+\.\d+)  # Price
    ///
    result = rawDescription.match pattern
    r.trim() for r in result

  toJSON: -> { @title, time: @time.toString() }

window.Time = class Time
  constructor: (rawString='') ->
    @minutes = @parseMinutes rawString

  parseMinutes: (rawString) ->
    [hours, minutes] = (rawString.match /(\d+)/g) ? [0,0]
    +minutes + 60*hours

  toString: ->
    c = @cents % 100;
    c = '0'+c if(c<10)
    "$#{Math.floor(@cents/100)}.#{c}"

window.Meal = class Meal
  constructor: ->
    @dishes = []

  add: (dishes...) -> @dishes.push dishes...

  totalPrice: ->
    total = new Money
    total.cents = total.cents + dish.price.cents for dish in @dishes
    total

  toJSON: ->
    price: @totalPrice().toString()
    dishes: dish.toJSON() for dish in @dishes
    
