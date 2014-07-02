require 'mail'
class SpikeMailsController < ApplicationController
  before_action :set_spike_mail, only: [:show, :edit, :update, :destroy]

  # GET /spike_mails
  # GET /spike_mails.json
  def index
    # mail = Mail.new do
    #   from    'zx_new@126.com'
    #   to      'almazhou0303@gmail.com'
    #   subject 'This is a test email'
    #   body    "some simple body"
    # end
    # mail.to_s =~ /Message\-ID: <[\d\w_]+@.+.mail/
    # mail.deliver!

    Mail.defaults do
      retriever_method :pop3, :address    => "pop.gmail.com",
      :port       => 995,
      :user_name  => 'almazhou0303@gmail.com',
      :password   => '88534650',
      :enable_ssl => true
    end
    emails = Mail.find(:what => :first, :count => 1, :order => :asc)
    # emails = Mail.last
    print "yes,yes,yes!!!!!!!!!!!!!!!!!!!!!!!!!"
    # print emails.length
    print emails.from_addrs
    print "yes,yes,yes!!!!!!!!!!!!!!!!!!"
    print emails.to_addrs
     print "yes,yes,yes!!!!!!!!!!!!!!!!!!"
     print emails.subject
    print "yes,yes,yes!!!!!!!!!!!!!!!!!!"
    # print emails.convert_to_multipart
    print "yes,yes,yes!!!!!!!!!!!!!!!!!!"
    print emails.text_part.body.decoded
    print "yes,yes,yes!!!!!!!!!!!!!!!!!!"
    if(emails.to_addrs.eql?("almazhou0303@gmail.com"))
      puts emails.subject.split('will').join(".")
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