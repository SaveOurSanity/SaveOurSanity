class DeploysController < ApplicationController
  before_action :set_deploy, only: [:show, :edit, :update, :destroy]

  # POST /deploys
  # POST /deploys.json
  def create
    @deploy = Deploy.new(deploy_params)

    respond_to do |format|
      if @deploy.save
        format.html { redirect_to @deploy.environment, notice: 'Deploy was successfully created.' }
        format.json { render :show, status: :created, location: @deploy }
      else
        format.html { redirect_to @deploy.environment, notice: @deploy.errors.full_messages.first }
        format.json { render json: @deploy.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deploy
      @deploy = Deploy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deploy_params
      params.require(:deploy).permit([
        :author,
        :ruby_branch_name,
        :php_branch_name,
        :environment_id
      ])
    end
end
