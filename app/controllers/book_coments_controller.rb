class BookComentsController < ApplicationController
  def create
   book=Book.find(params[:book_id])
   coment=BookComent.new(book_coment_params)
   coment.user_id=current_user.id
   coment.book_id=book.id
   coment.save
   redirect_to book_path(book)
  end

  def destroy
      BookComent.find_by(id:params[:id],book_id:params[:book_id]).destroy
      redirect_to book_path(params[:book_id])
  end

private
def book_coment_params
  params.require(:book_coment).permit(:coment)
end


end
