class CategoriesController < ApplicationController
    # before_action :authenticate
    before_action :set_category, except: [:index, :create]

    rescue_from Exception do |e|
      render json: { error: e }, status: :not_found
    end
  
    def index
      render json: Category.order(:name)
    end
  
    def show
      render json: @category
    end
  
    def create
      render json: Category.create(category_params), status: :created
    end
  
    def update
      if @category.update(category_params)
          render json: @category
      else
          render json: { error: "Failed to update category" }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @category.destroy
          render status: :no_content
      else
          render json: { error: "Failed to destroy category" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.permit(:name)
    end
end
