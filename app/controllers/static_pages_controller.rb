class StaticPagesController < ApplicationController
  def home    
  end

  def download
    # colors = {
    #   :primary_color => "materialize-red",
    #   :primary_color_tone => "lighten-2",
    #   :secondary_color => "teal",
    #   :secondary_color_tone => "lighten-1",
    #   :success_color => "green",
    #   :success_color_tone => "base",
    #   :error_color => "red",
    #   :error_color_tone => "base",
    #   :link_color => "light-blue",
    #   :link_color_tone => "darken-1",
    # }
    colors = {
      :primary_color => request.GET.fetch('primary_color', "materialize-red"),
      :primary_color_tone => request.GET.fetch('primary_color_tone', "lighten-2"),
      :secondary_color => request.GET.fetch('secondary_color', "teal"),
      :secondary_color_tone => request.GET.fetch('secondary_color_tone', "lighten-1"),
      :success_color => request.GET.fetch('success_color', "green"),
      :success_color_tone => request.GET.fetch('success_color_tone', "base"),
      :error_color => request.GET.fetch('error_color', "red"),
      :error_color_tone => request.GET.fetch('error_color_tone', "base"),
      :link_color => request.GET.fetch('link_color', "light-blue"),
      :link_color_tone => request.GET.fetch('link_color_tone', "darken-1"),
    }
    puts colors
    batata = render_to_string :file => Rails.root.join('materialize-src', 'sass', 'materialize.scss'), :locals => colors, :layout => false
    batata_comp = Sass::Engine.new(batata, :syntax => :scss, :load_paths => [Rails.root.join('materialize-src', 'sass')]).render
    send_data(batata_comp,
      :filename => 'materialize.css',
      :type => "text/css")
  end
end
