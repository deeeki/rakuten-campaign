class ArchivesController < ApplicationController
  def index
    @archives = Archive.includes(:campaigns).order(displayed_on: :desc).limit(7)
  end
end
