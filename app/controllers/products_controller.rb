class ProductsController < ApplicationController
    def index
        if params[:q].present? || params[:category].present? || params[:price_range].present?
          query_params = {
            bool: {
              must: [],
              should: []
            }
          }
      
          query_params[:bool][:should] << { match: { title: { query: params[:q], fuzziness: "AUTO" } } } if params[:q].present?
          query_params[:bool][:should] << { match: { description: { query: params[:q], fuzziness: "AUTO" } } } if params[:q].present?
          query_params[:bool][:must] << { term: { category: params[:category] } } if (params[:category].present? and params[:category] != "Select Category")
          query_params[:bool][:must] << { range: { price: { gte: params[:min_price], lte: params[:max_price] } } } if params[:min_price].present? && params[:max_price].present?
      
          @products = Product.search(query: query_params)
      
        else
          @products = Product.all
        end
      end

    def add_product
        @new_product = Product.new(product_params)
    
        respond_to do |format|
        if @new_product.save
            format.html { redirect_to products_path, notice: 'Product was successfully added.' }
            format.json { render :show, status: :created, location: @new_product }
        else
            format.html { render :index }
            format.json { render json: @new_product.errors, status: :unprocessable_entity }
        end
        end
    end
    
    private

    def product_params
        params.permit(:title, :description, :price, :category, :image)
    end       

end
