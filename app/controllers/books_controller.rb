class BooksController < ApplicationController

  def requested_books

      render({ :template => "books/requested_books.html.erb"})
  
  end

  def available_books

    render({ :template => "books/available_books.html.erb"})

  end

  def index
    @books = Book.all.order({ :created_at => :desc })

    render({ :template => "books/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @book = Book.where({:id => the_id }).at(0)

    render({ :template => "books/show.html.erb" })
  end

  def create
    @book = Book.new
    @book.owner_id = @current_user.id 
    @book.title = params.fetch("title_from_query")
    @book.price = params.fetch("price_from_query")
    @book.image = params.fetch("image_from_query")
    @book.availability = params.fetch("availability_from_query", false)
    @book.author = params.fetch("author_from_query")

    if @book.valid?
      @book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :notice => "Book failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @book = Book.where({ :id => the_id }).at(0)

    @book.owner_id = @current_user.id 
    @book.title = params.fetch("title_from_query")
    @book.price = params.fetch("price_from_query")
    @book.image = params.fetch("image_from_query")
    @book.availability = params.fetch("availability_from_query", false)
    @book.author = params.fetch("author_from_query")

    if @book.valid?
      @book.save
      redirect_to("/books/#{@book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{@book.id}", { :alert => "Book failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @book = Book.where({ :id => the_id }).at(0)

    @book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end


end
