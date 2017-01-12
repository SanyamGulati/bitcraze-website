require 'jekyll'
require 'test/testbase'

require 'src/_plugins/media'

class TestMedia < Testbase

  def test_that_img_is_rendered
    # Fixture
    tag = '{% img The title; narrow; /images/fancy-product-front.jpg %}'

    expected = '<div class="media-row-narrow">
        <img src="/images/fancy-product-front.jpg" alt="The title" title="The title"/>
      </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_img_is_rendered_with_circle
    # Fixture
    tag = '{% img The title; narrow; /images/fancy-product-front.jpg; circle-border %}'

    expected = '<div class="media-row-narrow">
        <img src="/images/fancy-product-front.jpg" alt="The title" title="The title" class="img-circle-border"/>
      </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_vine_is_rendered
    # Fixture
    tag = '{% vine vine-id %}'
    expected = '<div class="media-row-medium">
                  <div class="outer-vine">
                    <iframe class="inner-vine vine-embed" src="https://vine.co/v/vine-id/embed/simple"></iframe>
                    <script src="//platform.vine.co/static/scripts/embed.js"></script>
                  </div>
                </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_youtube_is_rendered
    # Fixture
    tag = '{% youtube id; narrow; 16by9 %}'
    expected = '<div class="media-row-narrow">
                  <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/id" allowfullscreen></iframe>
                  </div>
                </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_map_is_rendered
    # Fixture
    tag = '{% map id; wide %}'
    expected = '<div class="media-row-wide">
                    <div class="embed-responsive embed-responsive-1by1">
                        <iframe class="embed-responsive-item-medium" src="https://www.google.com/maps/embed?pb=id" allowfullscreen="allowfullscreen"></iframe>
                    </div>
                </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_used_by_text_is_rendered
    # Fixture
    tag = '{% used_by_text company %}'
    expected = '<div class="col-xs-3 col-sm-2 col-md-2 used_by_box_text">company</div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_used_by_text_is_rendered_with_link
    # Fixture
    tag = '{% used_by_text company; http://the.url %}'
    expected = '<div class="col-xs-3 col-sm-2 col-md-2 used_by_box_text"><a href="http://the.url" target="_blank">company</a></div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_used_by_logo_is_rendered
    # Fixture
    tag = '{% used_by_logo company; my_image %}'
    expected = '<div class="col-xs-3 col-sm-2 col-md-2 used_by_box">
                  <img class="img-responsive" src="my_image" alt="company" title="company"/>
                </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end


  def test_that_used_by_logo_is_rendered_with_link
    # Fixture
    tag = '{% used_by_logo company; my_image; http://the.url %}'
    expected = '<div class="col-xs-3 col-sm-2 col-md-2 used_by_box">
                  <a href="http://the.url" target="_blank">
                    <img class="img-responsive" src="my_image" alt="company" title="company"/>
                  </a>
                </div>'

    # Test
    actual = Liquid::Template.parse(tag).render

    # Assert
    assert_html(expected, actual)
  end
end
