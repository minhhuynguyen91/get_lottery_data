class StaticPagesController < ApplicationController
  def home
    @lottery_size = Lottery.all.size + 1
    
    @lotteries = Lottery.paginate(:page => params[:page], :per_page => 20).order('id DESC')
    #@lotteries = @lotteries.sort { |a,b| b.id <=> a.id }
    
    
    #@test_loterry = Lottery.paginate(:page => params[:page])
    
    #@users = User.paginate(page: params[:page])
  end

  def help
  end

  def contact
  end
  
  def new
  end
  
  def create
    fetch_method = Fetch_Data.new()
    
    if Lottery.all.size == 0
      if fetch_method.init_fetch_data()
        flash[:success] = "Data is successfully fetched"
      else
        flash[:error] = "Data is not fetched"
      end
    else
      
      if fetch_method.fetch_data()
        flash[:success] = "Data is successfully fetched"
      else
        flash[:error] = "Data is not fetched"
      end
    end
    
    redirect_to home_path
  end
  
  
end
