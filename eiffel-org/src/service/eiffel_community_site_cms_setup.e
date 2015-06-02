note
	description: "Summary description for {EIFFEL_COMMUNITY_SITE_CMS_SETUP}."
	author: ""
	date: "$Date: 2015-01-16 07:17:14 -0300 (vi. 16 de ene. de 2015) $"
	revision: "$Revision: 96467 $"

class
	EIFFEL_COMMUNITY_SITE_CMS_SETUP

inherit
	CMS_DEFAULT_SETUP
		redefine
			initialize_modules
		end

create
	make

feature {NONE} -- Initialization		

	initialize_modules
		do
			create modules.make (3)
		end

end
