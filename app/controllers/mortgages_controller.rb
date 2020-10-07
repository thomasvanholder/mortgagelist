class MortgagesController < ApplicationController

  def index
    if params[:ltv].present? && params[:duration].present?
      @mortgages = Mortgage.where(ltv: params[:ltv], duration: params[:duration])
    elsif params[:ltv].present?
      @mortgages = Mortgage.where(ltv: params[:ltv], duration: 10)
    elsif params[:duration].present?
      @mortgages = Mortgage.where(ltv: 80, duration: params[:duration])
    else
      @mortgages = Mortgage.where(duration: 10, ltv: 80)
    end
  end

end
