module mgt

enum Alteration {
    sharp
    flat
    natural
}

const pitch_letters = ['C', 'D', 'E', 'F', 'G', 'A', 'B']
const alteration_lookup = {'b': Alteration.flat, '#': Alteration.sharp, 'n': Alteration.natural}

pub struct PitchLetter {
    alt []Alteration
}

pub struct CC {
    alt []Alteration
}

pub struct DD {
    alt []Alteration
}

pub struct EE {
    alt []Alteration
}

pub struct FF {
    alt []Alteration
}

pub struct GG {
    alt []Alteration
}

pub struct AA {
    alt []Alteration
}

pub struct BB {
    alt []Alteration
}

pub struct BBB {
    BB
}

type PitchClass = CC | DD | EE | FF | GG | AA | BB
