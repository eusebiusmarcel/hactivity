class Api::ActivitiesController < Api::ApiController
  def create
    activity = current_user.activities.new(activity_params)
    activity.save!
    render json: { status: 'OK', message: 'Aktivitas berhasil ditambahkan.'}
  end

  private

  def activity_params
    params.permit(:title, :description, :start_at, :end_at, :tag_list)
  end
end
