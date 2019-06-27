class GithubClientApiService

  def initialize
    @api_url = "https://api.github.com"
    @client = HTTPClient.new
  end

  def get_repositories(type, name)
    url = "#{@api_url}/#{type}/#{name}/repos"
    response = @client.get_content(URI.encode(url))
    JSON.parse(response)
  rescue Exception => e
    return []     
  end

  def search_repositories(query)
    url = "#{@api_url}/search/repositories?q=#{query}"
    response = @client.get_content(URI.encode(url))
    JSON.parse(response)['items']
  rescue Exception => e
    return []  
  end  
end