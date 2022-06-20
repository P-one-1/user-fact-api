class Api::V1::FactsController < ApplicationController
	before_action :set_fact, except: %w(index create)

	# GET /facts
	def index
		@facts = Fact.all
		render json: @facts
	end

	# GET /fact/:id
	def show
		render json: @fact
	end

	# POST /facts
	def create
		@fact = fact.new(fact_params)
		if @fact.save
			render json: @fact
		else
			render error: { error: 'Unable to create fact.' }, status: 400
		end
	end

	# PUT /facts/:id
	def update
		if @fact
			@fact.update(fact_params)
			render json: { message: 'Successfully updated.' }, status: 200
		else
			render json: { error: 'Unable to update fact.' }, status: 400
		end
	end

	# DELETE /facts/:id
	def destroy
		if @fact
			@fact.destroy(fact_params)
			render json: { message: 'Successfully destroyed.' }, status: 200
		else
			render json: { error: 'Unable to destroy fact.' }, status: 400
		end
	end

	private

	def fact_params
		params.require(:fact).permit(:fact, :likes, :user_id)
	end

	def set_fact
		@fact = Fact.find(params[:id])
	end
end
