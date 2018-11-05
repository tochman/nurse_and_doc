# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    job = Job.create(job_params)
    if job.persisted?
      redirect_to root_path, notice: 'The job was successfully created'
    else
      errors = job.errors.full_messages
      render json: { message: errors }, status: 422
    end
  end

  def job_params
    params.require(:job).permit(:name)
  end
end
