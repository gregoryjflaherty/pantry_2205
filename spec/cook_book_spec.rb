require './lib/cook_book'
require './lib/recipe'

RSpec.describe CookBook do 
    context 'iteration 1' do 
        before(:each) do 
            @recipe1 = Recipe.new("Mac and Cheese")
            @recipe2 = Recipe.new("Cheese Burger") 
            @cookbook = CookBook.new
        end 

        it 'exists' do 
            expect(@cookbook).to be_an_instance_of CookBook
        end 

        it 'adds cookbooks' do 
            @cookbook.add_recipe(@recipe1)
            @cookbook.add_recipe(@recipe2)

            expect(@cookbook.recipes.include?(@recipe1)).to be true 
            expect(@cookbook.recipes.include?(@recipe2)).to be true  
        end 
    end 

    context 'iteration 3' do 
        before(:each) do 
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
        end 

        it 'gives all ingredients' do 
            expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
        end 

        it "returns recipe with highest calories" do 
            expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
        end 
    end 
    context 'iteration 4' do 
        before(:each) do 
            @cookbook = CookBook.new

            @recipe1 = Recipe.new("Mac and Cheese")
            @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
            @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
            @recipe1.add_ingredient(@ingredient1, 2)
            @recipe1.add_ingredient(@ingredient2, 8)
            
            @recipe2 = Recipe.new("Burger")
            @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
            @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
            @recipe2.add_ingredient(@ingredient3, 4)
            @recipe2.add_ingredient(@ingredient4, 100)

            @cookbook.add_recipe(@recipe1)
            @cookbook.add_recipe(@recipe2)
        end 

        it 'gives detailed summary' do 
            expect(@cookbook.summary).to eq(
            [
                {:name=>"Mac and Cheese", 
                    :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, 
                                              {:ingredient=>"Cheese", :amount=>"2 C"}], 
                               :total_calories=>440}}, 
                {:name=>"Burger",
                    :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, 
                                              {:ingredient=>"Bun", :amount=>"100 g"}], 
                               :total_calories=>500}}
            ]
        )
        end 

        it "gives a date" do 
            @time_now = Time.now.strftime("%m-%d-%Y")
            allow(@cookbook.date).to receive(:now).and_return(@time_now)
        end 
    end 
end 