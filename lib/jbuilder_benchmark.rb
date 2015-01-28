require 'benchmark'
require 'jbuilder'
require 'json'

class O
  def initialize(options = {})
    options.each do |key, value|
      (class << self; self; end).class_eval do
        define_method key, Proc.new {value}
      end
    end
  end
end

MultiJson.use :oj

data = O.new({
  a: "This is some blah blah blah!",
  b: "abc123",
  c: "abc123",
  d: "abc123",
  e: "abc123",
  f: "abc123",
  g: "abc123",
  h: "abc123",
  i: "abc123",
  j: "abc123",
  k: "abc123",
  l: "abc123",
  m: "abc123",
  n: "abc123",
  o: "abc123",
  p: "abc123",
  q: "abc123",
  r: "abc123",
  s: "abc123",
  t: "abc123",
  u: "abc123",
  v: "abc123",
  w: "abc123",
  x: "abc123",
  y: "abc123",
  z: 1526623,
})

datas = Array.new(1000, data)

puts "What is faster for one item?"

Benchmark.bm(100) do |bm|
  bm.report("json.(data, :a)") {
    Jbuilder.encode do |json|
      json.(data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z)
    end
  }

  bm.report("json.extract! data, :a") {
    Jbuilder.encode do |json|
      json.extract! data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z
    end
  }

  bm.report("json.a data.a") {
    Jbuilder.encode do |json|
      json.a data.a
      json.b data.b
      json.c data.c
      json.d data.d
      json.e data.e
      json.f data.f
      json.g data.g
      json.h data.h
      json.i data.i
      json.j data.j
      json.k data.k
      json.l data.l
      json.m data.m
      json.n data.n
      json.o data.o
      json.p data.p
      json.q data.q
      json.r data.r
      json.s data.s
      json.t data.t
      json.u data.u
      json.v data.v
      json.w data.w
      json.x data.x
      json.y data.y
      json.z data.z
    end
  }

  bm.report("json.set! :a, data.a") {
    Jbuilder.encode do |json|
      json.set! :a, data.a
      json.set! :b, data.b
      json.set! :c, data.c
      json.set! :d, data.d
      json.set! :e, data.e
      json.set! :f, data.f
      json.set! :g, data.g
      json.set! :h, data.h
      json.set! :i, data.i
      json.set! :j, data.j
      json.set! :k, data.k
      json.set! :l, data.l
      json.set! :m, data.m
      json.set! :n, data.n
      json.set! :o, data.o
      json.set! :p, data.p
      json.set! :q, data.q
      json.set! :r, data.r
      json.set! :s, data.s
      json.set! :t, data.t
      json.set! :u, data.u
      json.set! :v, data.v
      json.set! :w, data.w
      json.set! :x, data.x
      json.set! :y, data.y
      json.set! :z, data.z
    end
  }
end

puts "\nWhat is faster for an array of items?"
Benchmark.bm(100) do |bm|
  bm.report("json.array! datas do |data|") {
    Jbuilder.encode do |json|
      json.array! datas do |data|
        json.extract! data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z
      end
    end
  }

  bm.report("json.array! datas, :a") {
    Jbuilder.encode do |json|
      json.array! datas, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z
    end
  }

  # Note that this case cases the json to be {"datas" => [ array_data ]} instead of [ array_data ] as the pervious two do
  bm.report("json.datas datas.each do |data|") {
    Jbuilder.encode do |json|
      json.datas datas.each do |data|
        json.extract! data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z
      end
    end
  }
end


