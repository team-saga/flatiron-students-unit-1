Dir.foreach('lib') do |file|
              next if file.start_with?('.')
              require_relative '../lib/""' if file.end_with?('.rb')
            end