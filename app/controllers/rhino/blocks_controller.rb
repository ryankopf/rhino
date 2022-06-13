require_dependency "rhino/application_controller"

module Rhino
  class BlocksController < ApplicationController
    before_action :must_be_admin
    before_action :set_block, only: [:show,:update]

    # GET /blocks
    def index
      @blocks = Block.all
    end

    # GET /blocks/1
    def show
    end

    def new
      @block = Block.create(page_id: params[:page_id])
      redirect_to @block
    end

    def update
      if @block.update(block_params)
        redirect_to @block
      else
        render :edit
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_block
        @block = Block.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def block_params
        params.require(:block).permit(:ip, :provider, :controllername, :actionname)
      end
  end
end
