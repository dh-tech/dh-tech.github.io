function Image(el)
	el.src = el.src:gsub("^/", "")
	el.attributes["width"] = el.attributes["width"] or "100%"
	return el
end

function Para(el)
	if #el.content == 1 and el.content[1].t == "Image" then
		return pandoc.RawBlock(
			"latex",
			"\\begin{figure}[H]\n\\centering\n"
				.. "\\includegraphics[width=\\linewidth]{"
				.. el.content[1].src
				.. "}\n"
				.. "\\end{figure}"
		)
	end
end
