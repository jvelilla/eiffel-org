note
	description: "[
			Persistence interface for CONTACT_MODULE.
		]"
	author: "$Author: jfiat $"
	date: "$Date: 2015-05-22 18:00:09 -0300 (vi. 22 de may. de 2015) $"
	revision: "$Revision: 97349 $"

deferred class
	CONTACT_STORAGE_I

feature -- Error Handling

	error_handler: ERROR_HANDLER
			-- Error handler.
		deferred
		end

feature -- Access

feature -- Change

	save_contact_message (m: CONTACT_MESSAGE)
		deferred
		end

end
