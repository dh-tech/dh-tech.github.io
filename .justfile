# create pdf from blog post by short id, e.g.
# 	just pdf dhtech-on-django
pdf post:
    #!/usr/bin/env bash
    set -euo pipefail
    # get configured site url from hugo config
    base_url=$(hugo config | grep '^baseurl' | cut -d = -f2 | tr -d "' ")
    # list hugo content to get full path to source and built files
    hugo_page=$(hugo list all | grep "content/blog/.*{{post}}")
    # TODO: error if zero, error if multiple?
    url=$(echo ${hugo_page} | cut -d , -f 8 -)
    source_path=$(echo ${hugo_page} | cut -d , -f 1 -)
    # path to file in local build
    path="public${url#"$base_url"}index.md"
    # create the pdf adjacent to the post, replacing .md extension with .pdf
    output_path="${source_path%".md"}.pdf" 
    echo "Creating PDF from ${path}"
    # run pandoc to generate the pdf
    pandoc ${path} -o ${output_path} --template tools/eisvogel-dhtech-2.latex --resource-path=static/ 
    echo "Output is in ${output_path}"    

