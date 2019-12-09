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

    if @bid.valid?
      @bid.save
      redirect_to("/bids", { :notice => "Bid created successfully." })
    else
      redirect_to("/bids", { :notice => "Bid failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @bid = Bid.where({ :id => the_id }).at(0)

    @bid.bidder_id = params.fetch("bidder_id_from_query")
    @bid.book_id = params.fetch("book_id_from_query")
    @bid.bidding_amount = params.fetch("bidding_amount_from_query")
    @bid.book_owner_name = params.fetch("book_owner_name_from_query")
    @bid.book_title = params.fetch("book_title_from_query")

    if @bid.valid?
      @bid.save
      redirect_to("/bids/#{@bid.id}", { :notice => "Bid updated successfully."} )
    else
      redirect_to("/bids/#{@bid.id}", { :alert => "Bid failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @bid = Bid.where({ :id => the_id }).at(0)

    @bid.destroy

    redirect_to("/bids", { :notice => "Bid deleted successfully."} )
  end
end
