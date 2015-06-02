note
	description: "Summary description for {CONTACT_EMAIL_SERVICE}."
	date: "$Date: 2015-01-14 12:30:05 -0300 (mi. 14 de ene. de 2015) $"
	revision: "$Revision: 96455 $"

class
	CONTACT_EMAIL_SERVICE

inherit
	EMAIL_SERVICE
		redefine
			initialize,
			parameters
		end

create
	make

feature {NONE} -- Initialization	

	initialize
		do
			Precursor
			contact_email := parameters.contact_email
		end

	parameters: CONTACT_EMAIL_SERVICE_PARAMETERS
			-- Associated parameters.		

feature -- Access		

	contact_email: IMMUTABLE_STRING_8
			-- Contact email.

feature -- Basic Operations

	send_contact_email (a_to, a_content: READABLE_STRING_8)
			-- Send successful contact message `a_token' to `a_to'.
		require
			attached_to: a_to /= Void
		do
			send_message (contact_email, a_to, parameters.contact_subject_text, a_content)
		end

end
