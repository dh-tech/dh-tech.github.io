require 'json'
require 'fileutils'

module Jekyll
  class AndyGenerator < Jekyll::Generator

    SEARCH_INDEX_NAME = "search-index.js"
    LIST_FILE = "catalog.json"
    IDX_TEMPLATE_STRING = "lunr_index.add({ url: '{#id}', title: {#title}, body: {#body}})"

    def generate(site)
      return if site.pages.empty?

      js_file_name = File.expand_path(File.join(File.dirname(__FILE__), "search-index.js"))

      js_file = open(js_file_name)
      js_content = js_file.read

      index_entries = [js_content]
      json_entries = []
      site.collections["workshops"].each_with_index do |post, index|
        
        entry = IDX_TEMPLATE_STRING.sub "{#id}", post.url
        entry.sub! "{#title}", post.title.to_json
        entry.sub! "{#body}", post.content.to_json
        index_entries << entry

        json_entries << "{ \"title\":"  + post.title.to_json + ", \"url\":\"" + post.url + "\", \"excerpt\":"  + post.excerpt.to_json + " }"
      end

      site.collections["blog"].each_with_index do |post, index|
        
        entry = IDX_TEMPLATE_STRING.sub "{#id}", post.url
        entry.sub! "{#title}", post.title.to_json
        entry.sub! "{#body}", post.content.to_json
        index_entries << entry

        json_entries << "{ \"title\":"  + post.title.to_json + ", \"url\":\"" + post.url + "\", \"excerpt\":"  + post.excerpt.to_json + " }"
      end

      site.posts.docs.each_with_index do |post, index|
        
        entry = IDX_TEMPLATE_STRING.sub "{#id}", post.url
        entry.sub! "{#title}", post.title.to_json
        entry.sub! "{#body}", post.content.to_json
        index_entries << entry

        json_entries << "{ \"title\":"  + post.title.to_json + ", \"url\":\"" + post.url + "\", \"excerpt\":"  + post.excerpt.to_json + " }"
      end
      

      posts_dir = File.dirname(".")
      assets_dir = File.expand_path(posts_dir + "/assets")
      
      generated_js_file = assets_dir + "/js/" + SEARCH_INDEX_NAME
      FileUtils.mkdir_p assets_dir + "/js/"

      g_js_file = File.open generated_js_file, "w"
      g_js_file.puts index_entries.join("\n")

      g_js_file.close

      # create entries
      json_file = File.open assets_dir + "/js/" + LIST_FILE, "w"
      json_file.puts "[" + json_entries.join(",") + "]"
      json_file.close
    end
  end
end
