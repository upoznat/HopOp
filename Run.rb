#!/bin/env ruby
# encoding: utf-8


$: << File.dirname(__FILE__)

require 'gosu'
require 'rubygems'
require 'scripts/GameWindow.rb'
require 'scripts/Player.rb'
require 'scripts/Text.rb'
require 'scripts/Text2.rb'
require 'scripts/BlueBird.rb'
require 'scripts/Bird.rb'
require 'scripts/Banana.rb'
include Gosu

window=GameWindow.new
window.show
