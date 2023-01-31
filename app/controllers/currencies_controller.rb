class CurrenciesController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    render ({ :template => "currency_templates/step_one.html.erb"})

   end

   def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @from_symbol = params.fetch("from_currency")


    render({:template =>"currency_templates/step_two.html.erb"})

   end


  def result

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @from_symbol = params.fetch("from_currency")
    @to_symbol =params.fetch("to_currency")


    @rate_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}").read
    @parsed_rate_data = JSON.parse(@rate_data)
    @convert_hash = @parsed_rate_data.fetch("info")
    @rate_key = @convert_hash.fetch("rate")
    

    render({:template =>"currency_templates/step_result.html.erb"})

  end




end
