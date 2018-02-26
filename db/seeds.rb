require_relative('../models/bottle')
require_relative('../models/distillery')
require ('pry')

Bottle.delete_all()
Distillery.delete_all()

  distillery1 = Distillery.new({
   "name" => "Dalmore"
  })

  distillery2 = Distillery.new({
    "name" => "Jura"
    })
  distillery3 = Distillery.new({
    "name" => "Glenfiddich"
    })

    distillery1.save()
    distillery2.save()
    distillery3.save()

  bottle1 = Bottle.new({
   "name" => "Dalmore Cigar Malt",
   "type" => "Single Malt",
   "quantity" => 5,
   "distillery_id" => distillery1.id
  })

  bottle2 = Bottle.new({
    "name" => "Jura 1984 Vintage",
    "type" => "Single Malt",
    "quantity" => 5,
    "distillery_id" => distillery2.id
    })

  bottle3 = Bottle.new({
    "name" => "Dalmore 12 year old",
    "type" => "Single Malt",
    "quantity" => 5,
    "distillery_id" => distillery1.id
    })
  bottle4 = Bottle.new({
    "name" => "Jura One and All",
    "type" => "Single Malt",
    "quantity" => 5,
    "distillery_id" => distillery2.id
    })

  bottle5 = Bottle.new({
    "name" => "Glenfiddich Project XX",
    "type" => "Single Malt",
    "quantity" => 5,
    "distillery_id" => distillery3.id
      })

  bottle1.save()
  bottle2.save()
  bottle3.save()
  bottle4.save()
  bottle5.save()

  binding.pry
  nil
