class HomeController < ApplicationController
    before_filter :authenticate_user!
    before_filter :is_admin?, :except =>  [:index, :show_sub_moods]
  
  def index
    @moods = Mood.order 'name'
  end
  
  def show_sub_moods
    @sub_moods = SubMood.dep_sub_mood(params[:id])
    #render :partial => 'sub_moods', :layout => false, :locals => { :sub_moods => @sub_moods }
    respond_to do |format|
      format.js
    end
  end
    
end
