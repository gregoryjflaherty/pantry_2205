class Ingredient
    attr_reader :name, :unit, :calories

    def initialize(info_hash)
        @name = info_hash[:name]
        @unit = info_hash[:unit]
        @calories = info_hash[:calories]
    end 
end 