note
	description: "Summary description for {WDOCS_CONFIG}."
	date: "$Date: 2014-10-20 17:45:32 -0300 (lu. 20 de oct. de 2014) $"
	revision: "$Revision: 95957 $"

deferred class
	WDOCS_CONFIG

feature -- Access

	root_dir: PATH

	temp_dir: PATH

	documentation_dir: PATH

	documentation_default_version: STRING

	cache_duration: INTEGER

feature -- Element change

	set_root_dir (p: like root_dir)
		do
			root_dir := p
		end

	set_temp_dir (p: like temp_dir)
		do
			temp_dir := p
		end

	set_documentation_dir (p: like documentation_dir)
		do
			documentation_dir := p
		end

	set_documentation_default_version (v: like documentation_default_version)
		do
			documentation_default_version := v
		end

	set_cache_duration (d: like cache_duration)
		do
			cache_duration := d
		end

end
