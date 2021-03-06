require_relative '../forms/newsletter_form'
require_relative '../workers/start_newsletter_worker'
class NewslettersController < ApplicationController

  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    @newsletter_form = NewsletterForm.new(Newsletter.new())
    @newsletter_form.filters = []
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter_form = NewsletterForm.new(Newsletter.new(newsletter_params))

    respond_to do |format|
      if @newsletter_form.validate(newsletter_params)
        @newsletter_form.save
        format.html { redirect_to newsletters_path, notice: 'Newsletter was successfully created.' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    @newsletter_form = NewsletterForm.new(@newsletter)

    respond_to do |format|
      if @newsletter_form.validate(newsletter_params)
        @newsletter_form.save
        format.html { redirect_to newsletters_path, notice: 'Newsletter was successfully updated.' }
        format.json { render :show, status: :ok, location: @newsletter }
      else
        format.html { render :edit }
        format.json { render json: @newsletter_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
      @newsletter_form = NewsletterForm.new(@newsletter)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(
        :name,
        :text,
        :start_at,
        filters: [
          :prop_name,
          :logic,
          :value
        ]
      )
    end
end
