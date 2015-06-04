note
	description: "Objects that represent the Vision2 application.%
		%The original version of this class has been generated by EiffelBuild."
	generator: "EiffelBuild"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2015-03-19 07:19:33 -0300 (ju. 19 de mar. de 2015) $"
	revision: "$Revision: 96873 $"

class
	WDOCS_APP

inherit
	EV_APPLICATION

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Create `Current', build and display `main_window',
			-- then launch the application.
		local
			l_win: like main_window
			l_embeded_services: WDOCS_APP_EMBEDDED_WEB_SERVICE
		do
			create l_embeded_services.make

			default_create
			create l_win.make (l_embeded_services.layout)
			main_window := l_win
			l_win.show

			l_embeded_services.set_port_number (0) -- Use first available port number

			l_embeded_services.on_launched_actions.force (agent on_web_service_launched (l_win))
			l_embeded_services.request_exit_operation_actions.force (agent on_quit)
			l_embeded_services.launch
			launch
		end

	on_quit
		do
			if attached main_window as win then
				win.destroy_and_exit_if_last
			end
		end

	on_web_service_launched (a_win: attached like main_window)
		do
			add_idle_action_kamikaze (agent a_win.on_web_service_ready)
		end

feature {NONE} -- Implementation

	main_window: detachable WDOCS_WINDOW
		-- Main window of `Current'

;note
	copyright:	"Copyright (c) 1984-2009, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"


end