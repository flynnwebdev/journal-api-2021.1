class EntriesController < ApplicationController
  # before_action :authenticate
  before_action :set_entry, except: [:index, :create]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  def index
    render json: Entry.order(updated_at: :desc)
  end

  def show
    render json: @entry
  end

  def create
    render json: Entry.create(entry_params), status: :created
  end

  def update
    if @entry.update(entry_params)
        render json: @entry
    else
        render json: { error: "Failed to update entry" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @entry.destroy
        render status: :no_content
    else
        render json: { error: "Failed to destroy entry" }, status: :unprocessable_entity
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.permit(:category_id, :content)
  end
end
