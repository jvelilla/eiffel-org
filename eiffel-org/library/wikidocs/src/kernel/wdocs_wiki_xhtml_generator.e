note
	description: "Summary description for {WDOCS_WIKI_XHTML_GENERATOR}."
	author: ""
	date: "$Date: 2014-12-03 12:12:08 -0300 (mi. 03 de dic. de 2014) $"
	revision: "$Revision: 96232 $"

class
	WDOCS_WIKI_XHTML_GENERATOR

inherit
	WIKI_XHTML_GENERATOR
		redefine
			page_title
		end

create
	make

feature -- Setting

	overridden_title: detachable READABLE_STRING_8

feature -- Page processing

	visit_page_with_title (a_page: WIKI_PAGE; a_title: READABLE_STRING_8)
		do
			overridden_title := a_title
			visit_page (a_page)
			overridden_title := Void
		end

feature -- Helper

	page_title (a_page: WIKI_PAGE): STRING_8
			-- Title for page `a_page'.
		do
			if attached overridden_title as t then
				Result := t
			else
				Result := a_page.title
			end
		end

end
