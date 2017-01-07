class StaticPagesController < ApplicationController
  def home
    @lotteries = Lottery.all
    @lotteries = @lotteries.sort { |a,b| b.id <=> a.id }
    @lottery_size = @lotteries.size + 1
  end

  def help
  end

  def contact
  end
  
  def new
  end
  
  def create
    if Rake::Task['fetch_lottery'].invoke
      flash[:success] = "Data is successfully fetched"
      
    else
      flash[:error] = "Data is not fetched"
    end
    
    redirect_to home_path
  end
  
  
end
