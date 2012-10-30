# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 # Role.create(:name => 'Admin')
   # Role.create(:name => 'Manager') 
   # Role.create(:name => 'Employee')
puts 'Brand'

Brand.create(name: 'Acc')
Brand.create(name: 'Ambuja')
Brand.create(name: 'Ultratech')
Brand.create(name: 'Chettynadu')

puts 'CallType'

CallType.create(name: 'Hot')
CallType.create(name: 'Warm')
CallType.create(name: 'Cold')

puts 'Followup'

Followup.create(name: 'check1')
Followup.create(name: 'check2')
Followup.create(name: 'check3')


puts 'SiteNature'

SiteNature.create(name: 'Independent house')
SiteNature.create(name: 'Building')
SiteNature.create(name: 'Flat')
SiteNature.create(name: 'Shopping center')
SiteNature.create(name: 'Bridge')
SiteNature.create(name: 'Others')

puts 'Status'

Status.create(name: 'Individual Customer')
Status.create(name: 'Sub Dealer')
Status.create(name: 'Cements Product Company')
Status.create(name: 'Contractor')
Status.create(name: 'Builder')
Status.create(name: 'Others')



puts 'VisitedLocation'

VisitedLocation.create(name: 'Office') 
VisitedLocation.create(name: 'On Going Site') 

puts 'Roles'

Role.create(name: 'Admin')
Role.create(name: 'Manager')
Role.create(name: 'Employee')