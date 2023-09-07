class NotesController < ApplicationController
  before_action :require_login
  include ApplicationHelper

  def index
    @notes = Note.where(user_id: session[:user_id])
    #puts "User ID: #{session[:user_id]}"
    #puts "Current User ID: #{@current_user}"
    #puts "Number of Notes: #{@notes.count}"
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:user_id, :title, :text)
  end

  private def require_login
    unless logged_in()
      flash[:danger] = 'Sie waren nicht angemeldet!'
      redirect_to login_path
    end
  end
end