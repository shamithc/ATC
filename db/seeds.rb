# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or find_or_create_by_name!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.find_or_create_by_name!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.find_or_create_by_name!(name: 'Emanuel', city: cities.first)
 # Role.find_or_create_by_name!(:name => 'Admin')
   # Role.find_or_create_by_name!(:name => 'Manager') 
   # Role.find_or_create_by_name!(:name => 'Employee')
puts 'Brand'

Brand.find_or_create_by_name!(name: 'Acc')
Brand.find_or_create_by_name!(name: 'Ambuja')
Brand.find_or_create_by_name!(name: 'Ultratech')
Brand.find_or_create_by_name!(name: 'Chettynadu')

puts 'CallType'

CallType.find_or_create_by_name!(name: 'Hot')
CallType.find_or_create_by_name!(name: 'Warm')
CallType.find_or_create_by_name!(name: 'Cold')

puts 'Followup'

Followup.find_or_create_by_name!(name: 'check1')
Followup.find_or_create_by_name!(name: 'check2')
Followup.find_or_create_by_name!(name: 'check3')


puts 'SiteNature'

SiteNature.find_or_create_by_name!(name: 'Independent house')
SiteNature.find_or_create_by_name!(name: 'Building')
SiteNature.find_or_create_by_name!(name: 'Flat')
SiteNature.find_or_create_by_name!(name: 'Shopping center')
SiteNature.find_or_create_by_name!(name: 'Bridge')
SiteNature.find_or_create_by_name!(name: 'Others')

puts 'Status'

Status.find_or_create_by_name!(name: 'Individual Customer')
Status.find_or_create_by_name!(name: 'Sub Dealer')
Status.find_or_create_by_name!(name: 'Cements Product Company')
Status.find_or_create_by_name!(name: 'Contractor')
Status.find_or_create_by_name!(name: 'Builder')
Status.find_or_create_by_name!(name: 'Others')



puts 'VisitedLocation'

VisitedLocation.find_or_create_by_name!(name: 'Office') 
VisitedLocation.find_or_create_by_name!(name: 'On Going Site') 

puts 'Roles'

Role.find_or_create_by_name!(name: 'Admin')
Role.find_or_create_by_name!(name: 'Manager')
Role.find_or_create_by_name!(name: 'Employee')


puts 'SaleStatus'

SaleStatus.find_or_create_by_name!(name: 'Live')
SaleStatus.find_or_create_by_name!(name: 'Won')
SaleStatus.find_or_create_by_name!(name: 'Lost')

puts 'PaymentType'
PaymentType.find_or_create_by_name!(name: 'Cash')
PaymentType.find_or_create_by_name!(name: 'Credit')