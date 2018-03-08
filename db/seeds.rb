require_relative('../models/bottle.rb')
require_relative('../models/distillery.rb')
require ('pry')

# Bottle.delete_all()
# Distillery.delete_all()



  distillery1 = Distillery.new({
   "name" => "Girvan Distillery",
   "region" => "Lowland"
  })


  distillery2 = Distillery.new({
    "name" => "Ardmore distillery",
    "region" => "Highland"
    })
  distillery3 = Distillery.new({
    "name" => "The Dalmore Distillery",
    "region" => "Highland"
    })
  distillery4 = Distillery.new({
    "name" => "Strathisla distillery",
    "region" => "Highland"
    })

    distillery1.save()
    distillery2.save()
    distillery3.save()
    distillery4.save()

  bottle1 = Bottle.new({
   "name" => "AILSA BAY",
   "type" => "Single Malt",
   "quantity" => 50,
   "distillery_id" => distillery1.id,
   "buy_price" => 52,
   "sell_price" => 60
  })

  bottle2 = Bottle.new({
    "name" => "ARDMORE 20 YEAR OLD 1996",
    "type" => "Single Malt",
    "quantity" => 55,
    "distillery_id" => distillery2.id,
    "buy_price" => 45,
    "sell_price" => 65
    })

  bottle3 = Bottle.new({
    "name" => "DALMORE CIGAR MALT",
    "type" => "Single Malt",
    "quantity" => 15,
    "distillery_id" => distillery3.id,
    "buy_price" => 63,
    "sell_price" => 85
    })
  bottle4 = Bottle.new({
    "name" => "CHIVAS REGAL 12 YEAR OLD",
    "type" => "Blended",
    "quantity" => 30,
    "distillery_id" => distillery4.id,
    "buy_price" => 21,
    "sell_price" => 34
    })

  bottle1.save()
  bottle2.save()
  bottle3.save()
  bottle4.save()

  binding.pry
  nil
