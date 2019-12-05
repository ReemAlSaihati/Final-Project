class BiddingsController < ApplicationController
  def index
    @biddings = Bidding.all.order({ :created_at => :desc })

    render({ :template => "biddings/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @bidding = Bidding.where({:id => the_id }).at(0)

    render({ :template => "biddings/show.html.erb" })
  end

  def create
    @bidding = Bidding.new
    @bidding.bidder_id = params.fetch("bidder_id_from_query")
    @bidding.book_id = params.fetch("book_id_from_query")
    @bidding.bidding_amount = params.fetch("bidding_amount_from_query")

    if @bidding.valid?
      @bidding.save
      redirect_to("/biddings", { :notice => "Bidding created successfully." })
    else
      redirect_to("/biddings", { :notice => "Bidding failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @bidding = Bidding.where({ :id => the_id }).at(0)

    @bidding.bidder_id = params.fetch("bidder_id_from_query")
    @bidding.book_id = params.fetch("book_id_from_query")
    @bidding.bidding_amount = params.fetch("bidding_amount_from_query")

    if @bidding.valid?
      @bidding.save
      redirect_to("/biddings/#{@bidding.id}", { :notice => "Bidding updated successfully."} )
    else
      redirect_to("/biddings/#{@bidding.id}", { :alert => "Bidding failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @bidding = Bidding.where({ :id => the_id }).at(0)

    @bidding.destroy

    redirect_to("/biddings", { :notice => "Bidding deleted successfully."} )
  end
end
