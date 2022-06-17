require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do 
    before(:each) do 
        @pantry = Pantry.new
        @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
        @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    end
    
    context 'iteration 1' do 
        it 'exists' do 
            expect(@pantry).to be_an_instance_of Pantry
        end

        it 'has stock' do 
            expect(@pantry.stock).to eq({}) 
        end

        it 'can check it ingredient is in stock' do 
            expect(@pantry.stock_check(@ingredient1)).to eq(0) 
        end

        it 'can restock ingredients - v1' do 
            @pantry.restock(@ingredient1, 5)
            @pantry.restock(@ingredient1, 10)
            expect(@pantry.stock_check(@ingredient1)).to eq(15)
        end

        it 'can restock ingredients - v2' do 
            @pantry.restock(@ingredient2, 7)
            expect(@pantry.stock_check(@ingredient2)).to eq(7)
        end
    end 
end 