class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
    render inertia: 'Home/Index.vue', props: {
      student: current_student,
      professor: current_professor
    }
  end
end
