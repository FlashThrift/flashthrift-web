#
# FtController is the boring name for the controller that does most of the basic 
# stuff in the app, like showing the items, and rotating out to a new item
#
class FtController < ApplicationController

  def index

    @item = Item.new
    @item.name = 'Test item for demo'
    @item.description = 'lorem ipsum and all that.'
    @item.price = "$20"


  end


end
