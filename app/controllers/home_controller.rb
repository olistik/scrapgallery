class HomeController < ApplicationController
  def index
    @template = Transloadit::TemplateRepository.find(:s3_thumbnail).signed
  end
end
