class ArchivesController < ApplicationController
  def index
    @archives = Archive.order(displayed_on: :desc).limit(7)
  end
end
