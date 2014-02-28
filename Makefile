VERSION=v`cat STABLE`

website_dirs = \
	out/doc \
	out/doc/api/ \
	out/doc/api/assets \
	out/doc/about \
	out/doc/video \
	out/doc/community \
	out/doc/download \
	out/doc/logos \
  out/doc/resources \
	out/doc/images

doc_images = $(addprefix out/,$(wildcard doc/images/* doc/*.jpg doc/*.png))

website_files = \
	out/doc/index.html    \
	out/doc/v0.4_announcement.html   \
	out/doc/cla.html      \
	out/doc/sh_main.js    \
	out/doc/sh_javascript.min.js \
	out/doc/sh_vim-dark.css \
	out/doc/sh.css \
	out/doc/favicon.ico   \
	out/doc/pipe.css \
	out/doc/about/index.html \
	out/doc/video/index.html \
	out/doc/community/index.html \
	out/doc/download/index.html \
	out/doc/resources/index.html \
	$(doc_images)

doc: $(website_dirs) $(website_files) blog

blogclean:
	rm -rf out/blog

blog: doc/blog tools/blog
	node tools/blog/generate.js doc/blog/ out/blog/ doc/blog.html doc/rss.xml

$(website_dirs):
	mkdir -p $@

out/doc/%.html: doc/%.html
	cat $< | sed -e 's|__VERSION__|'$(VERSION)'|g' > $@

out/doc/%: doc/%
	cp -r $< $@

blog-upload: blog
	rsync -r out/blog/ node@nodejs.org:~/web/nodejs.org/blog/

website-upload: doc
	rsync -r out/doc/ node@nodejs.org:~/web/nodejs.org/

release: website-upload blog-upload
	rsync -r out/doc/ node@nodejs.org:~/web/nodejs.org/dist/$(VERSION)/docs/

docopen: out/doc/api/all.html
	-google-chrome out/doc/api/all.html

docclean:
	-rm -rf out/doc

clean: docclean

.PHONY: clean docopen docclean doc all website-upload blog blogclean
