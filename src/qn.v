module mgt
import math.fractions {Fraction, fraction, approximate}

pub struct Qn {
pub:
    qnotes Fraction
}

struct QnArgs {
    n i64 [required]
    d i64 = 1
}

// Make Qn from fraction elements: numerator and denominator
pub fn qnf(q QnArgs) Qn {
    return Qn{qnotes: fraction(q.n, q.d)}
}

// Make Qn from a float
pub fn qn(q f64) Qn {
    return Qn{qnotes: approximate(q)}
}

fn (q Qn) f64() f64 {
    return q.qnotes.f64()
}

pub fn (q Qn) str() string {
    return 'Qn(${q.qnotes})'
}

pub fn (q1 Qn) + (q2 Qn) Qn {
    return Qn{qnotes: q1.qnotes + q2.qnotes}
}

pub fn (q1 Qn) - (q2 Qn) Qn {
    return Qn{qnotes: q1.qnotes - q2.qnotes}
}

pub fn (q1 Qn) * (q2 Qn) Qn {
    return Qn{qnotes: q1.qnotes * q2.qnotes}
}

pub fn (q1 Qn) / (q2 Qn) Qn {
    return Qn{qnotes: q1.qnotes / q2.qnotes}
}
