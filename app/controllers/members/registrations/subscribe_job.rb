class Members::RegistrationsController::SubscribeJob < ActiveJob::Base
	queue_as :default
	require 'gibbon'

	def perform(member)
        @member = member
        gibbon = Gibbon::Request.new(api_key: "a36eb6b7f8545edd6e029a78dcd8dca2-us4")
        gibbon.timeout = 10
        gibbon.lists("3cbbdd4ba2").members.create(
    	body:{
    		email_address: member.email,
    		status: 'subscribed',
    		merge_fields: {FNAME: member.first_name, LNAME: member.last_name}
    	})
	end
end