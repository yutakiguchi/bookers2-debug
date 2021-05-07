class BookComentsController < ApplicationController
  def create
   @book=Book.find(params[:book_id])
   @coment=BookComent.new(book_coment_params)
   @coment.user_id=current_user.id
   @coment.book_id=@book.id
   @coment.save
  end

  def destroy
  @coment=BookComent.find(params[:id])
  @coment.destroy
  
    
  
  end

private
def book_coment_params
  params.require(:book_coment).permit(:coment)
end


end
