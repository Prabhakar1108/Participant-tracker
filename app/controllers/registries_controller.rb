class RegistriesController < ApplicationController
  def index
    @registries = Registry.all
  end

  def show
  @registry = Registry.find(params[:id])
  @coordinators = @registry.coordinators
  @enrollments_by_coordinator = Enrollment.includes(:participant).where(registry_id: @registry.id).group_by(&:coordinator)
end


  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
    if @registry.save
      redirect_to @registry, notice: "Registry was successfully created."
    else
      render :new
    end
  end

  private

  def registry_params
    params.require(:registry).permit(:name, :location, :state, :status)
  end
end
