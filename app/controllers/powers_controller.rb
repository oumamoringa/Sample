class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Power.all, status: :ok
    end

    def show
        power = Power.find(params[:id])
        render json: power, status: :ok
    end

    def update
        power = Power.find(params[:id])
        power.update!(power_params)

        render json: power, status: :ok
    end

    private
    def record_not_found
        render json: {error: "Power not found"}, status: 404
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def power_params
        params.permit(:name, :description)
    end
end
