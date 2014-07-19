xml.urlset(version: '1.0', encoding: 'UTF-8', xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9') do
  @posts.each do |post|
    xml.url do
      xml.loc        @site_url + post_path(post)
      xml.lastmod    post.updated_at.strftime('%FT%TTZD')
      xml.changefreq 'always'
      xml.priority    0.6
    end
  end
end