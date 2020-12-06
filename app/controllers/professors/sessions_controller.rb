module Professors
  class SessionsController < Devise::SessionsController
    def create
      professor = Professor.find_by(email: params[:user][:email])

      return render json: { error: 'Wrong Password' } unless professor.valid_password?(params[:user][:password])

      sign_in(:professor, professor)

      render json: { status: true }
    end

    def destroy
      sign_out(current_professor)
    end
  end
end
