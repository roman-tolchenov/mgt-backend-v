module main

struct Seconds {
pub:
    value f64
}

fn (t Seconds) str() string {
    return '${t.value} sec'
}

fn (t Seconds) f64() f64 {
    return t.value
}

fn main() {
    t := Seconds{12}
    s := t.f64()
    println('Hello World! ${t}, $s')
}
