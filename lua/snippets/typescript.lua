-- ~/.config/nvim/lua/snippets/typescript.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local function uuid()
  local random = math.random
  local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
  return string.gsub(template, "[xy]", function(c)
    local v = (c == "x") and random(0, 15) or random(8, 11)
    return string.format("%x", v)
  end)
end

local function generateParams(args, _, old_state)
  return sn(nil, {
    c(1, {
      sn(nil, {
        t(" * @param {"), i(1, "type"), t("} "), i(2, "name"), t(" - "), i(3, "description"),
        t({"", ""}),
        d(4, generateParams, {}, {user_args = {}, restore_cursor = false}),
      }),
      sn(nil, {
        t(" * @property {"), i(1, "type"), t("} "), i(2, "name"), t(" - "), i(3, "description"),
        t({"", ""}),
        d(4, generateParams, {}, {user_args = {}, restore_cursor = false}),
      }),
      t(""), -- kosong kalau user gak mau param/property
    })
  })
end

return {
  -- uuid generator
  s("uuid", f(function() return uuid() end)),

  -- import Minecraft server API
  s("impserver", fmt([[
import {} from "@minecraft/server";
]], { i(1, "{ world, system }") })),

  -- system.runInterval
  s("interval", fmt([[
system.runInterval(() => {{
  {}
}}, {});
]], {
    i(1, "// code here"),
    i(2, "20")
  })),

  -- world.sendMessage
  s("say", fmt([[
world.sendMessage("{}");
]], { i(1, "Hello world") })),

  -- event subscribe
  s("event", fmt([[
world.events.{}.subscribe((eventData) => {{
  {}
}});
]], {
    i(1, "playerJoin"),
    i(2, "// handle event")
  })),

  -- get player list
  s("players", fmt([[
const players = world.getAllPlayers();
players.forEach(player => {{
  {}
}});
]], { i(1, "// do something with player") })),

  -- command execution
  s("cmd", fmt([[
world.getDimension("overworld").runCommandAsync("{}");
]], { i(1, "say Hello") })),
  
  -- system run
  s("run", fmt([[
system.run(() => {{
  {}
}})
]], { i(1, "// code here")})),

  -- console.log
  s("log", fmt("console.log({});", { i(1, "msg") })),

  -- function declaration
  s("fn", fmt([[
function {}({}) {{
  {}
}}
]], {
    i(1, "name"),
    i(2, "params"),
    i(3, "// body")
  })
  ),

  -- arrow function
  s("afn", fmt([[
const {} = ({}) => {{
  {}
}};
]], {
    i(1, "fnName"),
    i(2, "params"),
    i(3, "// body")
  })
  ),

  -- import
  s("imp", fmt("import {} from '{}';", {
    i(1, "name"),
    i(2, "module")
  })),

  -- class
  s("cl", fmt([[
class {} {{
  constructor({}) {{
    {}
  }}

  {}() {{
    {}
  }}
}}
]], {
    i(1, "ClassName"),
    i(2, "params"),
    i(3, "// constructor body"),
    i(4, "method"),
    i(5, "// method body")
  })
  ),

  -- try/catch
  s("try", fmt([[
try {{
  {}
}} catch ({}) {{
  console.error({});
}}
]], {
    i(1, "// code"),
    i(2, "err"),
    i(3, "err")
  })
  ),
}
