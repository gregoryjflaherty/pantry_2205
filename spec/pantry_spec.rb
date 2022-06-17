require './lib/pantry'
require './lib/ingredient'

RSpec.describe Pantry do 
    
    context 'iteration 1' do 
        before(:each) do 
            @pantry = Pantry.new
            @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
            @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
        end

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

    context 'iteration 3' do 
        before(:each) do 
            @pantry = Pantry.new
            @cookbook = CookBook.new

            @recipe1 = Recipe.new("Mac and Cheese")
            @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
            @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
            @recipe1.add_ingredient(@ingredient1, 2)
            @recipe1.add_ingredient(@ingredient2, 8)
            
            @recipe2 = Recipe.new("Cheese Burger")
            @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
            @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
            @recipe2.add_ingredient(@ingredient1, 2)
            @recipe2.add_ingredient(@ingredient3, 4)
            @recipe2.add_ingredient(@ingredient4, 1)

            @cookbook.add_recipe(@recipe1)
            @cookbook.add_recipe(@recipe2)

            @pantry.restock(@ingredient1, 5)
            @pantry.restock(@ingredient1, 10)
        end 
        
        it 'checks if there is enough ingredients - v1' do 

            expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
        end 

        it 'checks if there is enough ingredients - v2' do 
            @pantry.restock(@ingredient2, 7)
            expect(@pantry.enough_ingredients_for?(@recipe1)).to be false
        end 
        
        it 'checks if there is enough ingredients - v3' do 
            @pantry.restock(@ingredient2, 7)
            @pantry.restock(@ingredient2, 1)

            expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
        end 
    end 
end 