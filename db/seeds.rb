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

    distillery1.save()
    distillery2.save()

bottle1 = Bottle.new({
  "name" => "Dalmore Cigar Malt",
  "type" => "Single Malt",
  "distillery_id" => distillery1.id

  })

  bottle2 = Bottle.new({
    "name" => "Jura 1984 Vintage",
    "type" => "Single Malt",
    "distillery_id" => distillery2.id

    })

  bottle2.save()
  bottle1.save()

  binding.pry
  nil
