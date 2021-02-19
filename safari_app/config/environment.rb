require 'bundler/setup'
Bundler.require
ActiveRecord::Base.logger = nil

require_all 'lib/models'
require_all 'lib'