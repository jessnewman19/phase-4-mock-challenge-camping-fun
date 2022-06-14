class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    # def index 
    #     render json: Signup.all
    # end

    def create 
        signup = Signup.create!(signup_params)
        activity = Activity.find(signup.activity_id)
        render json: activity, status: :created
    end

    private 

    def signup_params 
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: 422
    end
end
