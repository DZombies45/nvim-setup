local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Header level 1
  s("h1", fmt("# {}", { i(1, "Judul") })),

  -- Header level 2
  s("h2", fmt("## {}", { i(1, "Subjudul") })),

  -- Link
  s("link", fmt("[{}]({})", { i(1, "teks"), i(2, "url") })),

  -- Gambar
  s("img", fmt("![{}]({})", { i(1, "alt"), i(2, "gambar.png") })),

  -- Kode blok
  s("code", fmt("```{}\n{}\n```", { i(1, "js"), i(2, "// kode di sini") })),

  -- Checklist
  s("todo", fmt("- [ ] {}", { i(1, "task") })),

  -- Bold dan italic
  s("bold", fmt("**{}**", { i(1, "teks") })),
  s("italic", fmt("*{}*", { i(1, "teks") })),
  
  -- Gambar mc setting
  s("imcbapi", fmt("![{}](https://i.imgur.com/3ufQ6D7.jpeg)", { i(1, "beta api") })),
}