-- Resolve website links without changing local image paths used by Pandoc.
local site = 'https://dh-tech.github.io'

local function normalize(path)
  local parts = {}
  for part in path:gmatch('[^/]+') do
    if part == '..' then
      table.remove(parts)
    elseif part ~= '.' then
      parts[#parts + 1] = part
    end
  end
  local result = '/' .. table.concat(parts, '/')
  if path:match('/$') and result ~= '/' then
    result = result .. '/'
  end
  return result
end

function Pandoc(doc)
  local page = pandoc.utils.stringify(doc.meta.url or '')
  if page == '' then
    error('PDF link resolution requires the post URL in metadata')
  end
  -- Hugo server may emit localhost URLs; retain the post path, not its host.
  page = page:gsub('^https?://[^/]+', '')
  page = page:match('^[^?#]*')
  if page:sub(1, 1) ~= '/' then
    page = '/' .. page
  end
  doc.meta.url = pandoc.MetaString(site .. page)
  local directory = page:match('^(.*)/') .. '/'

  return doc:walk({
    Link = function(link)
      local target = link.target
      if target == '' or target:match('^#') or target:match('^[%a][%w+.-]*:') then
        return nil
      end
      if target:match('^//') then
        link.target = 'https:' .. target
      else
        local path, suffix = target:match('^([^?#]*)(.*)$')
        if path == '' then
          path = page
        elseif path:sub(1, 1) ~= '/' then
          path = directory .. path
        end
        link.target = site .. normalize(path) .. suffix
      end
      return link
    end,
  })
end
