class BidsController < ApplicationController
  def index
    @bids = Bid.all.order({ :created_at => :desc })

    render({ :template => "bids/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @bid = Bid.where({:id => the_id }).at(0)

    render({ :template => "bids/show.html.erb" })
  end

  def create
    @bid = Bid.new
    @bid.bidder_id = @current_user.id
    @bid.book_id = @current_user.id
    @bid.bidding_amount = params.fetch("bidding_amount_from_query")
    @bid.book_owner_name = params.fetch("book_owner_name_from_query")
    @bid.book_title = params.fetch("book_title_from_query")

    if @bid.valid? && Book.where({:title => @bid.book_title}).at(0).price.to_f <= @bid.bidding_amount.to_f
      @bid.save
      redirect_to("/bids", { :notice => "Bid created successfully." })
    else
      redirect_to("/bids", { :alert => "Bid failed to create successfully. Make sure bidding amount is as great as current price." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @bid = Bid.where({ :id => the_id }).at(0)

    @bid.bidder_id = @current_user.id
    @bid.book_id = params.fetch("book_id_from_query")
    @bid.bidding_amount = params.fetch("bidding_amount_from_query")
    @bid.book_owner_name = params.fetch("book_owner_name_from_query")
    @bid.book_title = params.fetch("book_title_from_query")

    if @bid.valid? && Book.where({:title => @bid.book_title}).at(0).price.to_f <= @bid.bidding_amount.to_f
      @bid.save
      redirect_to("/bids/#{@bid.id}", { :notice => "Bid updated successfully."} )
    else
      redirect_to("/bids/#{@bid.id}", { :alert => "Bid failed to update successfully. Amount might be less than original price" })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @bid = Bid.where({ :id => the_id }).at(0)

    @bid.destroy

    redirect_to("/bids", { :notice => "Bid deleted successfully."} )
  end
end
