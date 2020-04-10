require 'benchmark'

class RenderControllerTest < ActionDispatch::IntegrationTest
  N = 1_000
  test "views reply correctly" do
    get "/view_rails"
    assert_response :success
    assert_match "Hello Rails", response.body

    get "/view_cells"
    assert_response :success
    assert_match "Hello Cells", response.body

    get "/view_mixed"
    assert_response :success
    assert_match "Hello Mixed", response.body
  end

  test "benchmark bm" do
    puts "-" * 50
    puts "Benchmark BM"
    puts "-" * 50

    Benchmark.bmbm do |x|
      x.report("rails") { N.times do get "/view_rails"; end }
      x.report("cells")  { N.times do get "/view_cells"; end }
      x.report("mixed") { N.times do get "/view_mixed"; end }
    end

    puts ""
  end

  test "benchmark ips" do
    puts "-" * 50
    puts "Benchmark IPS"
    puts "-" * 50

    Benchmark.ips do |x|
      # These parameters can also be configured this way
      x.time = 5
      x.warmup = 2
    
      x.report("rails") { N.times do get "/view_rails"; end }
      x.report("cells") { N.times do get "/view_cells"; end }
      x.report("mixed") { N.times do get "/view_mixed"; end }
    
      x.compare!
    end

    puts ""
  end

  test "benchmark memory" do
    puts "-" * 50
    puts "Benchmark Memory"
    puts "-" * 50

    Benchmark.memory do |x|
      x.report("rails") { N.times do get "/view_rails"; end }
      x.report("cells") { N.times do get "/view_cells"; end }
      x.report("mixed") { N.times do get "/view_mixed"; end }
    
      x.compare!
    end

    puts ""
  end
end
