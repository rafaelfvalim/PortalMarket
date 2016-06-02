# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#member = Member.create ([{ }])
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
# Create Banks
puts '---CREATE MEMBERTYPES-----'
CreateMemberTypesService.new.call

puts '---CREATE BANKS-----'
CreateBanksService.new.call

puts '---CREATE MEMBERS-----'
CreateMembersService.new.call(user)

puts '---CREATE PAY METHODS-----'
CreatePayMethodsService.new.call

puts '---CREATE CURRENCIES-----'
CreateCurrenciesService.new.call

puts '---CREATE INVOICES-----'
CreateInvoiceStatusesService.new.call

puts '---CREATE STATUSES-----'
CreateStatusesService.new.call

puts '---CREATE SYSTEMS-----'
CreateSystemsService.new.call

puts '---CREATE COMPLEXITIES-----'
CreateComplexitiesService.new.call