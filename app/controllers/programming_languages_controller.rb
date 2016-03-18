class ProgrammingLanguagesController < ApplicationController
  def new

  end

  def create
  end

  def index
    @programminglanguages = Programminglanguage.all
  end

  def destroy
  end

  def edit
  end

end
