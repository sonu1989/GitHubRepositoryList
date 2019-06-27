class HomeController < ApplicationController
  
  def index
    github_service = GithubClientApiService.new
    if params[:listing_repo].present?
      if params[:listing_repo][:search]
        @results =  github_service.search_repositories(params[:listing_repo][:search])
        @search_checked = "checked"
      end
      if params[:listing_repo][:name].present? && params[:listing_repo][:list_type].present?
        @results =  github_service.get_repositories(params[:listing_repo][:list_type], params[:listing_repo][:name])
        @list_checked = "checked"
      end
    end
  end
end
  