note
	description: "Summary description for {EIFFEL_COMMUNITY_SITE_SERVICE}."
	date: "$Date: 2015-04-30 05:45:25 -0300 (ju. 30 de abr. de 2015) $"
	revision: "$Revision: 97218 $"

deferred class
	EIFFEL_COMMUNITY_SITE_SERVICE

inherit
	WSF_SERVICE

	SHARED_LOGGER

	REFACTORING_HELPER

feature	-- Initialization

	initialize_application
		local
			l_layout: like new_layout
		do
			l_layout := new_layout

				-- Initialize logging facility
			initialize_logger (l_layout)
			layout := l_layout
			initialize_cms (cms_setup (l_layout))
		end

	new_layout: like layout
		local
			args: ARGUMENTS_32
			l_dir: detachable READABLE_STRING_32
			i,n: INTEGER
		do
				--| Arguments
			args := execution_environment.arguments
			from
				i := 1
				n := args.argument_count
			until
				i > n or l_dir /= Void
			loop
				if attached args.argument (i) as s then
					if s.same_string_general ("--directory") or s.same_string_general ("-d") then
						if i < n then
							l_dir := args.argument (i + 1)
						end
					end
				end
				i := i + 1
			end

			if l_dir = Void then
				create Result.make_default
			else
				create Result.make_with_path (create {PATH}.make_from_string (l_dir))
			end
		end

feature -- Access: CMS

	cms_service: CMS_SERVICE

	layout: CMS_LAYOUT

feature -- Implementation: CMS

	initialize_cms (a_setup: CMS_SETUP)
		do
			write_debug_log (generator + ".initialize_cms")
			setup_modules (a_setup)
			create cms_service.make (a_setup)
		end

	cms_setup (a_layout: CMS_LAYOUT): EIFFEL_COMMUNITY_SITE_CMS_SETUP
		do
			create Result.make (a_layout)
			setup_storage (Result)
		end

	setup_modules (a_setup: CMS_SETUP)
		local
			m: CMS_MODULE
		do
			create {BASIC_AUTH_MODULE} m.make
			if not a_setup.module_with_same_type_registered (m) then
				m.enable
				a_setup.register_module (m)
			end

			create {LOGIN_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			create {CONTACT_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			create {WDOCS_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			create {EIFFEL_COMMUNITY_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			create {EIFFEL_DOWNLOAD_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			create {CODEBOARD_MODULE} m.make
			m.enable
			a_setup.register_module (m)

			debug
				create {CMS_DEBUG_MODULE} m.make
				m.enable
				a_setup.register_module (m)
			end
		end

	setup_storage (a_setup: CMS_SETUP)
		do
			a_setup.storage_drivers.force (create {CMS_STORAGE_MYSQL_BUILDER}.make, "mysql")
		end

feature	-- Execution

	execute (req: WSF_REQUEST; res: WSF_RESPONSE)
			-- Execute the request
			-- See `req.input' for input stream
    		--     `req.meta_variables' for the CGI meta variable
			-- and `res' for output buffer
		do
			cms_service.execute (req, res)
		end

end
