class HeroPowersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    # to be deleted
    def index
        render json: HeroPower.all
    end

    def create
        hero_power = HeroPower.create!(hero_power_params)
        render json: hero_power.hero, status: :created, serializer: HeroAndTheirPowersSerializer
    end

    private
    def hero_power_params
        params.permit(:strength, :hero_id, :power_id)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
