note
	description: "Summary description for {WDOCS_TIMELINE_EVENT}."
	author: ""
	date: "$Date: 2014-12-03 12:12:08 -0300 (mi. 03 de dic. de 2014) $"
	revision: "$Revision: 96232 $"

deferred class
	WDOCS_TIMELINE_EVENT

inherit
	COMPARABLE

feature -- Access

	event_summary: STRING_32
		deferred
		ensure
			not_new_line: not Result.has ('%N')
		end

	date: DATE_TIME
		deferred
		end

end
