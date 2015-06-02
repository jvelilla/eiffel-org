note
	description: "Summary description for {APP_CMS_LAYOUT}."
	author: ""
	date: "$Date: 2015-03-11 18:42:32 -0300 (mi. 11 de mar. de 2015) $"
	revision: "$Revision: 96814 $"

class
	APP_CMS_LAYOUT

inherit
	CMS_LAYOUT
		redefine
			cms_config_ini_name
		end

create
	make_default,
	make_with_path,
	make_with_directory_name

feature -- Access	

	cms_config_ini_name: STRING
		do
			Result := "app.ini"
		end

end
