module mgt


fn test_pitch_letters() {
    assert 'D' in pitch_letters
    assert 'X' !in pitch_letters
}

fn test_pitch_class() {
    d := DD{}
    assert d.alt == []
    f := FF{[.sharp]}
    assert f.alt == [.sharp]
    // b := BBB{alt: [.flat]}
}
