# require libraries/modules here
require "pry"
require "nokogiri"



def create_project_hash

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  # projects: kickstarter.css("li.project.grid_4")

  binding.pry
end

create_project_hash
