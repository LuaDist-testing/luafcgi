-- This file was automatically generated for the LuaDist project.

package = "luafcgi"
version = "1.1.0-1"
-- LuaDist source
source = {
  tag = "1.1.0-1",
  url = "git://github.com/LuaDist-testing/luafcgi.git"
}
-- Original source
-- source = {
--    url = "git://github.com/mbalmer/luafcgi",
--    tag = "fcgi-1.1.0",
-- }
description = {
   summary = "FastCGI Binding for Lua",
   detailed = [[
FastCGI Binding for Lua
]],
   homepage = "http://github.com/mbalmer/luafcgi",
   license = "3-clause BSD"
}
dependencies = {
   "lua >= 5.1, < 5.3"
}
external_dependencies = {
   FCGI = {
      library = "fcgi"
   }
}
build = {
   type = "builtin",
   modules = {
      fcgi = {
         incdirs = {
            "$(FCGI_INCDIR)"
         },
         libdirs = {
            "$(FCGI_LIBDIR)"
         },
         libraries = {
            "fcgi"
         },
         sources = "luafcgi.c"
      }
   }
}