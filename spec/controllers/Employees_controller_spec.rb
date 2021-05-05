# Example:
# describe EmployeesController, type: :controller do
#   it "index returns a success response" do
#     get '/employees'
#     expect(response.status).to eq 200
#     pp response.body
#   end
#
#   it "show returns a success response" do
#     Employee.create(id: 1) unless Employee.find_by(id: 1) # TODO: set up factory_bot
#     get '/employees/:id', id: 1
#     expect(response.status).to eq 200
#     pp response.body
#   end
# end
