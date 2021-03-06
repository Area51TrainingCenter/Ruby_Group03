class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def search

    Product.where(name: params[:nombre]).
            where(address: params[:direccion]).
            where(option: params[:opcion])
    
    # select * from products where name = XXX and address = XXXX and option = YYY



    filters = "%#{params[:terms]}%"
    @books = Book.where("title like ?", filters)
    
    product = Product.first
    product.update_stock

    render :index  # render o redirect


  end

  # GET /books
  # GET /books.json
  def index
    logger.info "test"
    cookies[:lalala] = true
    @books = Book.all
  end


  def results
    @products = Product.where(name: params[:1234])
    respond_to do |format|
      format.json { }
    end
  end

  def xxxx
    
  end

  #AJAX = Asynchronous Javascript and XML/JSON
  # HTTPRequest 
  # XMLHTTPRequest -> Hotmail


  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def publish
    if params[:id]
      book = Book.find(param[:id])
      book.publish!
    else
      books = Book.find(params[:ids])
      books.each do |book|
        book.publish!
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
