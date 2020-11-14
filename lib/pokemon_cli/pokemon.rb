class Pokemon 
    attr_accessor :name, :url, :type
    @@all = []
    def initialize(name, url)
        @name = name
        @url = url
        @@all << self
    end

  def save
        @@all << self
    end
    def self.all
        @@all
    end
    def self.find_by_name(name)
        self.all.find do |pokemon|
            pokemon.name == name
        end
    end
    def update_pokemon
        info = API.update_pokemon(self.url)
        @type = info["type"]
    end
end
