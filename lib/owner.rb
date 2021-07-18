class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.filter { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.filter { |dog| dog.owner == self }
  end

  def pets
    self.cats + self.dogs
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def self.all
    @@all
  end
  
  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end
end