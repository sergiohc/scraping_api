class Api::V1::SocarroesController < Api::V1::ApiController
  
  def index
    render json: 'aqui'
  end

  private
  
  def params
    params.permit(:term, :region, :type, :city)
  end
end