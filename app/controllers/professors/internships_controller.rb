module Professors
  class InternshipsController < ApplicationController
    def index
      render inertia: 'Professors/Internships/Index.vue', props: {
        internships: Internship.where(professor_id: current_professor.id),
        professor: current_professor
      }
    end

    def new
      render inertia: 'Professors/Internships/Form.vue', props: {
        student: current_student,
        professor: current_professor
      }
    end

    def edit
      render inertia: 'Professors/Internships/Edit.vue', props: {
        student: current_student,
        professor: current_professor,
        internship: Internship.find_by(id: params[:id])
      }
    end

    def create
      intership_attr = internships_params
      intership_attr[:professor_id] = current_professor.id
      internship = Internship.create(intership_attr)

      render json: {
        status: true,
        internship: internship
      }
    end

    def destroy
      internship = Internship.find_by(id: params[:id])
      internship.destroy

      render json: {
        status: true
      }
    end

    def update
      internship = Internship.find_by(id: params[:id])
      internship.update(internships_params)

      render json: {
        status: true
      }
    end

    def internships_params
      params.required(:internships).permit(:occupation, :institution, :city, :state,
                                           :description, :benefits, :remuneration)
    end
  end
end
