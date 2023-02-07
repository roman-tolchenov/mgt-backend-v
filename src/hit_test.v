module mgt

fn test_hit() {
    h := Hit{duration: qn(1)}
    assert h.duration == qn(1)
    assert h.velocity == 127
    assert h.start_offset == qn(0)
    assert h.duration_offset == qn(0)
    assert h.str() == 'Hit(d: Qn(1/1), v: 127)'
}

fn test_copy() {
    h := Hit{duration: qn(1)}
    g := h
    assert g == h
    assert g.duration == qn(1)
    assert g.velocity == 127
    assert g.start_offset == qn(0)
    assert g.duration_offset == qn(0)
    assert g.str() == 'Hit(d: Qn(1/1), v: 127)'
}

struct AAA {
pub mut:
    x u8
}

fn test_copying() {
    mut a := AAA{x: 12}
    b := a
    assert a == b
    a.x = 42
    assert a != b
    assert a.x == 42
    assert b.x == 12
}

fn test_dot() {
    h := Hit{duration: qn(1)}
    h1 := h.dot()
    assert h1.duration == qn(1.5)
    h2 := h1.dot()
    assert h2.duration == qn(7.0/4.0)
    h3 := h2.dot()
    assert h3.duration == qn(15.0/8.0)
    assert h3.duration.f64() == 1.875
}

fn test_tuplet() {
    h := Hit{duration: qn(1)}
    t := h.tuplet(5, 4)
    assert t.duration == qn(0.8)
}

fn test_triplet() {
    h := Hit{duration: qn(1)}
    t := h.triplet()
    assert t.duration == qn(2.0/3.0)
}
