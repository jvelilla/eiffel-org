note
	description: "Summary description for {WDOCS_BOOKS_DATA}."
	date: "$Date: 2014-12-03 18:51:29 -0300 (mi. 03 de dic. de 2014) $"
	revision: "$Revision: 96236 $"

class
	WDOCS_BOOKS_DATA

inherit
	WDOCS_HELPER

create
	make

feature {NONE} -- Initialization

	make
		do
			create books.make (0)
		end

feature {WDOCS_DATA_ACCESS} -- Basic operation

	reset
		do
			books.wipe_out
		end

feature {WDOCS_DATA_ACCESS} -- Access

	books: ARRAYED_LIST [WIKI_BOOK]

feature {WDOCS_DATA_ACCESS} -- Query

	book (a_name: READABLE_STRING_GENERAL): detachable WIKI_BOOK
		do
			across
				books as ic
			until
				Result /= Void
			loop
				if a_name.is_case_insensitive_equal (ic.item.name) then
					Result := ic.item
				end
			end
		end

end
