class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  before_action :verify_role!, only: :show

  def verify_role!
    redirect_to root_path if current_user.role == "B"
  end
  #before_action :authenticate_user

  # def authenticate_user
  #   redirect_to "/nologin" unless cookies[:current_user]
  # end

  def search
    if current_user && current_user.email
      # xxxx
    end
    filters = "%#{params[:terms]}%"
    @books = Book.where("title like ?", filters)
    render :index  # render o redirect
  end

  # GET /books
  # GET /books.json
  def index

    session[:safe] = true

    if cookies[:second_time].nil? 
      @message = "Bienvenido al sitio"
      cookies[:second_time] = Book.last.id
    end
    #cookies.delete(:second_time)

    logger.info cookies[:second_time]


    cookies.signed[:current_user] = 10

    cookies.permanent[:maternal_love] = true

    cookies.signed.permanent[:maternal_love] = true

    cookies[:remember_me] = {value: true, expires: 1.month.from_now}

    cookies[:remember_me] = {value: true, expires: 1.month.from_now, domain: ".dominio.com"}


    #  www.dominio.com   cookie: user: 10
    #  dominio.com       cookie: user: 11

    # cliente.dominio.com
    # cliente2.dominio.com



    @books = Book.all
  end

  #AJAX = Asynchronous Javascript and XML/JSON
  # HTTPRequest 
  # XMLHTTPRequest -> Hotmail

  def script_kiddie
    params[:url]
    response = HTTParty.get(params[:url], headers: {"User-Agent" => APPLICATION_NAME}, query: {status: text)
    @html = response.content
  end


  # GET /books/1
  # GET /books/1.json
  def show
    if session[:safe]
      logger.info "SEGURO!"
    end
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
