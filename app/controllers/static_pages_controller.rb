class StaticPagesController < ApplicationController
  def home
    @lottery_size = Lottery.all.size + 1
    @lotteries = Lottery.paginate(:page => params[:page], :per_page => 20).order('id DESC')
    
    
    @lotteries_number = LotteryNumber.all.order('counter DESC')
    
    
  end

  def help
  end

  def contact
  end
  
  def new
  end
  
  def create
    fetch_method = Fetch_Data.new()
    if params[:fetch_data]
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
    elsif params[:get_statistic]
      fetch_method.get_statistic
    end
    redirect_to home_path
  end
  
  
end
