note
	description: "Summary description for {DOWNLOAD_CONFIGURATION}."
	date: "$Date: 2014-10-23 01:03:41 -0300 (ju. 23 de oct. de 2014) $"
	revision: "$Revision: 95979 $"

class
	DOWNLOAD_CONFIGURATION


feature -- Access

	mirror: detachable READABLE_STRING_32
		-- url mirror.

	products: detachable LIST[DOWNLOAD_PRODUCT]
		-- Possible list of product downloads.

feature -- Element Change

	set_mirror (a_mirror: like mirror)
			-- Set `mirror' with `a_mirror'.
		do
			mirror := a_mirror
		ensure
			mirror_set: mirror = a_mirror
		end

	set_products (a_products: like products)
			-- Possible list of product downloads.			
		do
			products := a_products
		end
end
