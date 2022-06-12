module Rhino
  class Page < ApplicationRecord
    has_many :blocks
    has_one :publishedpage
    validates :url, presence: true
    validates :title, presence: true

    def get_title
      self.title.blank? ? "(untitled)" : self.title
    end
    def publish!
      create_publishedpage! if self.publishedpage.nil?
      self.publishedpage.update(url: self.url, content: self.render_content, page_id: self.id, title: self.get_title, seo_title: self.seo_title)
      Rails.application.reload_routes!
    end
    def create_publishedpage!
      Publishedpage.create(url: self.url, content: self.render_content, page_id: self.id, title: self.get_title, seo_title: self.seo_title)
      self.reload!
    end
    def render_content
      #PagesController.show
      self.blocks.pluck(:content).join('')
    end

  end
end
