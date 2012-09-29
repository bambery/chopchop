class BlackmailController < ApplicationController

  def new
    @hustler = User.find(params[:id]) if params[:id]
  end
end
