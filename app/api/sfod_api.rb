class SfodAPI

  attr_reader :approved

  def initialize
    @url = "https://data.sfgov.org/resource/6a9r-agq8.json"
    @response = ""
    @approved = []
  end

  def get_json_response
    @response = HTTParty.get(@url).parsed_response
  end

  def get_only_approved
    @response.each do |x|
      @approved.push(x) if x["status"] == "APPROVED"
    end
  end

  def parse_schedule(stringgy)
    # "Mo/Tu/We/Th/Fr:7AM-8AM;Mo/Mo/Tu/Tu/We:9AM-11AM;Su:9AM-2PM;Sa:9AM-3PM;Mo/Mo/Tu/Tu/We:11AM-1PM;Mo-Fr:"
    stringgy = stringgy.split(";")
  end
end
