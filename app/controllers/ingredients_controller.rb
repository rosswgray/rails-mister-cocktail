class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  private

  # Strong params
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
