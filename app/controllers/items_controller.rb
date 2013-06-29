class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @item.images.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user = current_user # If current_user == nil, then this won't validate (not logged in)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, :notice => 'Item was successfully created.' }
        format.json { render :json => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    # Add code here to check if the user is an owner, moderator, or admin

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, :notice => 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    
     @item = Item.find(params[:id])

    # Determine if the user is admin, moderator, or the owner of the item
    user = current_user
    if (not user == @item.user) && (  (not user.check_role('admin')) ||  (not user.check_role('moderators')) )
      respond_to do |format|
        perm = user.check_role('moderators')
        logger.debug("perm: ")
        logger.debug(perm)
        format.html { redirect_to @item, :notice => 'You do not have the permissions to delete this item.' }
      end
      return
    end

    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
