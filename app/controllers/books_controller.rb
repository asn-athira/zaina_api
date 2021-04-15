class BooksController < ApplicationController

  #including concern for data table(header)
	def index
    @books = Book.all    
    if @books
      render json: @books, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
	end
	
	def books
    @books=Book.all
	end

  def new
    new_book
   	@page_title = "Books | New Book"   
	end
	
	def show
		@book=Book.find(params[:id])
    if @book
      render json: @book, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
	end
	
	def edit
		@book=Book.find(params[:id])
    if @book
      render json: @book, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
    
	end
  
  def create
	 	@book=Book.new(permitted_params)
    if @book.valid?
      @book.save
      render json: {  book: @book.name , alert: "Book Created Sucessfully"}, status: :created
	 	else
      render json: { errors: @book.errors.full_messages },
            status: :unprocessable_entity
	 	end
	end

	def update
    @book=Book.find(params[:id])
	  @book.update(permitted_params)
	  if @book.save
     render json: { alert: "Book Updated Sucessfully"}, status: :ok
    else
      render json: { errors: @book.errors.full_messages },
            status: :unprocessable_entity
		end
	end
	
  def destroy
		@book=Book.find(params[:id])
		@book.destroy
    render json: {  alert: "Book Deleted Sucessfully"}, status: :ok
  end
    
  # --------------
  # Fetch Methods
  # --------------
  def user_books
    @books=Book.find(params[:username])
    if @books
      render json: @books, status: :ok
    else
      render json: { error: 'Sorry ! No books.' }, status: :not_found
    end
  end

	private

	def permitted_params
    params.permit(:name, :code, :author, :description)
	end

  def new_book
    @book = Book.new
  end

  def existing_book
    @book = Book.find_by_id(params[:id])
  end

  def get_collection
    @relation = Book.where("")

    apply_filters

    @order_by = "created_at DESC" unless @order_by
    @books = @relation.order(@order_by).all #page(@current_page).per(@per_page)
  end
  
  def apply_filters
    @query = params[:q]
    @relation = @relation.search(@query) if @query && !@query.blank?
    #@relation = @relation.search_only_name(params[:filters].try(:[], :name))
    
  end

  def initialise_urls
    @wf_refresh_url = root_path
  end


end