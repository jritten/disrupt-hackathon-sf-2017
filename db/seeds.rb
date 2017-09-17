Gig.destroy_all
Kid.destroy_all
Parent.destroy_all
Volunteer.destroy_all

volunteer = Volunteer.create!(
  username: 'volunteer', 
  name: 'Rebecca Black', 
  age: '25', 
  phone: '1234567890', 
  hometown: 'Irvine, CA', 
  qualifications: 'CPR/First Aid/AED', 
  description: "it's Friday.", 
  email: 'rebecca@black.com', 
  password: 'password')

parent = Parent.create!(
  username: 'parent',
  name: 'Bob Saget', 
  phone: '1098765432', 
  location: 'San Francisco, CA', 
  email: 'bob@saget.com', 
  password: 'password')

# gig = Gig.create!(
#   date: '09/17/2017', 
#   start_time: '08:30', 
#   end_time: '09:00', 
#   parent: parent, 
#   volunteer: volunteer)

# kid = Kid.create!(
#   name: 'bobby', 
#   age: '10', 
#   location: 'Oakland, CA', 
#   specific_needs: 'none', 
#   parent: parent, 
#   gig: gig)