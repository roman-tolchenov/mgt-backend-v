module mgt
import math.fractions {fraction, approximate}
import math {powi}

pub struct Hit {
pub:
    duration Qn
    velocity u8 = 127
    start_offset Qn = qn(0)
    duration_offset Qn = qn(0)
    undotted_duration Qn = qn(0)
    ndots u8
}

pub fn (h Hit) str() string {
    return 'Hit(d: $h.duration, v: $h.velocity)'
}

pub fn (h Hit) dot() Hit {
    udur := if h.ndots == 0 {h.duration} else {h.undotted_duration}
    ndots := h.ndots + 1
    dur := udur.qn * (approximate(2.0) - fraction(1, powi(2, ndots)))
    return Hit{
        duration: Qn{qn: dur.reduce()},
        velocity: h.velocity,
        start_offset: h.start_offset,
        duration_offset: h.duration_offset,
        undotted_duration: udur,
        ndots: ndots
    }
}

pub fn (h Hit) tuplet(number_of u32, in_space_of u32) Hit {
    if number_of == 0 || in_space_of == 0 {
        panic('tuplet number_of, in_space_of must both be >= 1, found ${number_of}, ${in_space_of}')
    }
    if h.ndots != 0 {
        panic('Cannot make tuplet from a dotted Hit')
    }
    dur := h.duration.qn * fraction(in_space_of, number_of)
    return Hit{
        duration: Qn{qn: dur.reduce()},
        velocity: h.velocity,
        start_offset: h.start_offset,
        duration_offset: h.duration_offset,
        undotted_duration: h.undotted_duration,
        ndots: h.ndots
    }
}

pub fn (h Hit) triplet() Hit {
    return h.tuplet(3, 2)
}
