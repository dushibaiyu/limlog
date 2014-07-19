# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Post.create(
  title: 'Limlog Demo Post',
  slug: 'limlog2-demo-post',
  body: <<-markdown,
Head1
===

Head2
---

### head3
markdown
  category_id: 1
)

Category.create(
  name: 'Default',
  slug: 'default',
  desc: 'Default category'
)

User.create(
  account: 'root',
  email: 'limlog@limlog.org',
  password: 'limlog'
)