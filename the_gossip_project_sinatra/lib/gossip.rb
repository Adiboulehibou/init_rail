require 'bundler'
Bundler.require
# require 'csv'
# require 'pry'


class Gossip
  attr_accessor :author, :content, :array

  def initialize(author_name, content_string)
    @author = "#{author_name}"
    @content = "#{content_string}"
  end


  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [ "#{@author}", "#{@content}"]
      #csv << ["Mon super auteur", "Ma super description"]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id_array_gossips)
    array = self.all
    return array[id_array_gossips.to_i]
  end

  # def self.update

  # end
end

#binding.pry