require "sinatra/frank/version"
require "sinatra/base"

module Sinatra
  module Frank
    module Helpers
      def render_with(template, opts={})
        erb(:"#{template}", { layout: :layout }.merge(opts))
      end

      def partial(template, opts={})
        parts = template.split('/')
        last  = "_#{parts.pop}"
        erb([parts, last].flatten.join('/').to_sym, {layout: false}.merge(opts))
      end

      def url_for(*models)
        '/' + models.map do |m|
          [m.class.name.pluralize.downcase, m.to_param]
        end.join('/')
      end

      def time_in_words(time)
        s = Time.now.to_i - time.to_i

        x = if s > 29030400
          [(s/29030400), 'years']
        elsif s > 2419200
          [(s/2419200), 'months']
        elsif s > 604800
          [(s/604800), 'weeks']
        elsif s > 86400
          [(s/86400), 'days']
        elsif s > 3600
          [(s/3600), 'hours']
        elsif s > 60
          [(s/60), 'minutes']
        else
          [s, 'seconds']
        end

        if x[0] == 1
          x.join(' ')[0...-1]
        else
          x.join(' ')
        end
      end
    end

    module HoneyPot
      def honey_pot_param(param)
        before { halt(403, "Something went wrong") if params && params[param] }
      end
    end
  end

  helpers Frank::Helpers
  register Frank::HoneyPot
end
