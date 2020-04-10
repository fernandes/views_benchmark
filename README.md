# Rails View Rendering Benchmark

Look at `config/routes.rb` we have

- /view_rails : normal, default rails view rendering
- /view_cells : using cells, for the cell AND for the layout
- /view_mixed : mixed is using the cell for content body and layout using using rails default

How it's implemented? Check the [RenderController](app/controllers/render_controller.rb)

How to see the benchmark? Run `rails test`, the [render_controller_test](test/controllers/render_controller_test.rb) get you covered

## Results

If you are interested just on the results (running on my machine), here they are:

```
--------------------------------------------------
Benchmark BM
--------------------------------------------------
Rehearsal -----------------------------------------
rails   2.750953   2.235961   4.986914 (  4.996258)
cells   2.549889   2.156076   4.705965 (  4.721742)
mixed   2.897262   2.273330   5.170592 (  5.209021)
------------------------------- total: 14.863471sec

            user     system      total        real
rails   2.912803   2.373839   5.286642 (  5.349272)
cells   2.737984   2.307924   5.045908 (  5.065361)
mixed   2.883690   2.286618   5.170308 (  5.191370)


--------------------------------------------------
Benchmark Memory
--------------------------------------------------
Calculating -------------------------------------
               rails   108.585M memsize (    13.839k retained)
                         1.192M objects (   112.000  retained)
                        50.000  strings (    24.000  retained)
               cells   107.436M memsize (    13.455k retained)
                         1.147M objects (   108.000  retained)
                        50.000  strings (    24.000  retained)
               mixed   114.624M memsize (    13.479k retained)
                         1.225M objects (   107.000  retained)
                        50.000  strings (    24.000  retained)

Comparison:
               cells:  107436120 allocated
               rails:  108584520 allocated - 1.01x more
               mixed:  114624280 allocated - 1.07x more


--------------------------------------------------
Benchmark IPS
--------------------------------------------------
Warming up --------------------------------------
               rails     1.000  i/100ms
               cells     1.000  i/100ms
               mixed     1.000  i/100ms
Calculating -------------------------------------
               rails      0.199  (± 0.0%) i/s -      1.000  in   5.012585s
               cells      0.214  (± 0.0%) i/s -      2.000  in   9.345005s
               mixed      0.206  (± 0.0%) i/s -      2.000  in   9.686874s

Comparison:
               cells:        0.2 i/s
               mixed:        0.2 i/s - 1.04x  slower
               rails:        0.2 i/s - 1.07x  slower

```