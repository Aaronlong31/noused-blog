%w(rubygems sequel fileutils yaml active_support/inflector).each{|g| require g}

require File.join(File.dirname(__FILE__), "downmark_it")

module WordPress
    def self.import(database, user, password, table_prefix = "wp", host = 'localhost')
        db = Sequel.mysql(database, :user => user, :password => password, :host => host, :encoding => 'utf8')

        query = <<-EOS
            SELECT post_title, post_name, post_date, post_content, post_excerpt, ID, guid, post_status, post_type, post_status
            FROM #{table_prefix}_posts AS post, #{table_prefix}_terms term, 
                #{table_prefix}_term_relationships tr,
                #{table_prefix}_term_taxonomy AS t
            WHERE post_type =  'post'
            AND post.ID = tr.object_id
            AND t.term_taxonomy_id = tr.term_taxonomy_id
            AND term.term_id = t.term_id
            AND term.name = 'addToGitHub'
        EOS

        categories_and_tags_query = <<-EOS
            SELECT t.taxonomy, term.name, term.slug
            FROM #{table_prefix}_term_relationships AS tr
                INNER JOIN #{table_prefix}_term_taxonomy AS t ON t.term_taxonomy_id = tr.term_taxonomy_id
                INNER JOIN #{table_prefix}_terms AS term ON term.term_id = t.term_id
            WHERE tr.object_id = %d AND term.name != 'addToGitHub'
            ORDER BY tr.term_order
        EOS

        db[query].each do |post|
            title      = post[:post_title]
            slug       = post[:post_name]
            date       = post[:post_date]
            content    = DownmarkIt.to_markdown post[:post_content]
            status     = post[:post_status]
            name       = "%02d-%02d-%02d-%s.markdown" % [date.year, date.month, date.day, slug]
            categories = []
            post_tags  = []

            puts title

            db[categories_and_tags_query % post[:ID]].each do |category_or_tag|
                eval(category_or_tag[:taxonomy].pluralize) << category_or_tag[:name]
            end

            data = {
                'layout'        => 'post',
                'title'         => title.to_s,
                'excerpt'       => post[:post_excerpt].to_s,
                'wordpress_id'  => post[:ID],
                'wordpress_url' => post[:guid],
                'categories'    => categories,
                'tags'          => post_tags
            }.delete_if { |k,v| v.nil? || v == ''}.to_yaml

            File.open("#{status == 'publish' ? '_posts' : '_drafts'}/#{name}", "w") do |f|
                f.puts data
                f.puts "---"
                f.puts content
            end
        end
    end
end
