class CoordinatorsController < ApplicationController
  def new
    @registry = Registry.find(params[:registry_id])
    @coordinator = Coordinator.new
  end

  def create
    @registry = Registry.find(params[:registry_id])
    @coordinator = @registry.coordinators.build(coordinator_params)
    
    if @coordinator.save(validate: false)
      redirect_to @registry, notice: 'Coordinator created successfully.'
    else
      render :new
    end
  end

  private

  def coordinator_params
    params.require(:coordinator).permit(:name, :email, :phone_number, registry_ids: [])
  end
end
