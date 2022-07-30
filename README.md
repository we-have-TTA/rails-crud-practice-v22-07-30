# rails CRUD practice

## rails new {name}

1. 建立專案
    * `$ rails new {project_name}`
    * `$ cd {project_name}`

## Book (CRUD)

2. 建立路徑
    * in routes.rb
      * `resources :books`

3. 建立 Controller
    * `$ rails g controller Books`

4. 建立 actions
5. 建立 templates

6. 建立 Model
    * `$ rails g model Book title content:text price:integer`
      * title:string
      * content:text
      * price:integer

7. 建立 `_form`
```ruby=
<%= form_for book do |f| %>
  書名
  <%= f.text_field :title %>
  內容
  <%= f.text_area :content %>
  價格
  <%= f.number_field :price %>
  <%= f.submit %>
<% end %>
```

8. 建立新增頁面 `new.html.erb`
```ruby=
<h1>新增一本書</h1>
<%= render 'form', book: @book %>
```

9. 建立 `Controller` 內的 `action : index new create show edit delete`
    * 驗證 `app/models/book.rb`

    ```ruby=
    validates :title, presence: true
    ```
    * 資料清洗 `app/controllers/books_controllers.rb`

    ```ruby=
    def book_params
      params.require(:book).permit(:title, :content, :price)
    end
    ```
    
    * 抽出尋找特定`id`的方法

    ```ruby=
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    private
    def find_book
      @book = Book.find_by(id: params[:id])
      redirect_to books_path if @book.nil?
    end
    ```
