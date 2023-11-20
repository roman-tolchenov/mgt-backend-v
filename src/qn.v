module mgt
import math.fractions {Fraction, fraction, approximate}

pub struct Qn {
pub:
    qn Fraction
}

struct QnArgs {
    n i64 @[required]
    d i64 = 1
}

// Make Qn from fraction elements: numerator and denominator
pub fn qnf(q QnArgs) Qn {
    return Qn{qn: fraction(q.n, q.d)}
}

// Make Qn from a float
pub fn qn(q f64) Qn {
    return Qn{qn: approximate(q)}
}

fn (q Qn) f64() f64 {
    return q.qn.f64()
}

pub fn (q Qn) str() string {
    return 'Qn(${q.qn})'
}

pub fn (q1 Qn) + (q2 Qn) Qn {
    return Qn{qn: q1.qn + q2.qn}
}

pub fn (q1 Qn) - (q2 Qn) Qn {
    return Qn{qn: q1.qn - q2.qn}
}

pub fn (q1 Qn) * (q2 Qn) Qn {
    return Qn{qn: q1.qn * q2.qn}
}

pub fn (q1 Qn) / (q2 Qn) Qn {
    return Qn{qn: q1.qn / q2.qn}
}
