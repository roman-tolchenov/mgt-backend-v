module mgt
import math.fractions {fraction, approximate}

fn test_fraction() {
    f := fraction(1, 2)
    assert '${f}' == '1/2'
    assert f.n == 1
    assert f.d == 2
}

fn test_fraction_reduce() {
    f := fraction(2, 4)
    assert f.n == 2
    assert f.d == 4
    g := f.reduce()
    assert g.n == 1
    assert g.d == 2
}

fn test_approximate() {
    f := approximate(0.5)
    assert f.n == 1
    assert f.d == 2
    f1 := approximate(0.3)
    assert f1.n == 3
    assert f1.d == 10
    f2 := approximate(0.3333333333333)
    assert f2.n == 1
    assert f2.d == 3
    assert '${f2}' == '1/3'
}

fn test_convert_to_float() {
    q := qnf(n: 1, d: 2)
    assert q.f64() == 0.5
    q1 := qnf(n: 2)
    assert q1.f64() == 2.0
}

fn test_add_fractions() {
    q1 := qnf(n: 1, d: 2)
    q2 := qnf(n: 1, d: 2)
    q := q1.qnotes + q2.qnotes
    assert q.f64() == 1.0
}

fn test_qn() {
    q1 := qn(0.5)
    assert q1.f64() == 0.5
    assert q1.qnotes.n == 1
    assert q1.qnotes.d == 2
    q2 := qn(1.0/3.0)
    assert q2.qnotes.n == 1
    assert q2.qnotes.d == 3
}

fn test_str() {
    q := qn(0.5)
    assert q.str() == 'Qn(1/2)'
}

fn test_add() {
    q1 := qn(0.5)
    q2 := qn(0.25)
    q := q1 + q2
    assert q == qn(0.75)
}

fn test_sub() {
    assert qn(0.5) - qn(0.25) == qn(0.25)
    assert qn(0.25) - qn(0.5) == qn(-0.25)
}

fn test_mul() {
    assert qn(0.5) * qn(1.25) == qn(5.0/8.0)
}

fn test_div() {
    assert qn(0.5) / qn(1.25) == qn(2.0/5.0)
}
