# require libraries/modules here
require "pry"
require "nokogiri"



def create_project_hash

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}
  # projects: kickstarter.css("li.project.grid_4")
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # location: project.css("span.location-name").text
  # percent funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i

  kickstarter.css("liprojects.grid_4").each { |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] ={
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  }

  p projects
end

create_project_hash
