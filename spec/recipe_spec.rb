require './lib/ingredient'
require './lib/recipe'

RSpec.describe Recipe do     
    context 'iteration 1' do 
        before(:each) do 
            @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
            @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
            @recipe1 = Recipe.new("Mac and Cheese")
        end
        
        it 'exists' do 
            expect(@recipe1).to be_an_instance_of Recipe
        end 
        
        it 'has a name' do 
            expect(@recipe1.name).to eq("Mac and Cheese")
        end 
        
        it 'has ingredients required' do 
            expect(@recipe1.ingredients_required).to eq({})
        end 
        
        it 'adds ingredients' do 
            @recipe1.add_ingredient(@ingredient1, 2)
            @recipe1.add_ingredient(@ingredient1, 4)
            @recipe1.add_ingredient(@ingredient2, 8)

            expect(@recipe1.ingredients.include?(@ingredient1)).to be true 
            expect(@recipe1.ingredients.include?(@ingredient2)).to be true 
        end 
    end 


    context 'iteration 3' do 
        before (:each) do 
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
            
            
        end 

        it 'can calculate total_calories - v1' do 
            expect(@recipe1.total_calories).to eq(440)
            
        end 
        
        it 'can calculate total_calories - v2' do 
            expect(@recipe2.total_calories).to eq(675)
        end 
    end 
end 