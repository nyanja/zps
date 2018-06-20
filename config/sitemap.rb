# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://xn----7sbucdachfe5bh1a3dyi.xn--p1ai"

SitemapGenerator::Sitemap.create do
  Article.find_each do |article|
    add "/#{article.slug}", lastmod: article.updated_at
  end
  Category.find_each do |category|
    add "/#{category.slug}", lastmod: category.updated_at
  end
end
