# img_replace.rb

img_replace was made on the assumption that it is used by Vim.

img_replace is to achieve the following.

* img_replace change from HTML img tag to Rails image_tag.
* img_replace change from CSS background image url to Rails image-url.

## require img_replace.rb for Vim
```
vim test.erb
:ruby require 'img_replace.rb path'
```
## Example

### HTML img tag to Rails image_tag.

```
#Args
#first: replace from text
#second: replace to text

:rubydo $_ = $_.to_image_tag('/img/', '')
```
Before
```
<img src="/img/test.png" width="10" height="14" class="test" alt="" />
```

After
```
<%= image_tag "test.png", width: "10", height: "14", class: "test", alt: "" %>
```

