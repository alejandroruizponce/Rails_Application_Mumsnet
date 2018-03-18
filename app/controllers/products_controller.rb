class ProductsController < ApplicationController
    
    #GET /products
    def index
       @products = Product.all
    end
    
    #GET /products/:id
    def show
        @product = Product.find(params[:id])
    end
    
    def edit
        @product = Product.find(params[:id])
    end
    
    #GET /products/new
    def new
        @product = Product.new
        @categories = Category.all
    end
    
    #POST /products
    def create
        @product = Product.new(title: params[:product][:title], body: params[:product][:body], creation_date: Date.today)
        @product.categories = params[:categories]
        if @product.save
            redirect_to @product
        else
            render :new
        end
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to @product
        else
            render :edit
        end
    end
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end
    
    private
    
    def product_params
        params.require(:product).permit.all!
    end
    
end