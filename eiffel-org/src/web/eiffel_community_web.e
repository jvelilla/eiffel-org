note
	description: "[
				application service
			]"
	date: "$Date: 2015-02-09 18:34:30 -0300 (lu. 09 de feb. de 2015) $"
	revision: "$Revision: 96597 $"

class
	EIFFEL_COMMUNITY_WEB

inherit
	WSF_LAUNCHABLE_SERVICE
		redefine
			initialize
		end

	EIFFEL_COMMUNITY_SITE_SERVICE

	APPLICATION_LAUNCHER

	REFACTORING_HELPER

create
	make_and_launch

feature {NONE} -- Initialization

	initialize
			-- Initialize current service.
		do
			Precursor
				-- Default listening port for standalone nino connector: 9090
			set_service_option ("port", 9090)

				-- Options can be set in ewf.ini config file
			create {WSF_SERVICE_LAUNCHER_OPTIONS_FROM_INI} service_options.make_from_file ("ewf.ini")

			initialize_application
		end

end

