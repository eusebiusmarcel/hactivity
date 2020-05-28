class Api::ActivitiesController < Api::ApiController
  before_action :set_activity, except: %i[index create]
  def index
    activities = current_user.activities
                             .start_end_between(params[:from_date], params[:to_date])
                             .ordered_by_start_at
    render json: { object: activities }, status: 200
  end

  def create
    activity = current_user.activities.new(activity_params)
    activity.save!
    render json: { status: 'OK', message: 'Activity created!'}, status: 201
  end

  def show
    render json: { object: @activity }, status: 200
  end

  def update
    @activity.update!(activity_params)
    render json: { status: 'OK', message: 'Activity updated!'}, status: 200
  end

  def destroy
    @activity.destroy!
    head 204
  end

  private

  def activity_params
    params.permit(:title, :description, :start_at, :end_at, :tag_list, :color)
  end

  def set_activity
    @activity = current_user.activities.find(params[:id])
  end
end
