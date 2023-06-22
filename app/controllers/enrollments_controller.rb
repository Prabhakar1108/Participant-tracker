class EnrollmentsController < ApplicationController
  before_action :set_registry
  before_action :set_coordinator, only: [:new, :create]

  def new
    @enrollment = Enrollment.new
    @participants = Participant.all
  end

  def create
    @enrollment = @coordinator.enrollments.build(enrollment_params)
    if @enrollment.save
      redirect_to registry_enrollments_path(@registry), notice: "Participant was successfully enrolled."
    else
      @participants = Participant.all
      render :new
    end
  end

  def index
    @enrollments = @registry.enrollments.includes(:coordinator, :participant).order(:created_at)
    @enrollments_by_coordinator = @enrollments.group_by(&:coordinator)
  end

  private

  def set_registry
    @registry = Registry.find(params[:registry_id])
  end

  def set_coordinator
    @coordinator = Coordinator.find(params[:coordinator_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:participant_id, :date_of_enrollment, :method_of_contact, :remarks)
  end
end
