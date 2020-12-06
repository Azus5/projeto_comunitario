module Professors
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_devise_params, except: [:index]

    def new
      render inertia: 'Registrations/Form.vue', props: {
        professor: true
      }
    end

    def create
      return render json: { status: false } if Professor.find_by(email: sign_up_params[:email]).present?

      professor = Professor.create(sign_up_params)
      sign_in(:professor, professor)
      render json: { status: true }
    end

    protected

    def configure_devise_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    end
  end
end
