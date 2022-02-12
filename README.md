# README

After spinning up the app, generate some test posts for you...

```
10000.times do |n|
  Post.create(title: "Post #{n}", body: "This is a test post number: #{n}")
end
```
