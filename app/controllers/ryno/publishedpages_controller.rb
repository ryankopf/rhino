require_dependency "ryno/application_controller"

module Ryno
  class PublishedpagesController < ApplicationController
    before_action :set_publishedpage, only: [:show]

    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_publishedpage
        @publishedpage = Publishedpage.find_by(url: params[:id])
      end
  end
end
