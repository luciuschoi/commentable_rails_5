# Technote

## Polymorphic association

> **COC** :  
Polymorphic parent model => "~able"-like proxy model

## Generate Comment Model for Polymorphic Association

```
$ rails generate model Comment commentable:references{polymorphic} content:text
```

### Migration Class

```ruby
class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.text :content

      t.timestamps
    end
  end
end
```

### Schema after DB Migration

```ruby
create_table "comments", force: :cascade do |t|
  t.string   "commentable_type"
  t.integer  "commentable_id"
  t.text     "content"
  t.datetime "created_at",       null: false
  t.datetime "updated_at",       null: false
  t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
end
```

### Parent model

```ruby
class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
end
```

### Child model

```ruby
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
end
```

### Nested Resource Routing :

```ruby
Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments, only: [ :edit, :create, :update, :destroy ]
  end
end
```

### Generate Comments Controller with Some Actions

```
$ rails generate controller comments
```

#### Set Commentable Variable

```ruby
def set_commentable
  commentable_type, commentable_id = request.path.split("/")[1,2]
  @commentable = commentable_type.singularize.classify.constantize.find(commentable_id)
end
```

#### Set Comment Variable

```ruby
def set_comment
  @comment = @commentable.comments.find(params[:id])
end
```

#### Strong Parameters

```ruby
def comment_params
  params.require(:comment).permit( :content )
end
```

## Ajax

References: [Working with JavaScript in Rails](http://guides.rubyonrails.org/working_with_javascript_in_rails.html)

```coffee
$(document).on "turbolinks:load", ->
```

