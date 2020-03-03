class BooksController < ApplicationController

before_action :authenticate_user!
before_action :current_user, only: [:edit,:update, :destroy]

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	  if @book.save
  	  	redirect_to @book, notice: "Book was successfully created."
  	  else
        @user = current_user
        session[:error] = @book.errors.full_messages
  	  	render template: "users/show"
  	  end
  end

  def edit
      @book = Book.find(params[:id])
      if @book.user != current_user
        redirect_to books_path
      end
  end

  def update
    @book = Book.find(params[:id])
    if @book.user == current_user
      if @book.update(book_params)
       redirect_to book_path, notice: "You have updated book saccessfully."
      else
       render :edit
      end
    else redirect_to books_path
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path,notice: "Book was successfully destroyed."
  end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
