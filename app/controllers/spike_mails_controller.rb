
class SpikeMailsController < ApplicationController
  before_action :set_spike_mail, only: [:show, :edit, :update, :destroy]

  # GET /spike_mails
  # GET /spike_mails.json
  def index
    email_content = MailHelper.read_mail
    print "#"*50
    print email_content[:subject]
    print "%"*50
    request_list = ExtractMailHelper.extract_leave_list(email_content[:subject])

    # employee_post_params = {:employee => {:employee_id => 3, :name => 'name', :email => 'email@thoughtworks.com', :phone => '13012345678'}, :format => :json}
    # PostHelper.post_to_endpoint("http://localhost:3000/employees/upload",employee_post_params)

   
    request_list.each do |request|
    request_post_params = {:employee_id => 1, :leave_request => request,:format => :json}
    PostHelper.post_to_endpoint("http://localhost:3000/employees/1/leave_requests",request_post_params)
    end

    @spike_mails = SpikeMail.all
  end

  # GET /spike_mails/1
  # GET /spike_mails/1.json
  def show
  end

  # GET /spike_mails/new
  def new
    @spike_mail = SpikeMail.new
  end

  # GET /spike_mails/1/edit
  def edit
  end

  # POST /spike_mails
  # POST /spike_mails.json
  def create
    @spike_mail = SpikeMail.new(spike_mail_params)

    respond_to do |format|
      if @spike_mail.save
        format.html { redirect_to @spike_mail, notice: 'Spike mail was successfully created.' }
        format.json { render :show, status: :created, location: @spike_mail }
      else
        format.html { render :new }
        format.json { render json: @spike_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spike_mails/1
  # PATCH/PUT /spike_mails/1.json
  def update
    respond_to do |format|
      if @spike_mail.update(spike_mail_params)
        format.html { redirect_to @spike_mail, notice: 'Spike mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @spike_mail }
      else
        format.html { render :edit }
        format.json { render json: @spike_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spike_mails/1
  # DELETE /spike_mails/1.json
  def destroy
    @spike_mail.destroy
    respond_to do |format|
      format.html { redirect_to spike_mails_url, notice: 'Spike mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spike_mail
      @spike_mail = SpikeMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spike_mail_params
      params[:spike_mail]
    end
  end
