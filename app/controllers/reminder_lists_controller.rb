class ReminderListsController < ApplicationController
  before_action :set_reminder_list, only: %i[ show edit update destroy ]

  # GET /reminder_lists or /reminder_lists.json
  def index
    @reminder_lists = ReminderList.all
  end

  # GET /reminder_lists/1 or /reminder_lists/1.json
  def show
  end

  # GET /reminder_lists/new
  def new
    @reminder_list = ReminderList.new
  end

  # GET /reminder_lists/1/edit
  def edit
  end

  # POST /reminder_lists or /reminder_lists.json
  def create
    @reminder_list = ReminderList.new(reminder_list_params)

    respond_to do |format|
      if @reminder_list.save
        format.html { redirect_to  reminder_lists_url, notice: "Reminder list was successfully created." }
        format.json { render :show, status: :created, location: @reminder_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reminder_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminder_lists/1 or /reminder_lists/1.json
  def update
    respond_to do |format|
      if @reminder_list.update(reminder_list_params)
        format.html { redirect_to reminder_lists_url, notice: "Reminder list was successfully updated." }
        format.json { render :show, status: :ok, location: @reminder_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reminder_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_lists/1 or /reminder_lists/1.json
  def destroy
    @reminder_list.destroy

    respond_to do |format|
      format.html { redirect_to reminder_lists_url, notice: "Reminder list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder_list
      @reminder_list = ReminderList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reminder_list_params
      params.require(:reminder_list).permit(:id, :description, :date, :isDone, :isOverDue)
    end
end
