
describe "TimeEntry", ->

  beforeEach ->
     @entry = new TimeEntry '2.5h Coca Cola - changed color to green'

  it "extracts title", ->
    expect(@entry.title).toEqual 'Coca Cola'
  
  # it "extracts price", ->
  #   expect(@dish.time.minutes).toEqual 150