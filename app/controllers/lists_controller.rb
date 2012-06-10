class ListsController < ApplicationController
	before_filter :authenticate_user!
  def index
    @lists = current_user.list
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @list = List.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @list = current_user.list.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    respond_to do |format|
      if current_user.list.create!(params[:list])
        format.html { redirect_to(lists_path, :notice => 'List was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(@list, :notice => 'List was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

	def share_list
		@list = List.find(params[:list][:id])
		share_user = User.where(:email => params[:email]).first
		share_before = @list.share.where(:user_id=>share_user.id)
		respond_to do |format|
    	if share_before.empty? && (params[:email]!=current_user.email)
				share_user.share.create!(:list_id => @list.id, :who_shared => current_user.email)
      	format.html { redirect_to(lists_path, :notice => 'List was successfully shared.') }
    	else
      	format.html { redirect_to(lists_path, :notice => 'Shared was faild') }
    	end
		end
	end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
    end
  end
end
