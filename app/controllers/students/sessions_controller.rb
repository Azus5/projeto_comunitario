module Students
  class SessionsController < Devise::SessionsController
    def create
      student = Student.find_by(email: params[:user][:email])

      return render json: { error: 'Wrong Password' } unless student.valid_password?(params[:user][:password])

      sign_in(:student, student)

      render json: { status: true }
    end

    def destroy
      sign_out(current_student)
    end
  end
end
