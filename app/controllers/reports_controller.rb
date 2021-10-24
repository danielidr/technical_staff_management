class ReportsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @report = Report.new
  end

  def show
  end

  def create
    puts "************#{params.inspect}"
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:tests_performed, :report_comments, :order_id)
  end
end
