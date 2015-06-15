class Link < ActiveRecord::Base
  belongs_to :linkable, polymorphic: true
  belongs_to :user
end

class Section < ActiveRecord::Base
  has_many :links, as: :linkable, dependent: :destroy

  belongs_to :project
end

class Snippet < ActiveRecord::Base
  belongs_to :section
end

class AddPolymorphismToLinks < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.references :linkable, polymorphic: true, index: true
    end

    # Copy all snippets into links
    Snippet.all.each do |snippet|
      Link.create(title: snippet.title, excerpt: snippet.excerpt, url: snippet.url, linkable: snippet.section, user: snippet.section.project.user)
    end

    # Get rid of snippets
    drop_table :snippets
  end
end
