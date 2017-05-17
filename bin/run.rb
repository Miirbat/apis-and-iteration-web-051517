#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"


def star_wars_api
  welcome
  character = get_character_from_user
  if individual_character(character) == "No"
    puts "Not a real character"
    star_wars_api
  else
    show_character_movies(character)
  end
end

star_wars_api

#
