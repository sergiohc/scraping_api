class Api::V1::SocarroesController < Api::V1::ApiController
  
  def index
    agent = Mechanize.new
    page = agent.get("https://www.socarrao.com.br/curitiba-regiao/?termo=#{params[:term]}&regiao=#{params[:region]}&tipo=#{params[:type]}.2&distancia=100")
    review = page.search(".card-vehicle")
    item = { 
      titulo: review[0].css('.title').text,
      sub_titulo: review[0].css('.subtitle').text,
      ano: review[0].css('.date').children[0].text,
      preco: review[0].css('.price').children[0].text,
      kilometragem: review[0].css('.mileage').children[0].text,
      combustivel: review[0].css('.fuel').children[0].text,
      local: review[0].css('.location').text,
      tipo_venda: review[0].css('.seller-type').text
    }
    
    page_detail = agent.get("https://www.socarrao.com.br/curitiba-regiao/curitiba/carros/volkswagen/gol/2017/flex/cambio-manual/branca/3948678")
    

    render json: item.to_json
  end

  private
  
  def socarroes_params
    params.permit(:term, :region, :type)
  end
end