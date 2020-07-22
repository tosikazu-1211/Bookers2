class BooksController < ApplicationController
	before_action :authenticate_user!
def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have creatad book successfully."
       redirect_to book_path(@book.id)
     else
      @books = Book.all
       render "index"
     end
end

def show
  @book = Book.new
  @book2 = Book.find(params[:id])
  @user = @book2.user
end

def index
  @book = Book.new
  @books = Book.all
end

def edit
  @book2 = Book.find(params[:id])
  @user = @book2.user
  if @user != current_user
      redirect_to books_path
    end
end


def update
  @book2 = Book.find(params[:id])
  if @book2.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book2.id)
else
  render "edit"
end

end

def destroy
  book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
end


 private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end