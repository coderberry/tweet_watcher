module TweetWatcherHelper
  def tweet_watcher(word, options={})
    options[:title]      = ''     if options[:title].blank?
    options[:subject]    = ''     if options[:subject].blank?
    options[:width]      = 200    if options[:width].blank?
    options[:height]     = 400    if options[:height].blank?
    options[:text_color] = '#444' if options[:text_color].blank?
    options[:link_color] = '#39c' if options[:link_color].blank?
    ret = <<-EOF
    <div class="twtr-widget" id="twtr-search-widget"></div>
    <script src="http://widgets.twimg.com/j/1/widget.js"></script>
    <link href="http://widgets.twimg.com/j/1/widget.css" type="text/css" rel="stylesheet">
    <script>
      new TWTR.Widget({
        search:'teachmetocode',
        id:'twtr-search-widget',
        loop:false,
        title:'#{options[:title]}',
        subject:'#{options[:subject]}',
        width:#{options[:width]},
        height:#{options[:height]},
        theme:{
          shell:{
            background:'transparent',
            color:'#{options[:link_color]}'
          },
          tweets:{
            background:'transparent',
            color:'#{options[:text_color]}',
            links:'#{options[:link_color]}'
          }
        }
      }).render().start();
    </script>
    EOF
    return ret
  end
end
