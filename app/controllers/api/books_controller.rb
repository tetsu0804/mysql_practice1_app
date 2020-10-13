class Api::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    books = Book.all
    render json: {books: books}
  end

  def create
    book = Book.new(book_params)
    if book.save
      render json: { book: book}
    else
      redner json: "本作成失敗しました", status: :unauthorized
    end
  end

  private
    def book_params
      params.permit(:name)
    end
end
