class HomeController < ApplicationController
  def index
    @zip_query = '20002'
    require 'net/http'
    require 'json'
    
    @description = "nashit"
    begin
      @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode='+ @zip_query +'&distance=0&API_KEY=E4F6B70C-9E31-4E4F-A20E-23D665FE22AE'
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @output = JSON.parse(@response)
    rescue
      @output
    end

    if @output.empty?
      @final_output = "Error"
    elsif !@output
      @final_output = "Error"
    else
      @final_output = @output[0]["AQI"]
    end

    if @final_output == "Error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "AQI: Good (0 - 50)<br/>
      Air quality is considered satisfactory, and air pollution poses little or no risk. "
    elsif @final_output <= 100
      @api_color = "yellow"
      @api_description = "AQI: Moderate (51 - 100)<br/>
      Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution. "
    elsif @final_output <=150
      @api_color = "orange"
      @api_description = "AQI: Unhealthy for Sensitive Groups (101 - 150)<br/>
      Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air. "
    elsif @final_output <=200
      @api_color = "red"
      @api_description = "AQI: Unhealthy (151 - 200)<br/>
      Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects. "
    elsif @final_output <=300
      @api_color = "purple"
      @api_description = "AQI: Very Unhealthy (201 - 300)<br/>
      Health alert: everyone may experience more serious health effects."
    elsif @final_output <=500
      @api_color = "maroon"
      @api_description = "AQI: Hazardous (301 - 500)<br/>
      Health warnings of emergency conditions. The entire population is more likely to be affected. "


    else
    
    end


  end
  def zipcode
     @zip_query = params[:zipcode]
     if params[:zipcode] == ""
       @zip_query = "Hey you forgot to enter the zipcode !"
     elsif params[:zipcode]
      require 'net/http'
      require 'json'
      
      @description = "nashit"
      begin
        @url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode='+ @zip_query +'&distance=0&API_KEY=E4F6B70C-9E31-4E4F-A20E-23D665FE22AE'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)
      rescue
        @output
      end
  
      if @output.empty?
        @final_output = "Error"
      elsif !@output
        @final_output = "Error"
      else
        @final_output = @output[0]["AQI"]
      end
  
      if @final_output == "Error"
        @api_color = "gray"
      elsif @final_output <= 50
        @api_color = "green"
        @api_description = "AQI: Good (0 - 50)<br/>
        Air quality is considered satisfactory, and air pollution poses little or no risk. "
      elsif @final_output <= 100
        @api_color = "yellow"
        @api_description = "AQI: Moderate (51 - 100)<br/>
        Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution. "
      elsif @final_output <=150
        @api_color = "orange"
        @api_description = "AQI: Unhealthy for Sensitive Groups (101 - 150)<br/>
        Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air. "
      elsif @final_output <=200
        @api_color = "red"
        @api_description = "AQI: Unhealthy (151 - 200)<br/>
        Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects. "
      elsif @final_output <=300
        @api_color = "purple"
        @api_description = "AQI: Very Unhealthy (201 - 300)<br/>
        Health alert: everyone may experience more serious health effects."
      elsif @final_output <=500
        @api_color = "maroon"
        @api_description = "AQI: Hazardous (301 - 500)<br/>
        Health warnings of emergency conditions. The entire population is more likely to be affected. "
  
  
      else
      
      end
     
     end
  end

  

 
end
