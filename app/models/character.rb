class Character
  attr_accessor :character_name, :location, :quote

  def initialize(hash)
    @id = hash['id']
    @character_name = hash['character_name']
    @location = hash['location']
    @quote = hash['quote']
  end

  def self.find(id)
    character_hash = Unirest.get("#{ENV['API_BASE_URL']}/characters/#{id}", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => ENV['API_KEY'] }).body
    @character = Character.new(character_hash)
  end

  def self.all
    characters = []
    characters_hash = Unirest.get("#{ENV['API_BASE_URL']}/characters", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => ENV['API_KEY']}).body
    characters_hash.each do |character_hash|
      characters << Character.new(character_hash)
    end 
    characters
  end

  def self.destroy
    @character = Unirest.delete("#{ENV['API_BASE_URL']}/characters/#{@id}", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => ENV['API_KEY']}).body
  end

end